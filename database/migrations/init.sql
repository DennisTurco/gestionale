CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL,
    surname TEXT NOT NULL,
    user_type TEXT NOT NULL,
    telephone TEXT,
    email TEXT NOT NULL UNIQUE
);

INSERT OR IGNORE INTO customers ([name], surname, user_type, telephone, email) VALUES
("Mario", "Rossi", "Azienda", "+39 333 1234567", "mario@example.com"),
("Luca", "Bianchi", "Privato", "+39 345 9988776", "luca@example.com"),
("Tech", "Solutions SRL", "Ditta / PA", "+39 02 778899", "info@techsol.it");