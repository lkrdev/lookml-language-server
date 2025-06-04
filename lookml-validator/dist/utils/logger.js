"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Logger = exports.LogLevel = void 0;
var LogLevel;
(function (LogLevel) {
    LogLevel["DEBUG"] = "DEBUG";
    LogLevel["INFO"] = "INFO";
    LogLevel["WARN"] = "WARN";
    LogLevel["ERROR"] = "ERROR";
})(LogLevel || (exports.LogLevel = LogLevel = {}));
class Logger {
    constructor(connection) {
        this.connection = connection;
        this.level = LogLevel.INFO; // Default level
    }
    static initialize(connection) {
        if (!Logger.instance) {
            Logger.instance = new Logger(connection);
        }
    }
    static getInstance() {
        if (!Logger.instance) {
            throw new Error('Logger not initialized. Call initialize() first.');
        }
        return Logger.instance;
    }
    setLevel(level) {
        this.level = level;
    }
    shouldLog(level) {
        const levels = Object.values(LogLevel);
        return levels.indexOf(level) >= levels.indexOf(this.level);
    }
    formatMessage(level, message, ...args) {
        const timestamp = new Date().toISOString();
        const formattedArgs = args.map(arg => typeof arg === 'object' ? JSON.stringify(arg, null, 2) : arg).join(' ');
        return `[${timestamp}] [${level}] ${message} ${formattedArgs}`;
    }
    debug(message, ...args) {
        if (this.shouldLog(LogLevel.DEBUG)) {
            const formattedMessage = this.formatMessage(LogLevel.DEBUG, message, ...args);
            console.log(formattedMessage); // Use global console
        }
    }
    info(message, ...args) {
        if (this.shouldLog(LogLevel.INFO)) {
            const formattedMessage = this.formatMessage(LogLevel.INFO, message, ...args);
            console.info(formattedMessage); // Use global console
        }
    }
    warn(message, ...args) {
        if (this.shouldLog(LogLevel.WARN)) {
            const formattedMessage = this.formatMessage(LogLevel.WARN, message, ...args);
            console.warn(formattedMessage); // Use global console
        }
    }
    error(message, ...args) {
        if (this.shouldLog(LogLevel.ERROR)) {
            const formattedMessage = this.formatMessage(LogLevel.ERROR, message, ...args);
            console.error(formattedMessage); // Use global console
        }
    }
}
exports.Logger = Logger;
