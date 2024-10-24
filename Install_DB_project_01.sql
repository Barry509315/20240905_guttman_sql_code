/* Name: Mohamed Barry              Date Created: 10/20/2024
                                    Date Modified: 10/21/2024
    Purpose: this script creates a database named my_project_db, 
    creates 8 tables with their primary and foreign keys. 
*/

-- Opening print statement 
SELECT '' AS 'INSTALLATION SCRIPT STARTING!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS my_project_db;

/* Create the database after checking making it is 
    not already there 
*/

-- Create a database named my_project_db
CREATE DATABASE IF NOT EXISTS my_project_db
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is creadted

SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED!!!';

-- Let's enter the database
USE my_project_db;

-- Let's create 8 tables 
-- Let's create table category
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
    category_id     CHAR(2),
    category_name   VARCHAR(25),

    PRIMARY KEY(category_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table vendor
DROP TABLE IF EXISTS vendor;
CREATE TABLE IF NOT EXISTS vendor(
    vendor_id     CHAR(2),
    vendor_name   VARCHAR(25),

    PRIMARY KEY(vendor_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table customer
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
    customer_id     CHAR(7),
    customer_name   VARCHAR(15),
    customer_zip    CHAR(5),

    PRIMARY KEY(customer_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table product
DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product(
    product_id     CHAR(3),
    product_name   VARCHAR(25),
    product_price   DECIMAL(7,2),
    vendor_id       CHAR(2),
    category_id     CHAR(2),

    PRIMARY KEY(product_id),
    FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id),
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table region
DROP TABLE IF EXISTS region;
CREATE TABLE IF NOT EXISTS region(
    region_id     CHAR(1),
    region_name   VARCHAR(25),

    PRIMARY KEY(region_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table store
DROP TABLE IF EXISTS store;
CREATE TABLE IF NOT EXISTS store(
    store_id     CHAR(3),
    store_zip    CHAR(5),
    region_id    CHAR(1),

    PRIMARY KEY(store_id),
    FOREIGN KEY(region_id) REFERENCES region(region_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table salestransaction
DROP TABLE IF EXISTS salestransaction;
CREATE TABLE IF NOT EXISTS salestransaction(
    transaction_id     CHAR(2),
    customer_id         CHAR(7),
    store_id            CHAR(3),
    transaction_date    DATE,

    PRIMARY KEY(transaction_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(store_id) REFERENCES store(store_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's create table soldvia
DROP TABLE IF EXISTS soldvia;
CREATE TABLE IF NOT EXISTS soldvia(
    product_id     CHAR(3),
    transaction_id    VARCHAR(8),
    num_of_items    INT,

    FOREIGN KEY(transaction_id) REFERENCES salestransaction(transaction_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';