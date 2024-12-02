/* Name: Mohamed Barry              Date Created: 11/04/2024
                                    Date Modified: 11/26/2024
    Purpose: this script creates a database named my_selectdb, with 8 tables,
            then insert some data into the tables to run some 
            SELECT statement. 
*/

-- Opening print statement

SELECT 'INFO' AS 'INSTALLATION SCRIPT STARTING!!!';

SELECT USER() AS 'INSATALLATION USER';
-- Remove the database if it is already there

DROP DATABASE IF EXISTS my_selectdb;

/* create the database after checking making sure it is
    not already there
*/

-- The following line is pure Standard SQLS
CREATE DATABASE IF NOT EXISTS my_selectdb
-- The following line is unique to MySQL it is optional 
-- If left out the MySQL database will take the default settings
-- of the database. 
-- EXPLAIN CHARACTER SET:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created 

SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';

-- Let's enter the database
USE my_selectdb;

-- Let's create our tables
-- table vendor
DROP TABLE IF EXISTS vendor;
CREATE TABLE IF NOT EXISTS vendor(
    vendor_id     VARCHAR(2) NOT NULL,
    vendor_name      VARCHAR(25) NOT NULL,

    PRIMARY KEY(vendor_id)
);
SELECT '' AS 'Table Created: vendor';

-- table category
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
    category_id     VARCHAR(2) NOT NULL,
    category_name      VARCHAR(25) NOT NULL,

    PRIMARY KEY(category_id)
);
SELECT '' AS 'Table Created: category';

-- table product
DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product(
    product_id     VARCHAR(3) NOT NULL,
    product_name      VARCHAR(25) NOT NULL,
    product_price   DECIMAL(7,2) NOT NULL,
    vendor_id       VARCHAR(2) NOT NULL,
    category_id     VARCHAR(2) NOT NULL,

    PRIMARY KEY(product_id)
);
SELECT '' AS 'Table Created: product';

-- table region
DROP TABLE IF EXISTS region;
CREATE TABLE IF NOT EXISTS region(
    region_id     VARCHAR(2) NOT NULL,
    region_name      VARCHAR(25) NOT NULL,

    PRIMARY KEY(region_id)
);
SELECT '' AS 'Table Created: region';

-- table store
DROP TABLE IF EXISTS store;
CREATE TABLE IF NOT EXISTS store(
    store_id     VARCHAR(3) NOT NULL,
    store_zip      VARCHAR(5) NOT NULL,
    region_id       VARCHAR(2) NOT NULL,

    PRIMARY KEY(store_id)
);
SELECT '' AS 'Table Created: store';

-- table customer
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
    customer_id     CHAR(7) NOT NULL,
    customer_name      VARCHAR(15) NOT NULL,
    customer_zip       CHAR(5) NOT NULL,

    PRIMARY KEY(customer_id)
);
SELECT '' AS 'Table Created: customer';

-- table salestransaction
DROP TABLE IF EXISTS salestransaction;
CREATE TABLE IF NOT EXISTS salestransaction(
    transaction_id     VARCHAR(8) NOT NULL,
    customer_id      CHAR(7) NOT NULL,
    store_id       VARCHAR(5) NOT NULL,
    transaction_date    DATE NOT NULL,

    PRIMARY KEY(transaction_id)
);
SELECT '' AS 'Table Created: salestransaction';

-- table soldvia
DROP TABLE IF EXISTS soldvia;
CREATE TABLE IF NOT EXISTS soldvia(
    product_id     CHAR(3) NOT NULL,
    transaction_id      VARCHAR(8) NOT NULL,
    num_of_items       INT NOT NULL,

    PRIMARY KEY(product_id, transaction_id)
);
SELECT '' AS 'Table Created: soldvia';

-- Let's ou data into the tables
INSERT INTO category
VALUES ('CP','Camping'),
        ('FW','Footwear');
SELECT '' AS 'DATA INSERTED INTO CATEGORY';
-- Display data in category table
-- SELECT * FROM category;

INSERT INTO region
VALUES ('C','Chicagoland'),
        ('T','Tristate');
SELECT '' AS 'DATA INSERTED INTO REGION';
-- Display data in region table
-- SELECT * FROM region;

INSERT INTO vendor
VALUES ('PG','Pacifica Gear'),
        ('MK','Mountain King');
SELECT '' AS 'DATA INSERTED INTO vendor';
-- Display data in vendor table
-- SELECT * FROM vendor;

INSERT INTO customer
VALUES ('1-2-333','Tina','60137'),
        ('2-3-444','Tony','60611'),
        ('3-4-555','Pam','35401');
SELECT '' AS 'DATA INSERTED INTO customer';
-- Display data in vendor table
-- SELECT * FROM customer;

INSERT INTO store
VALUES ('S1','60600','C'),
        ('S2','60605','C'),
        ('S3','35400','T');
SELECT '' AS 'DATA INSERTED INTO store';
-- Display data in vendor table
-- SELECT * FROM store;

INSERT INTO soldvia
VALUES ('1X1','T111','1'),
        ('2X2','T222','1'),
        ('3X3','T333','5'),
        ('1X1','T333','1'),
        ('4X4','T444','4'),
        ('2X2','T444','2'),
        ('4X4','T555','4'),
        ('5X5','T555','2'),
        ('6X6','T666','1');
SELECT '' AS 'DATA INSERTED INTO soldvia';
-- Display data in vendor table
-- SELECT * FROM soldvia;

INSERT INTO product
VALUES ('1X1','Zzz Bag','100','PG','CP'),
        ('2X2','Easy Boot','70','MK','FW'),
        ('3X3','Cosy Sock','15','MK','FW'),
        ('4X4','Dura Boot','90','PG','FW'),
        ('5X5','Tiny Tent','150','MK','CP'),
        ('6X6','Biggy Tent','250','MK','CP');
SELECT '' AS 'DATA INSERTED INTO product';
-- Display data in vendor product
-- SELECT * FROM product;

-- My 11 SELECT statements 

SELECT product_id, product_name, product_price, category_id 
        FROM product;
SELECT '' AS 'First SELECT Made !!!';

SELECT product_name, product_id, vendor_id, category_id, product_price 
        FROM product;
SELECT '' AS 'Second SELECT Made !!!';

SELECT product_id, product_name, vendor_id, product_price
        FROM product 
        WHERE product_id IN (5,6);
SELECT '' AS 'Third SELECT Made !!!';

SELECT product_id, product_name, vendor_id, product_price
        FROM product 
        WHERE product_id IN (2,3,4);
SELECT '' AS 'Fourth SELECT Made !!!';

SELECT 'MK' AS vendor_id
UNION ALL 
SELECT 'MK'
UNION ALL
SELECT 'MK'
UNION ALL
SELECT 'MK'
UNION ALL 
SELECT 'PG' AS vendor_id
UNION ALL 
SELECT 'PG'
UNION ALL
SELECT 'PG';
SELECT '' AS 'Fifth SELECT Made !!!';

SELECT vendor_id 
        FROM vendor;
SELECT '' AS 'Sixth SELECT Made !!!';

SELECT product_id, product_name, category_id, product_price
        FROM product
        WHERE product_id IN ('3X3','2X2','4X4')
        ORDER BY 
        CASE product_id
            WHEN '3X3' THEN 1
            WHEN '2X2' THEN 2
            WHEN '4X4' THEN 3
            END;
SELECT '' AS 'Seventh SELECT Made !!!';

SELECT product_id, product_name, category_id, product_price
        FROM product
        WHERE product_id IN ('4X4','2X2','3X3')
        ORDER BY 
        CASE product_id
            WHEN '4X4' THEN 1
            WHEN '2X2' THEN 2
            WHEN '3X3' THEN 3
            END;
SELECT '' AS 'Eighth SELECT Made !!!';

SELECT product_id, product_name, category_id, product_price
        FROM product
        WHERE product_id IN ('4X4','2X2','3X3')
        ORDER BY 
        CASE product_id
            WHEN '4X4' THEN 1
            WHEN '2X2' THEN 2
            WHEN '3X3' THEN 3
            END;
SELECT '' AS 'Ninth SELECT Made !!!';

SELECT product_id, product_name, product_price, category_id 
        FROM product
        WHERE product_id IN ('1X1','5X5','6X6','3X3','2X2','4X4')
        ORDER BY 
        CASE product_id
        WHEN '1X1' THEN 1
        WHEN '5X5' THEN 2
        WHEN '6X6' THEN 3
        WHEN '3X3' THEN 4
        WHEN '2X2' THEN 5
        WHEN '4X4' THEN 6
        END;
SELECT '' AS 'Tenth SELECT Made !!!';

SELECT product_id, product_name, product_price, vendor_id, category_id
        FROM product
        WHERE product_id IN (2,4);
SELECT '' AS 'Eleventh SELECT Made !!!';