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
    rating INTEGER CHECK (rating BETWEEN 1 AND 10), -- Restricts ratings to 1–10 while allowing unrated anime.
    FOREIGN KEY (collection_id) REFERENCES collections(id),
    CHECK (watch_status IN ('plan_to_watch', 'watching', 'completed'))

);
-- Stores security-related events for auditing.
CREATE TABLE audit_events (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    event_type TEXT NOT NULL,
    occured_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Records when the security event occurred (UTC).
    FOREIGN KEY (user_id) REFERENCES users(id) -- linkage of the audit event to an existign user, if when the user is known. 
);

