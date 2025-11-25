import sqlite3
from config.settings import DATABASE_PATH, INIT_SQL

def run_migrations():
    with sqlite3.connect(DATABASE_PATH) as conn:
        cursor = conn.cursor()

        # Legge lo script SQL
        with open(INIT_SQL, "r", encoding="utf-8") as f:
            sql_script = f.read()

        cursor.executescript(sql_script)

        print("Migrazioni iniziali eseguite!")