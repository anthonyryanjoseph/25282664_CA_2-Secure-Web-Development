CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL, 
    role TEXT NOT NULL default 'user', 
    is_active INTEGER NOT NULL DEFAULT 1,
    CHECK (role IN ('user', 'admin')),
    CHECK (is_active IN (0,1))
);
    CREATE TABLE collections (
    id INTEGER PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    is_public INTEGER NOT NULL DEFAULT 0,
    name TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users(id),
    CHECK (is_public IN (0,1))
);


