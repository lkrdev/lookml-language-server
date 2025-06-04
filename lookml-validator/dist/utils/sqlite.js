"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.setNewRefreshToken = setNewRefreshToken;
exports.saveAuthToken = saveAuthToken;
exports.updateCurrentInstance = updateCurrentInstance;
exports.getCurrentAuthToken = getCurrentAuthToken;
exports.listAuthTokens = listAuthTokens;
const sqlite3_1 = __importDefault(require("@vscode/sqlite3"));
const fs_1 = __importDefault(require("fs"));
const os_1 = __importDefault(require("os"));
const path_1 = __importDefault(require("path"));
let activeDb = null;
function getDb() {
    return __awaiter(this, void 0, void 0, function* () {
        if (activeDb) {
            return activeDb;
        }
        else {
            // Ensure the directory ~/.lkr exists
            const homeDir = process.env.HOME || process.env.USERPROFILE || os_1.default.homedir();
            const lkrDir = path_1.default.join(homeDir, ".lkr");
            if (!fs_1.default.existsSync(lkrDir)) {
                fs_1.default.mkdirSync(lkrDir, { recursive: true });
            }
            const dbPath = path_1.default.join(lkrDir, "auth.db");
            try {
                activeDb = new sqlite3_1.default.Database(dbPath);
            }
            catch (error) {
                throw error;
            }
            yield doTransaction(activeDb, [
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
    });
}
function dbExec(db, sql, ...params) {
    return new Promise((resolve, reject) => {
        db.run(sql, ...params, (err) => {
            if (err)
                reject(err);
            else
                resolve(undefined);
        });
    });
}
function dbGet(db, sql, ...params) {
    return new Promise((resolve, reject) => {
        db.get(sql, ...params, (err, row) => {
            if (err)
                reject(err);
            else
                resolve(row);
        });
    });
}
function dbAll(db, sql, ...params) {
    return new Promise((resolve, reject) => {
        db.all(sql, ...params, (err, rows) => {
            if (err)
                reject(err);
            else
                resolve(rows);
        });
    });
}
function doTransaction(db, sqls) {
    return __awaiter(this, void 0, void 0, function* () {
        return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
            let error = null;
            try {
                yield dbExec(db, "BEGIN TRANSACTION");
            }
            catch (e) {
                error = e;
            }
            for (var i = 0; i < sqls.length; i++) {
                const sql = sqls[i];
                if (!error) {
                    try {
                        yield dbExec(db, sql.sql, ...sql.params);
                    }
                    catch (e) {
                        error = e;
                    }
                }
            }
            if (!error) {
                yield dbExec(db, "COMMIT");
                resolve(undefined);
            }
            else {
                yield dbExec(db, "ROLLBACK");
                reject(error);
            }
        }));
    });
}
function setNewRefreshToken(instance_name, refresh_token) {
    return __awaiter(this, void 0, void 0, function* () {
        const db = yield getDb();
        try {
            const refresh_expires_at = new Date(Date.now() + 1000 * 60 * 60 * 24 * 30).toISOString();
            yield doTransaction(db, [
                {
                    sql: "UPDATE auth SET refresh_token = ?, refresh_expires_at = ? WHERE instance_name = ?",
                    params: [refresh_token, refresh_expires_at, instance_name],
                },
            ]);
        }
        catch (error) {
            throw error;
        }
    });
}
function saveAuthToken(record) {
    return __awaiter(this, void 0, void 0, function* () {
        const db = yield getDb();
        try {
            const existing = yield dbGet(db, "SELECT * FROM auth WHERE instance_name = ?", record.instance_name);
            if (existing) {
                yield doTransaction(db, [
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
            }
            else {
                const refresh_expires_at = record.refresh_token
                    ? record.refresh_expires_at ||
                        new Date(Date.now() + 1000 * 60 * 60 * 24 * 30).toISOString()
                    : undefined;
                yield doTransaction(db, [
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
            const response = yield dbGet(db, "SELECT * FROM auth WHERE instance_name = ?", record.instance_name);
            return response;
        }
        catch (error) {
            yield db.prepare("ROLLBACK").run();
            throw error;
        }
    });
}
function updateCurrentInstance(instance_name) {
    return __awaiter(this, void 0, void 0, function* () {
        const db = yield getDb();
        try {
            yield doTransaction(db, [
                {
                    sql: "UPDATE auth SET current_instance = 0 WHERE instance_name != ?",
                    params: [instance_name],
                },
                {
                    sql: "UPDATE auth SET current_instance = 1 WHERE instance_name = ?",
                    params: [instance_name],
                },
            ]);
        }
        catch (error) {
            throw error;
        }
    });
}
function getCurrentAuthToken() {
    return __awaiter(this, void 0, void 0, function* () {
        const db = yield getDb();
        try {
            return yield dbGet(db, "SELECT * FROM auth WHERE current_instance = 1 ORDER BY id ASC LIMIT 1");
        }
        catch (error) {
            throw error;
        }
    });
}
function listAuthTokens() {
    return __awaiter(this, void 0, void 0, function* () {
        const db = yield getDb();
        try {
            return ((yield dbAll(db, "SELECT * FROM auth ORDER BY instance_name ASC")) || []);
        }
        catch (error) {
            throw error;
        }
    });
}
