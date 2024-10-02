-- Drop existing tables if they exist (for fresh setup)
DROP TABLE IF EXISTS QuoteLineItems;
DROP TABLE IF EXISTS Quotes;
DROP TABLE IF EXISTS SupplierProducts;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS FreightCompanies;
DROP TABLE IF EXISTS Contacts;
DROP TABLE IF EXISTS CustomerLocations;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Units;

-- Create Units Table
CREATE TABLE IF NOT EXISTS Units (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unit_name VARCHAR(50) NOT NULL UNIQUE
);

-- Insert sample data into Units
INSERT INTO Units (unit_name) VALUES 
('pounds'),
('gallons'),
('liters'),
('kilograms'),
('ounces');

-- Create Suppliers Table
CREATE TABLE IF NOT EXISTS Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data into Suppliers
INSERT INTO Suppliers (name, email, phone) VALUES 
('ChemCorp Chemicals', 'info@chemcorp.com', '123-456-7890'),
('PureChem Solutions', 'support@purechem.com', '234-567-8901'),
('Acme Chemical Supply', 'sales@acmechem.com', '345-678-9012'),
('GreenEarth Chemicals', 'contact@greenearth.com', '456-789-0123'),
('Chemical Supply Co.', 'info@chemsupply.com', '567-890-1234'),
('Chemical Solutions Inc.', 'sales@chemsolutions.com', '678-901-2345');

-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data into Customers
INSERT INTO Customers (name, email, phone) VALUES 
('Acme Manufacturing', 'contact@acmemfg.com', '345-678-9012'),
('Global Plastics Inc.', 'sales@globalplastics.com', '456-789-0123'),
('Innovative Packaging', 'info@innovativepackaging.com', '567-890-1234'),
('Tech Materials Corp.', 'support@techmaterials.com', '678-901-2345'),
('Advanced Materials Ltd.', 'info@advancedmaterials.com', '789-012-3456');

-- Create CustomerLocations Table
CREATE TABLE IF NOT EXISTS CustomerLocations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    supplier_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_code VARCHAR(2) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);

-- Insert sample data into CustomerLocations
INSERT INTO CustomerLocations (customer_id, supplier_address, city, state_code, zip_code, is_primary) VALUES 
(1, '123 Industrial Rd', 'Chicago', 'IL', '60601', TRUE),
(1, '456 Factory Ln', 'Chicago', 'IL', '60602', FALSE),
(2, '789 Plastics Blvd', 'Dallas', 'TX', '75201', TRUE),
(3, '321 Packagings St', 'New York', 'NY', '10001', TRUE),
(4, '654 Materials Way', 'San Francisco', 'CA', '94101', TRUE),
(5, '789 Innovation Dr', 'Boston', 'MA', '02108', TRUE);

-- Create Contacts Table
CREATE TABLE IF NOT EXISTS Contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    contact_role VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);

-- Insert sample data into Contacts
INSERT INTO Contacts (customer_id, first_name, last_name, contact_role, email, phone) VALUES 
(1, 'John', 'Doe', 'Purchasing Manager', 'john.doe@acmemfg.com', '321-654-0987'),
(1, 'Jane', 'Smith', 'Supply Chain Coordinator', 'jane.smith@acmemfg.com', '321-654-0988'),
(2, 'Emily', 'Johnson', 'Production Supervisor', 'emily.johnson@globalplastics.com', '321-654-0989'),
(2, 'Michael', 'Brown', 'Quality Assurance', 'michael.brown@globalplastics.com', '321-654-0990'),
(3, 'Sarah', 'Davis', 'Logistics Manager', 'sarah.davis@innovativepackaging.com', '321-654-0991'),
(4, 'David', 'Wilson', 'Operations Director', 'david.wilson@techmaterials.com', '321-654-0992'),
(5, 'Alice', 'Green', 'Procurement Specialist', 'alice.green@advancedmaterials.com', '321-654-0993');

-- Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unit_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (unit_id) REFERENCES Units(id) ON DELETE CASCADE
);

-- Insert sample data into Products
INSERT INTO Products (product_name, unit_id) VALUES 
('Sulfuric Acid', 1),
('Sodium Hydroxide', 2),
('Acetic Acid', 3),
('Hydrochloric Acid', 1),
('Ethanol', 2),
('Methanol', 2),
('Ammonium Nitrate', 1),
('Potassium Chloride', 1),
('Hydrogen Peroxide', 1),
('Benzene', 1);

-- Create SupplierProducts Table
CREATE TABLE IF NOT EXISTS SupplierProducts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    UNIQUE (supplier_id, product_id)
);

-- Insert sample data into SupplierProducts
INSERT INTO SupplierProducts (supplier_id, product_id, price) VALUES 
(1, 1, 100.00),
(1, 2, 150.00),
(2, 3, 200.00),
(2, 4, 180.00),
(1, 5, 120.00),
(3, 6, 130.00),
(4, 7, 160.00),
(1, 8, 140.00),
(5, 9, 110.00),
(6, 10, 160.00);

-- Create FreightCompanies Table
CREATE TABLE IF NOT EXISTS FreightCompanies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    cost_per_mile DECIMAL(10, 2) NOT NULL,
    fuel_surcharge DECIMAL(10, 2) NOT NULL,
    cleanout_charge DECIMAL(10, 2) NOT NULL,
    pump_charge DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data into FreightCompanies
INSERT INTO FreightCompanies (company_name, cost_per_mile, fuel_surcharge, cleanout_charge, pump_charge) VALUES 
('Fast Freight Solutions', 1.50, 50.00, 100.00, 75.00),
('Reliable Freight Co.', 1.75, 45.00, 90.00, 70.00),
('Quick Transport Services', 1.60, 55.00, 95.00, 80.00),
('Eco Freight Partners', 1.40, 40.00, 85.00, 65.00);

-- Create Quotes Table
CREATE TABLE IF NOT EXISTS Quotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_cost DECIMAL(10, 2) NOT NULL,
    total_freight_charge DECIMAL(10, 2) NOT NULL,
    quote_date DATE NOT NULL,
    quote_status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);

-- Insert sample data into Quotes
INSERT INTO Quotes (customer_id, product_cost, total_freight_charge, quote_date, quote_status) VALUES 
(1, 1000.00, 150.00, '2024-01-15', 'Accepted'),
(2, 2000.00, 250.00, '2024-01-16', 'Pending'),
(3, 1500.00, 200.00, '2024-01-17', 'Rejected'),
(4, 1200.00, 180.00, '2024-01-18', 'Accepted'),
(5, 1700.00, 220.00, '2024-01-19', 'Pending');
