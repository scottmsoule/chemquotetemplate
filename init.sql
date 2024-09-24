-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create CustomerLocations Table
CREATE TABLE IF NOT EXISTS CustomerLocations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    supplier_address VARCHAR(255) NOT NULL,  -- Changed from address to supplier_address
    city VARCHAR(100) NOT NULL,
    state_code VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE,
    UNIQUE (customer_id, is_primary)
);

-- Create Contacts Table
CREATE TABLE IF NOT EXISTS Contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    contact_role VARCHAR(100),  -- Changed from role to contact_role
    email VARCHAR(255),
    phone VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);

-- Create Suppliers Table
CREATE TABLE IF NOT EXISTS Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create SupplierLocations Table
CREATE TABLE IF NOT EXISTS SupplierLocations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    supplier_address VARCHAR(255) NOT NULL,  -- Changed from address to supplier_address
    city VARCHAR(100) NOT NULL,
    state_code VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE CASCADE
);

-- Create Quotes Table
CREATE TABLE IF NOT EXISTS Quotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    supplier_id INT NOT NULL,
    quote_amount DECIMAL(10, 2) NOT NULL,
    quote_date DATE NOT NULL,
    quote_status ENUM('pending', 'accepted', 'rejected') NOT NULL,  -- Changed from status to quote_status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE CASCADE
);

-- Insert sample data into Customers
INSERT INTO Customers (name, email, phone) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890'),
('Jane Smith', 'jane.smith@example.com', '234-567-8901'),
('Acme Corp', 'contact@acmecorp.com', '345-678-9012');

-- Insert sample data into CustomerLocations
INSERT INTO CustomerLocations (customer_id, supplier_address, city, state_code, zip_code, is_primary) VALUES
(1, '123 Elm St', 'Springfield', 'IL', '62701', TRUE),
(1, '456 Oak St', 'Springfield', 'IL', '62702', FALSE),
(2, '789 Maple Ave', 'Shelbyville', 'IL', '62565', TRUE),
(3, '101 Pine St', 'Capital City', 'IL', '62704', TRUE);

-- Insert sample data into Contacts
INSERT INTO Contacts (customer_id, first_name, last_name, contact_role, email, phone) VALUES
(1, 'Alice', 'Johnson', 'Manager', 'alice.johnson@example.com', '123-321-4321'),
(1, 'Bob', 'Brown', 'Assistant', 'bob.brown@example.com', '321-123-4567'),
(2, 'Carol', 'Williams', 'Director', 'carol.williams@example.com', '456-654-7890');

-- Insert sample data into Suppliers
INSERT INTO Suppliers (name, email, phone) VALUES
('Supplier One', 'supplier1@example.com', '987-654-3210'),
('Supplier Two', 'supplier2@example.com', '876-543-2109');

-- Insert sample data into SupplierLocations
INSERT INTO SupplierLocations (supplier_id, supplier_address, city, state_code, zip_code) VALUES
(1, '123 Supplier Rd', 'Industry City', 'CA', '90001'),
(1, '456 Warehouse Ave', 'Supply Town', 'CA', '90002'),
(2, '789 Supplier Lane', 'Supplier City', 'TX', '73301');

-- Insert sample data into Quotes
INSERT INTO Quotes (customer_id, supplier_id, quote_amount, quote_date, quote_status) VALUES
(1, 1, 1500.00, '2023-09-01', 'pending'),
(2, 1, 2000.00, '2023-09-05', 'accepted'),
(1, 2, 2500.00, '2023-09-10', 'rejected');

