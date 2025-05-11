-- Sales and Inventory Management System in PostgreSQL

-- 1. Database Creation 
CREATE DATABASE sales_inventory_management; 

-- 2. Table Creation 

-- Products Table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
	product_id SERIAL PRIMARY KEY, 
	product_name VARCHAR(100) NOT NULL, 
	category VARCHAR(50),
	unit_price DECIMAL(10, 2) NOT NULL, 
	stock_quantity INT NOT NULL DEFAULT 0,
	supplier_id INT
);

-- Suppliers Table 
DROP TABLE IF EXISTS Suppliers;
CREATE TABLE suppliers (
	supplier_id SERIAL PRIMARY KEY,
	supplier_name VARCHAR(100) NOT NULL,
	contact_name VARCHAR(100),
	phone VARCHAR(15), 
	email VARCHAR(100)
);

-- Customers Table 
DROP TABLE IF EXISTS Customers; 
CREATE TABLE Customers (
	customer_id SERIAL PRIMARY KEY, 
	customer_name VARCHAR(100) NOT NULL,
	contact_number VARCHAR(15), 
	email VARCHAR(100),
	address VARCHAR(255)
);

-- Orders Table 
DROP TABLE IF EXISTS Orders; 
CREATE TABLE Orders(
	order_id SERIAL PRIMARY KEY, 
	customer_id INT REFERENCES customers(customer_id), 
	order_date DATE DEFAULT CURRENT_DATE, 
	total_amount DECIMAL(10, 2)
);

-- OrderDetails Table 
DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE OrderDetails(
	OrderDetailId SERIAL PRIMARY KEY, 
	order_id INT REFERENCES Orders(order_id),
	product_id INT REFERENCES Products(product_id),
	quantity INT NOT NULL,
	unit_price DECIMAL(10, 2) NOT NULL
);

--Inventory Transactions Table 
DROP TABLE IF EXISTS Inventory_transactions; 
CREATE TABLE inventory_transactions(
	transaction_id SERIAL PRIMARY KEY,
	product_id INT REFERENCES Products(product_id),
	quantity_change INT NOT NULL,
	transaction_type VARCHAR(50),
	transaction_date DATE DEFAULT CURRENT_DATE
);

-- 3. Indexing for Optimisation 
CREATE INDEX idx_product_id ON Products(product_id); 
CREATE INDEX idx_order_id ON Orders(order_id);
CREATE INDEX idx_customer_id ON Customers(customer_id);

-- 4. Inserting Sample Data

-- Suppliers 
INSERT INTO Suppliers (supplier_name, contact_name, Phone, Email)
VALUES 
    ('Health Supplies Ltd', 'John Doe', '1234567890', 'john@healthsupplies.com'),
    ('Pharma Solutions Inc.', 'Jane Smith', '0987654321', 'jane@pharmasolutions.com'),
    ('MedEquip Co.', 'Michael Brown', '1122334455', 'michael@medequip.com'),
    ('Wellness Pharma', 'Sarah Taylor', '2233445566', 'sarah@wellnesspharma.com'),
    ('Global Meds', 'David Wilson', '3344556677', 'david@globalmeds.com'),
    ('Pure Health Group', 'Emily Harris', '4455667788', 'emily@purehealth.com'),
    ('BioGen Labs', 'Sophia Clark', '5566778899', 'sophia@biogenlabs.com'),
    ('VitaCare', 'Daniel Walker', '6677889900', 'daniel@vitacare.com'),
    ('Healing Hands', 'Emma King', '7788990011', 'emma@healinghands.com'),
    ('MediCore Ltd.', 'Matthew Scott', '8899001122', 'matthew@medicore.com'),
    ('Zenith Pharma', 'Olivia Lee', '9900112233', 'olivia@zenithpharma.com'),
    ('Nova Health', 'James Perez', '1010101010', 'james@novahealth.com'),
    ('CureAll Labs', 'Isabella Evans', '1111111111', 'isabella@curealllabs.com'),
    ('WellBeing Pharmaceuticals', 'Christopher Turner', '2222222222', 'chris@wellbeingpharma.com'),
    ('GenMed Corp', 'Amelia Phillips', '3333333333', 'amelia@genmed.com'),
    ('SafeMed Solutions', 'Benjamin Parker', '4444444444', 'benjamin@safemed.com'),
    ('LifeLine Healthcare', 'Charlotte Hall', '5555555555', 'charlotte@lifeline.com'),
    ('Orion Med', 'Henry Young', '6666666666', 'henry@orionmed.com'),
    ('Trinity Health Ltd.', 'Liam Allen', '7777777777', 'liam@trinityhealth.com'),
    ('Infinity BioTech', 'Ella Baker', '8888888888', 'ella@infinitybiotech.com'),
    ('Nexa Labs', 'Alexander Wright', '9999999999', 'alex@nexalabs.com'),
    ('Quantum Health', 'Harper Lopez', '1212121212', 'harper@quantumhealth.com'),
    ('RevitaMed', 'Mia Gonzalez', '1313131313', 'mia@revitamed.com'),
    ('Synapse Pharmaceuticals', 'Elijah Roberts', '1414141414', 'elijah@synapsepharma.com'),
    ('Alpha Care', 'Avery Mitchell', '1515151515', 'avery@alphacare.com'),
    ('Omega Health', 'Evelyn Carter', '1616161616', 'evelyn@omegahealth.com'),
    ('Genesis Pharma', 'Jack Ramirez', '1717171717', 'jack@genesispharma.com'),
    ('Summit Medics', 'Scarlett Bell', '1818181818', 'scarlett@summitmedics.com'),
    ('Aspire Healthcare', 'Logan Richardson', '1919191919', 'logan@aspirehealth.com'),
    ('Harmony Pharmaceuticals', 'Lily Cox', '2020202020', 'lily@harmonypharma.com');
-- Products 
INSERT INTO Products (product_name, category, unit_price, stock_quantity, supplier_id)
VALUES 
    ('Paracetamol', 'Pain Relief', 2.99, 100, 1),
    ('Amoxicillin', 'Antibiotic', 5.49, 200, 2),
    ('Ibuprofen', 'Pain Relief', 3.25, 150, 3),
    ('Cough Syrup', 'Cold & Flu', 4.99, 80, 4),
    ('Vitamin C', 'Supplements', 6.99, 120, 5),
    ('Aspirin', 'Pain Relief', 2.79, 140, 6),
    ('Lisinopril', 'Heart Health', 7.49, 60, 7),
    ('Metformin', 'Diabetes', 5.99, 100, 8),
    ('Antiseptic Cream', 'First Aid', 3.89, 90, 9),
    ('Bandages', 'First Aid', 1.99, 300, 10),
    ('Glucose Tablets', 'Diabetes', 2.49, 100, 11),
    ('Multivitamins', 'Supplements', 8.99, 75, 12),
    ('Calcium Tablets', 'Supplements', 7.99, 85, 13),
    ('Probiotic Capsules', 'Supplements', 9.49, 60, 14),
    ('Omega-3 Fish Oil', 'Supplements', 11.99, 50, 15),
    ('Zinc Lozenges', 'Immune Support', 4.49, 95, 16),
    ('Hand Sanitizer', 'Hygiene', 1.29, 400, 17),
    ('Surgical Mask', 'Hygiene', 0.99, 1000, 18),
    ('Thermometer', 'Medical Equipment', 12.99, 40, 19),
    ('Blood Pressure Monitor', 'Medical Equipment', 29.99, 30, 20),
    ('Glucose Monitor', 'Medical Equipment', 24.99, 20, 21),
    ('Insulin Syringe', 'Medical Equipment', 1.49, 500, 22),
    ('Antacid Tablets', 'Digestive Health', 3.49, 200, 23),
    ('Nasal Spray', 'Allergy Relief', 5.99, 150, 24),
    ('Eye Drops', 'Vision Care', 4.29, 100, 25),
    ('Sterile Gauze', 'First Aid', 0.89, 600, 26),
    ('First Aid Kit', 'First Aid', 15.99, 40, 27),
    ('Cold Compress', 'First Aid', 5.49, 100, 28),
    ('Diabetes Test Strips', 'Diabetes', 9.99, 150, 29),
    ('Pregnancy Test Kit', 'Medical Equipment', 6.99, 80, 30);
-- Customers 
INSERT INTO Customers (customer_name, contact_number, email, address)
VALUES 
    ('Alice Johnson', '555-1234', 'alice.johnson@example.com', '123 Elm Street'),
    ('Bob Smith', '555-5678', 'bob.smith@example.com', '456 Oak Avenue'),
    ('Carol White', '555-9101', 'carol.white@example.com', '789 Pine Road'),
    ('David Green', '555-1122', 'david.green@example.com', '321 Maple Lane'),
    ('Emma Brown', '555-3344', 'emma.brown@example.com', '654 Cedar Court'),
    ('Frank Harris', '555-5566', 'frank.harris@example.com', '987 Birch Street'),
    ('Grace Lee', '555-7788', 'grace.lee@example.com', '159 Walnut Drive'),
    ('Hank Miller', '555-9900', 'hank.miller@example.com', '753 Cherry Avenue'),
    ('Ivy Wilson', '555-2233', 'ivy.wilson@example.com', '852 Spruce Boulevard'),
    ('Jack Taylor', '555-4455', 'jack.taylor@example.com', '951 Ash Way'),
    ('Kate Clark', '555-6677', 'kate.clark@example.com', '147 Elmwood Terrace'),
    ('Leo Martin', '555-8899', 'leo.martin@example.com', '369 Willow Park'),
    ('Mia King', '555-1010', 'mia.king@example.com', '258 Oakwood Lane'),
    ('Noah Scott', '555-2020', 'noah.scott@example.com', '357 Maple Point'),
    ('Olivia Adams', '555-3030', 'olivia.adams@example.com', '468 Birch Landing'),
    ('Paul Lewis', '555-4040', 'paul.lewis@example.com', '579 Cedar Grove'),
    ('Quinn Walker', '555-5050', 'quinn.walker@example.com', '681 Spruce Crescent'),
    ('Ruby Hall', '555-6060', 'ruby.hall@example.com', '792 Walnut Estates'),
    ('Sam Young', '555-7070', 'sam.young@example.com', '894 Cherry Heights'),
    ('Tina Hernandez', '555-8080', 'tina.hernandez@example.com', '915 Ashcroft Road'),
    ('Uma Patel', '555-9090', 'uma.patel@example.com', '123 Elm Place'),
    ('Victor Ramirez', '555-1111', 'victor.ramirez@example.com', '456 Pine Vista'),
    ('Wendy Perez', '555-2222', 'wendy.perez@example.com', '789 Cedar Crest'),
    ('Xander Diaz', '555-3333', 'xander.diaz@example.com', '321 Birch Haven'),
    ('Yara Mitchell', '555-4444', 'yara.mitchell@example.com', '654 Oak Hill'),
    ('Zachary Foster', '555-5555', 'zachary.foster@example.com', '987 Maple Ridge'),
    ('Liam Baker', '555-6666', 'liam.baker@example.com', '147 Walnut Circle'),
    ('Sophia Evans', '555-7777', 'sophia.evans@example.com', '258 Cherry Grove'),
    ('Benjamin Carter', '555-8888', 'benjamin.carter@example.com', '369 Ashwood Estates'),
    ('Emily Collins', '555-9999', 'emily.collins@example.com', '951 Spruce Terrace');
-- Orders 
INSERT INTO Orders (customer_id, total_amount)
VALUES 
    (1, 29.90), (2, 15.47), (3, 45.20), (4, 39.99), (5, 10.50),
    (6, 20.00), (7, 55.60), (8, 11.75), (9, 70.80), (10, 30.00),
    (11, 25.50), (12, 15.00), (13, 49.99), (14, 27.45), (15, 33.30),
    (16, 19.99), (17, 22.22), (18, 40.00), (19, 60.00), (20, 18.75),
    (21, 21.10), (22, 50.00), (23, 30.45), (24, 12.99), (25, 100.00),
    (26, 42.50), (27, 55.00), (28, 29.00), (29, 66.66), (30, 15.00);
-- OrderDetails 
INSERT INTO OrderDetails (order_iD, product_id, quantity, unit_price)
VALUES 
    (1, 1, 10, 2.99), (2, 2, 3, 5.49), (3, 3, 5, 3.25), (4, 4, 2, 4.99),
    (5, 5, 7, 6.99), (6, 6, 3, 2.79), (7, 7, 4, 7.49), (8, 8, 1, 5.99),
    (9, 9, 8, 3.89), (10, 10, 5, 1.99), (11, 11, 9, 2.49), (12, 12, 6, 8.99),
    (13, 13, 7, 7.99), (14, 14, 3, 9.49), (15, 15, 2, 11.99), (16, 16, 5, 4.49),
    (17, 17, 10, 1.29), (18, 18, 15, 0.99), (19, 19, 1, 12.99), (20, 20, 2, 29.99),
    (21, 21, 5, 24.99), (22, 22, 30, 1.49), (23, 23, 12, 3.49), (24, 24, 6, 5.99),
    (25, 25, 4, 4.29), (26, 26, 20, 0.89), (27, 27, 1, 15.99), (28, 28, 8, 5.49),
    (29, 29, 10, 9.99), (30, 30, 2, 6.99);
-- Inventory Transactions 
INSERT INTO inventory_transactions (product_id, quantity_change, transaction_type)
VALUES 
    (1, -10, 'Sale'), (2, -3, 'Sale'), (3, -5, 'Sale'), (4, -2, 'Sale'),
    (5, -7, 'Sale'), (6, -3, 'Sale'), (7, -4, 'Sale'), (8, -1, 'Sale'),
    (9, -8, 'Sale'), (10, -5, 'Sale'), (11, -9, 'Sale'), (12, -6, 'Sale'),
    (13, -7, 'Sale'), (14, -3, 'Sale'), (15, -2, 'Sale'), (16, -5, 'Sale'),
    (17, -10, 'Sale'), (18, -15, 'Sale'), (19, -1, 'Sale'), (20, -2, 'Sale'),
    (21, -5, 'Sale'), (22, -30, 'Sale'), (23, -12, 'Sale'), (24, -6, 'Sale'),
    (25, -4, 'Sale'), (26, -20, 'Sale'), (27, -1, 'Sale'), (28, -8, 'Sale'),
    (29, -10, 'Sale'), (30, -2, 'Sale');
	
-- 5. CRUD Operations 

-- Add a new product 
INSERT INTO Products (product_name, category, unit_price, stock_quantity, supplier_id)
VALUES ('Ibuprofen', 'Pain Relief', 3.50, 150, 1);

-- Select all Products
SELECT * 
FROM Products; 

-- Update: Modify Product Price 
UPDATE Products
SET unit_price = 4.00
WHERE product_name = 'Ibuprofen';

-- Delete: Remove a Product 
DELETE FROM Products 
WHERE product_name = 'Bandages';


-- 6. Advanced Queries 

-- Retrieve all Orders with Customer Details
SELECT o.order_id, c.customer_name, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- Get Stock Levels of All Products
SELECT product_name, stock_quantity
FROM Products;

-- Sales Summary per Product
SELECT p.product_name, SUM(od.quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;

-- 7. Views for Reporting

CREATE VIEW sales_summary AS
SELECT p.product_name, SUM(od.quantity) AS TotalQuantitySold, SUM(od.quantity * od.unit_price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;

-- 8. Stored Procedure to Add Inventory
CREATE OR REPLACE FUNCTION add_inventory(product_id INT, quantity INT) RETURNS VOID AS $$
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity + quantity
    WHERE product_id = product_id;
    INSERT INTO InventoryTransactions (product_id, quantity_change, transaction_type)
    VALUES (product_id, quantity, 'Restock');
END;
$$ LANGUAGE plpgsql;

-- 9. Trigger to Auto-Update Inventory on Order
CREATE TRIGGER update_inventory_after_order
AFTER INSERT ON OrderDetails
FOR EACH ROW
EXECUTE FUNCTION add_inventory(NEW.product_id, NEW.quantity);

-- 10. Analytical Queries for Insights

-- Top 5 Best-Selling Products
SELECT product_name, SUM(quantity) AS TotalSold
FROM OrderDetails
JOIN Products ON OrderDetails.product_id = Products.product_id
GROUP BY product_name
ORDER BY TotalSold DESC
LIMIT 5;

-- Customers with the Most Orders
SELECT c.customer_name, COUNT(o.order_id) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY TotalOrders DESC;

-- END OF SCRIPT




