/* SQL installation script:
Name:                           Date Created:
                                Data Modified:
Purpose:                                
*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20240919;

/* Create the database after checking making sure it is 
not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20240919
-- The following line is unique to MySQL it is optional
-- If left out the mySQl database will take the default settings 
-- of the database
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS '##########################';

-- Let's enter the database
USE testdb_20240919;

-- Let's create some tables

-- Closing print statement 
SELECT '' AS 'Installation completed, check for errors';

CREATE TABLE orders(
    order_id INT AUTO_INCREMENT,
    order_date DATE,
    order_info_id INT,
    order_currency VARCHAR(10),

    PRIMARY KEY(order_id),
    FOREIGN KEY(order_info_id) REFERENCES order_info(order_info_id)
);

CREATE TABLE order_info(
    order_info_id INT,
    order_id INT,
    order_date DATE,
    product_id INT,
    product_quantity INT,

    PRIMARY KEY(order_info_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    FOREIGN KEY(orders) REFERENCES orders(order_id)
);

CREATE TABLE products(
    product_id INT,
    product_name VARCHAR(20),
    product_price INT,
    warehouse_id INT,

    PRIMARY KEY(product_id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE warehouses(
    warehouse_id INT,
    warehouse_location VARCHAR(20),

    PRIMARY KEY(warehouse_id)
);

CREATE TABLE deliveries(
    delivery_id INT,
    delivery_date DATE,
    warehouse_id INT,

    PRIMARY KEY(delivery_id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouses(warehouse_id)
);