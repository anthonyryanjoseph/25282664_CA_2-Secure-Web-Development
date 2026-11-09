CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL, 
    role TEXT NOT NULL default 'user', 
    is_active INTEGER NOT NULL DEFAULT 1,
    CHECK (role IN ('user', 'admin')),
    CHECK (is_active IN (0,1))
);

