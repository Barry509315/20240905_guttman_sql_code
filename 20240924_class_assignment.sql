/* SQL installation script:
Name:                           Date Created:
                                Data Modified:
Purpose:                                
*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS 20240924_testdb;

/* Create the database after checking making sure it is 
not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS 20240924_testdb
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
USE 20240924_testdb;

-- Let's create some tables

-- Closing print statement 
SELECT '' AS 'Installation completed, check for errors';
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS order_item;

CREATE TABLE supplier(
    supplier_id    INT AUTO_INCREMENT,
    company_name    VARCHAR(20),
    contact_name    VARCHAR(20),
    city            VARCHAR(20),
    country         VARCHAR(20),
    phone           INT,
    fax             INT,

    PRIMARY KEY(supplier_id)
);

CREATE TABLE customer(
    customer_id    INT AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    city      VARCHAR(20),
    country   VARCHAR(20),
    phone   INT,

    PRIMARY KEY(customer_id)
);

CREATE TABLE product(
    product_id    INT AUTO_INCREMENT,
    product_name  VARCHAR(15),
    supplier_id  INT,
    unit_price INT,
    package    INT,
    is_discontinued VARCHAR(10),


    PRIMARY KEY(product_id),
    FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id)
);

CREATE TABLE `order`(
    order_id    INT AUTO_INCREMENT,
    order_date  DATE,
    customer_id  INT,
    total_amount INT,

    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_item(
    order_item_id    INT AUTO_INCREMENT,
    order_id  INT,
    product_id   INT,
    unit_price     INT,
    quantity  INT,

    PRIMARY KEY(order_item_id),
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);