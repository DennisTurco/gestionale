import os

CONFIG_DIR = os.path.dirname(os.path.abspath(__file__))

# Database paths
DATABASE_DIR = os.path.join(CONFIG_DIR, "..", "database")
DATABASE_PATH = os.path.join(DATABASE_DIR, "management.db")

# Migration paths
MIGRATIONS_DIR = os.path.join(DATABASE_DIR, "migrations")
INIT_SQL = os.path.join(MIGRATIONS_DIR, "init.sql")
