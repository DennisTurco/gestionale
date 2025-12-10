import sqlite3
from config.settings import DATABASE_PATH, INIT_SQL, TEST_DATA_SQL

def run_migrations():
    with sqlite3.connect(DATABASE_PATH) as conn:
        cursor = conn.cursor()

        read_and_execute_sql_script(cursor, INIT_SQL)
        read_and_execute_sql_script(cursor, TEST_DATA_SQL)

        print("Migrations executed correctly!")

def read_and_execute_sql_script(cursor, sql):
    with open(sql, "r", encoding="utf-8") as f:
        sql_script = f.read()
    cursor.executescript(sql_script)