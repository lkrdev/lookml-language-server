import sqlite3 from "@vscode/sqlite3";
import fs from "fs";
import os from "os";
import path from "path";

let activeDb: sqlite3.Database | null = null;

async function getDb(): Promise<sqlite3.Database> {
  if (activeDb) {
    return activeDb;
  } else {
    // Ensure the directory ~/.lkr exists
    const homeDir = process.env.HOME || process.env.USERPROFILE || os.homedir();
    const lkrDir = path.join(homeDir, ".lkr");
    if (!fs.existsSync(lkrDir)) {
      fs.mkdirSync(lkrDir, { recursive: true });
    }
    const dbPath = path.join(lkrDir, "auth.db");
    try {
      activeDb = new sqlite3.Database(dbPath);
    } catch (error) {
      throw error;
    }
    await doTransaction(activeDb, [
      {
        sql: `
      CREATE TABLE IF NOT EXISTS auth (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      instance_name TEXT,
      access_token TEXT,
      refresh_token TEXT,
      refresh_expires_at TEXT,
      token_type TEXT,
      expires_at TEXT,
      current_instance BOOLEAN,
      base_url TEXT,
      use_production BOOLEAN
      )`,
        params: [],
      },
      {
        sql: "CREATE UNIQUE INDEX IF NOT EXISTS idx_auth_instance_name ON auth(instance_name)",
        params: [],
      },
    ]);
  }

  return activeDb;
}

function dbExec(db: sqlite3.Database, sql: string, ...params: any[]) {
  return new Promise((resolve, reject) => {
    db.run(sql, ...params, (err: Error | null) => {
      if (err) reject(err);
      else resolve(undefined);
    });
  });
}

function dbGet<T = any>(
  db: sqlite3.Database,
  sql: string,
  ...params: any[]
): Promise<T | undefined> {
  return new Promise((resolve, reject) => {
    db.get(sql, ...params, (err: Error | null, row: T | undefined) => {
      if (err) reject(err);
      else resolve(row);
    });
  });
}

function dbAll<T = any>(
  db: sqlite3.Database,
  sql: string,
  ...params: any[]
): Promise<T[]> {
  return new Promise((resolve, reject) => {
    db.all(sql, ...params, (err: Error | null, rows: T[]) => {
      if (err) reject(err);
      else resolve(rows);
    });
  });
}

async function doTransaction(
  db: sqlite3.Database,
  sqls: { sql: string; params: any[] }[]
) {
  return new Promise(async (resolve, reject) => {
    let error: Error | null = null;
    try {
      await dbExec(db, "BEGIN TRANSACTION");
    } catch (e) {
      error = e as Error;
    }
    for (var i = 0; i < sqls.length; i++) {
      const sql = sqls[i];
      if (!error) {
        try {
          await dbExec(db, sql.sql, ...sql.params);
        } catch (e) {
          error = e as Error;
        }
      }
    }
    if (!error) {
      await dbExec(db, "COMMIT");
      resolve(undefined);
    } else {
      await dbExec(db, "ROLLBACK");
      reject(error);
    }
  });
}

export interface AuthRecord {
  instance_name: string;
  access_token: string;
  refresh_token: string;
  refresh_expires_at: string;
  token_type: string;
  expires_at: string;
  current_instance: boolean;
  base_url: string;
  use_production: 1 | 0;
}

export async function setNewRefreshToken(
  instance_name: string,
  refresh_token: string
) {
  const db = await getDb();
  try {
    const refresh_expires_at = new Date(
      Date.now() + 1000 * 60 * 60 * 24 * 30
    ).toISOString();
    await doTransaction(db, [
      {
        sql: "UPDATE auth SET refresh_token = ?, refresh_expires_at = ? WHERE instance_name = ?",
        params: [refresh_token, refresh_expires_at, instance_name],
      },
    ]);
  } catch (error) {
    throw error;
  }
}

export async function saveAuthToken(record: AuthRecord) {
  const db = await getDb();
  try {
    const existing = await dbGet<AuthRecord>(
      db,
      "SELECT * FROM auth WHERE instance_name = ?",
      record.instance_name
    );

    if (existing) {
      await doTransaction(db, [
        {
          sql: `
        UPDATE auth SET
          access_token = ?,
          token_type = ?,
          expires_at = ?
        WHERE instance_name = ?`,
          params: [
            record.access_token,
            record.token_type,
            record.expires_at,
            record.instance_name,
          ],
        },
      ]);
    } else {
      const refresh_expires_at = record.refresh_token
        ? record.refresh_expires_at ||
          new Date(Date.now() + 1000 * 60 * 60 * 24 * 30).toISOString()
        : undefined;
      await doTransaction(db, [
        {
          sql: "UPDATE auth SET current_instance = 0 WHERE instance_name != ?",
          params: [record.instance_name],
        },
        {
          sql: `
      INSERT INTO auth (
        instance_name, access_token, refresh_token, refresh_expires_at, token_type, expires_at, current_instance, base_url, use_production
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
          params: [
            record.instance_name,
            record.access_token,
            record.refresh_token,
            refresh_expires_at,
            record.token_type,
            record.expires_at,
            1,
            record.base_url,
            record.use_production,
          ],
        },
      ]);
    }
    const response = await dbGet<AuthRecord>(
      db,
      "SELECT * FROM auth WHERE instance_name = ?",
      record.instance_name
    );
    return response;
  } catch (error) {
    await db.prepare("ROLLBACK").run();
    throw error;
  }
}

export async function updateCurrentInstance(instance_name: string) {
  const db = await getDb();
  try {
    await doTransaction(db, [
      {
        sql: "UPDATE auth SET current_instance = 0 WHERE instance_name != ?",
        params: [instance_name],
      },
      {
        sql: "UPDATE auth SET current_instance = 1 WHERE instance_name = ?",
        params: [instance_name],
      },
    ]);
  } catch (error) {
    throw error;
  }
}

export async function getCurrentAuthToken(): Promise<AuthRecord | undefined> {
  const db = await getDb();
  try {
    return await dbGet<AuthRecord>(
      db,
      "SELECT * FROM auth WHERE current_instance = 1 ORDER BY id ASC LIMIT 1"
    );
  } catch (error) {
    throw error;
  }
}

export async function listAuthTokens(): Promise<
  Pick<AuthRecord, "instance_name" | "base_url" | "current_instance">[]
> {
  const db = await getDb();
  try {
    return (
      (await dbAll<AuthRecord>(
        db,
        "SELECT * FROM auth ORDER BY instance_name ASC"
      )) || []
    );
  } catch (error) {
    throw error;
  }
}
