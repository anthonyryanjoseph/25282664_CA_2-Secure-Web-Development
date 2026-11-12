import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent  
DB_PATH = BASE_DIR / "instance" / "anime.db"
SCHEMA_PATH = BASE_DIR / "database" / "schema.sql"

def get_db_connection():
    connection = sqlite3.connect(DB_PATH)
    connection.execute("PRAGMA foreign_keys = ON")  #Open the SQLite database with foreign key enforcement enabled.
    return connection

def init_db():
    schema_sql = SCHEMA_PATH.read_text(encoding="utf-8")
    connection = get_db_connection()

    try:
          connection.executescript(schema_sql)
    finally:
         connection.close()

  
     