import sqlite3
import os

from config.settings import DATABASE_DIR, DATABASE_PATH

class DatabaseConfig:

    @staticmethod
    def get_connection():
        # creates the database folder if it doesn't exist
        os.makedirs(DATABASE_DIR, exist_ok=True)
        conn = sqlite3.connect(DATABASE_PATH)
        conn.row_factory = sqlite3.Row
        return conn