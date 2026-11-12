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
CREATE TABLE anime_entries (
    id INTEGER PRIMARY KEY,
    collection_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    watch_status TEXT NOT NULL DEFAULT 'plan_to_watch',
    rating INTEGER CHECK (rating BETWEEN 1 AND 10),
    FOREIGN KEY (collection_id) REFERENCES collections(id),
    CHECK (watch_status IN ('plan_to_watch', 'watching', 'completed'))

);


