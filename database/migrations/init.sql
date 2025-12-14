PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS customer_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL UNIQUE -- company, public_admin, private
);

CREATE TABLE IF NOT EXISTS contract_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL UNIQUE -- monthly, semiannual, annual
);

CREATE TABLE IF NOT EXISTS quotation_statuses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL UNIQUE -- created, delivered, confirmed
);

CREATE TABLE IF NOT EXISTS product_statuses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL UNIQUE, -- new with tag, new wihout tag, excellent, good, discrete
    [description] TEXT
);

CREATE TABLE IF NOT EXISTS user_roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL UNIQUE -- admin, user
);

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_user_role INTEGER NOT NULL,
    username TEXT UNIQUE NOT NULL,
    [name] TEXT NOT NULL,
    surname TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    [password] TEXT NOT NULL,
    FOREIGN KEY(id_user_role) REFERENCES user_roles(id)
);

CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_customer_type INTEGER NOT NULL,
    business_name TEXT,
    [name] TEXT,
    surname TEXT,
    phone TEXT UNIQUE,
    email TEXT UNIQUE,
    vat_number TEXT,
    tax_code TEXT,
    [address] TEXT,
    city TEXT,
    province TEXT,
    region TEXT,
    country TEXT,
    landline TEXT,
    lat REAL,
    lon REAL,
    FOREIGN KEY(id_customer_type) REFERENCES customer_types(id),
    CHECK (
        business_name IS NOT NULL
        OR ([name] IS NOT NULL AND surname IS NOT NULL)
    )
);

CREATE TABLE IF NOT EXISTS contracts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_customer INTEGER NOT NULL,
    id_contract_type INTEGER NOT NULL,
    [start_date] DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY(id_customer) REFERENCES customers(id),
    FOREIGN KEY(id_contract_type) REFERENCES contract_types(id),
    UNIQUE (id_customer, id_contract_type, [start_date])
);

CREATE TABLE IF NOT EXISTS product_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    [name] TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_category INTEGER,
    id_status INTEGER NOT NULL,
    product_code TEXT UNIQUE,
    ean TEXT,
    [description] TEXT NOT NULL,
    stock_quantity INTEGER,
    vat_percentage REAL NOT NULL,
    price REAL NOT NULL,
    FOREIGN KEY(id_category) REFERENCES product_categories(id),
    FOREIGN KEY(id_status) REFERENCES product_statuses(id),
    CHECK (vat_percentage >= 0 AND vat_percentage <= 100),
    CHECK (price > 0)
);

CREATE TABLE IF NOT EXISTS quotations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_customer INTEGER NOT NULL,
    id_status INTEGER NOT NULL,
    [number] TEXT UNIQUE NOT NULL,
    creation_date DATE NOT NULL,
    validity_date DATE,
    FOREIGN KEY(id_customer) REFERENCES customers(id),
    FOREIGN KEY(id_status) REFERENCES quotation_statuses(id)
);

CREATE TABLE IF NOT EXISTS quotation_products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_quotation INTEGER NOT NULL,
    id_product INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    discount_percentage REAL DEFAULT 0,
    final_price REAL NOT NULL,
    vat_percentage REAL NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY(id_quotation) REFERENCES quotations(id),
    FOREIGN KEY(id_product) REFERENCES products(id),
    UNIQUE (id_quotation, id_product),
    CHECK (vat_percentage >= 0 AND vat_percentage <= 100),
    CHECK (discount_percentage >= 0 AND discount_percentage <= 100),
    CHECK (unit_price > 0),
    CHECK (final_price >= 0),
    CHECK (total >= 0),
    CHECK (quantity > 0)
);

CREATE TABLE IF NOT EXISTS quotation_generic_products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_quotation INTEGER NOT NULL,
    [description] TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    price REAL NOT NULL,
    discount_percentage REAL DEFAULT 0,
    final_price REAL NOT NULL,
    vat_percentage REAL NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY(id_quotation) REFERENCES quotations(id),
    CHECK (vat_percentage >= 0 AND vat_percentage <= 100),
    CHECK (discount_percentage >= 0 AND discount_percentage <= 100),
    CHECK (final_price >= 0),
    CHECK (total >= 0),
    CHECK (quantity > 0),
    CHECK (price > 0),
    UNIQUE (id_quotation, [description])
);

CREATE TABLE IF NOT EXISTS notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_customer INTEGER,
    id_quotation INTEGER,
    note TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_customer) REFERENCES customers(id),
    FOREIGN KEY(id_quotation) REFERENCES quotations(id),
    CHECK (
        id_customer IS NOT NULL OR id_quotation IS NOT NULL
    ),
    UNIQUE (id_customer, id_quotation, note)
);

INSERT OR IGNORE INTO customer_types ([name]) VALUES
('company'),
('public_admin'),
('private');

INSERT OR IGNORE INTO contract_types ([name]) VALUES
('monthly'),
('semiannual'),
('annual');

INSERT OR IGNORE INTO quotation_statuses ([name]) VALUES
('created'),
('delivered'),
('confirmed');

INSERT OR IGNORE INTO user_roles ([name]) VALUES
('admin'),
('user');

INSERT OR IGNORE INTO product_categories ([name]) VALUES
('Hardware'),
('Software'),
('Service');

INSERT OR IGNORE INTO product_statuses ([name], [description]) VALUES
('new with tag', 'New and unused item, with tag attached or in original packaging. The item is in perfect condition, unused, and in its original packaging.'),
('new without tag', 'New and unused item, without tag. The item is in perfect condition and unused, but may not have the original tag or packaging.'),
('excellent', 'The item is in excellent condition, showing minimal signs of wear. It has been well-maintained and functions perfectly.'),
('good', 'The item is in good condition with some signs of wear. It is fully functional and has been used but remains in a satisfactory state.'),
('discrete', 'The item is in fair condition, showing noticeable signs of wear and tear. It may have minor defects but is still functional.');
