INSERT OR IGNORE INTO users (id_user_role, username, [name], surname, email, [password]) VALUES
(1, 'admin', 'Mario', 'Rossi', 'admin@example.com', 'hashed_password_1'),
(2, 'luca.b', 'Luca', 'Bianchi', 'luca@example.com', 'hashed_password_2');

INSERT OR IGNORE INTO customers (id_customer_type, business_name, [name], surname, phone, email, vat_number, tax_code, [address], city, country) VALUES
(1, 'Tech Solutions SRL', NULL, NULL, '+39 0277889923', 'info@techsolutions.it', 'PV2372334', 'IT12345678901', 'Via Roma 10', 'Milano', 'Italia'),
(3, NULL, 'Giovanni', 'Verdi', '+39 0611223334', 'giovanniverdi@gmail.it', NULL, 'VRDGVN85M01H501X', 'Piazza Navona 5', 'Roma', 'Italia'),
(2, 'Comune di Firenze', NULL, NULL, '+39 0551234567', 'firenze@comune.it', 'IT98765432109', 'IT98765432109', 'Piazza della Signoria 1', 'Firenze', 'Italia'),
(3, NULL, 'Luca', 'Verdi', '+39 3331234267', 'luca.verdi@gmail.com', NULL, 'VRDLCU90A01F205X', 'Via Milano 5', 'Torino', 'Italia');

INSERT OR IGNORE INTO contracts (id_customer, id_contract_type, [start_date], end_date) VALUES
(1, 3, '2025-01-01', '2025-12-31'),
(2, 1, '2025-03-15', NULL),
(3, 2, '2024-06-01', '2024-11-30');

INSERT OR IGNORE INTO products (id_category, id_status, product_code, ean, [description], stock_quantity, vat_percentage, price) VALUES
(1, 1, 'HW-0001', '8001234567890', 'Notebook Business 14', 10, 22, 899.00),
(2, 1, 'SW-0001', NULL, 'Licenza Software Gestionale', 100, 22, 250.00),
(3, 1, 'SRV-0001', NULL, 'Installazione e configurazione', 0, 22, 120.00);

INSERT OR IGNORE INTO quotations (id_customer, id_status, [number], creation_date, validity_date) VALUES
(1, 1, 'PRE-2025-0001', '2025-03-20', '2025-04-20'),
(2, 2, 'PRE-2025-0002', '2025-03-22', '2025-05-22');

INSERT OR IGNORE INTO quotation_products (id_quotation, id_product, quantity, unit_price, discount_percentage, final_price, vat_percentage, total) VALUES
(1, 1, 2, 899.00, 10, 808.10, 22, 1972.76),
(1, 2, 5, 250.00, 0, 250.00, 22, 305.00),
(2, 3, 1, 120.00, 5, 114.00, 22, 139.08);

INSERT OR IGNORE INTO quotation_generic_products (id_quotation, [description], quantity, price, discount_percentage, final_price, vat_percentage, total) VALUES
(1, 'Personalizzazione software su richiesta', 1, 500.00, 0, 500.00, 22, 610.00),
(2, 'Corso di formazione base', 3, 200.00, 10, 180.00, 22, 657.60);

INSERT INTO notes (id_customer, id_quotation, note)
SELECT 1, NULL, 'Cliente storico, pagamenti sempre puntuali'
WHERE NOT EXISTS (
    SELECT 1 FROM notes
    WHERE id_customer = 1 AND note = 'Cliente storico, pagamenti sempre puntuali'
);

INSERT INTO notes (id_customer, id_quotation, note)
SELECT 2, NULL, 'Richiesta di preventivo urgente per progetto IT'
WHERE NOT EXISTS (
    SELECT 1 FROM notes
    WHERE id_customer = 2 AND note = 'Richiesta di preventivo urgente per progetto IT'
);

INSERT INTO notes (id_customer, id_quotation, note)
SELECT NULL, 1, 'Preventivo inviato via email il 20/03/2025'
WHERE NOT EXISTS (
    SELECT 1 FROM notes
    WHERE id_quotation = 1 AND note = 'Preventivo inviato via email il 20/03/2025'
);

INSERT INTO notes (id_customer, id_quotation, note)
SELECT NULL, 2, 'Cliente interessato a sconti per acquisti futuri'
WHERE NOT EXISTS (
    SELECT 1 FROM notes
    WHERE id_quotation = 2 AND note = 'Cliente interessato a sconti per acquisti futuri'
);
