import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

let dbPromise: Promise<import('sqlite').Database> | null = null;

async function getDb() {
  if (!dbPromise) {
    dbPromise = open({
      filename: 'lookerauth.db',
      driver: sqlite3.Database,
    });
    const db = await dbPromise;
    await db.exec(`CREATE TABLE IF NOT EXISTS auth (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      instance_name TEXT,
      access_token TEXT,
      refresh_token TEXT,
      refresh_expires_at TEXT,
      token_type TEXT,
      expires_at TEXT,
      current_instance BOOLEAN,
      base_url TEXT
    )`);
  }
  return dbPromise;
}

export interface AuthRecord {
  instance_name: string;
  access_token: string;
  refresh_token?: string;
  refresh_expires_at?: string;
  token_type: string;
  expires_at: string;
  current_instance: boolean;
  base_url: string;
}

export async function saveAuthToken(record: AuthRecord) {
  const db = await getDb();
  const existing = await db.get(
    'SELECT id FROM auth WHERE instance_name = ? AND base_url = ?',
    record.instance_name,
    record.base_url
  );

  if (existing) {
    await db.run(
      `UPDATE auth SET
        access_token = ?,
        token_type = ?,
        expires_at = ?,
        current_instance = ?
      WHERE id = ?`,
      record.access_token,
      record.token_type,
      record.expires_at,
      record.current_instance ? 1 : 0,
      existing.id
    );
  } else {
    await db.run(
      `INSERT INTO auth (
        instance_name, access_token, refresh_token, refresh_expires_at, token_type, expires_at, current_instance, base_url
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
      record.instance_name,
      record.access_token,
      record.refresh_token,
      record.refresh_expires_at,
      record.token_type,
      record.expires_at,
      record.current_instance ? 1 : 0,
      record.base_url
    );
  }
}

export async function getValidAuthToken(instance_name: string, base_url: string): Promise<AuthRecord | null> {
  const db = await getDb();
  const now = new Date().toISOString();

  const record = await db.get(
    `SELECT * FROM auth WHERE instance_name = ? AND base_url = ? AND refresh_expires_at > ? ORDER BY id DESC LIMIT 1`,
    instance_name,
    base_url,
    now
  );

  return record || null;
} 