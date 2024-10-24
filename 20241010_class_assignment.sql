/* Name: Mohamed  Barry         Date Created: 10/10/2024
                                Data Modified: 10/21/2024
    Purpose: this script creates a database named testdb_20241010, 
            creates 3 tables with their primary keys.
*/
-- Opening print statement 
SELECT '' AS 'INSTALLATION SCRIPT STARTING!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20241010;

/* Create the database after checking making it is 
    not already there 
*/

-- The following line is pure standard SQL 
CREATE DATABASE IF NOT EXISTS testdb_20241010
-- The following line is unique to MYSQL it is optional 
-- If left out the MySQL database will take the default settings
-- of the database
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is creadted

SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED!!!';

-- Let's enter the database
USE testdb_20241010;

-- Let's create some tables
DROP TABLE IF EXISTS student;
CREATE TABLE IF NOT EXISTS student(
    student_id      INT AUTO_INCREMENT,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    phone           VARCHAR(25) NOT NULL,

    PRIMARY KEY(student_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';
-- Let's create some tables
DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company(
    company_id      INT AUTO_INCREMENT,
    company_name            VARCHAR(50) NOT NULL,
    company_address         VARCHAR(100),
    email           VARCHAR(50),
    phone           VARCHAR(25),

    PRIMARY KEY(company_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';
-- Let's create some tables
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
    customer_id     INT AUTO_INCREMENT,
    first_name      VARCHAR(20) NOT NULL,
    last_name       VARCHAR(20) NOT NULL,
    age             INT,
    country         VARCHAR(20),


    PRIMARY KEY(customer_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED!!!';

-- Let's add some values

SELECT '' AS 'INSTALLATION SCRIPT COMPLETED!!!';

-- Insert some data into table company

INSERT INTO company(company_name, company_address, email, phone)
VALUES 
('Balboa Software', '475 E. Baker Street', 'customer@balboa.com', '834-4349'),
('Dynix Publishing', '7 North Plymouth St.', 'customer_sercie@dynix.com', '(733)508-1603'),
('EOS International', '56 Vine Road', 'customer@eos.com', '(496-9721)'),
('Taylor & Francis', '73 E. High Point Road', 'customer_service@taylorfrancis.com', '(438)831-5041'),
('Faulker Information Services', '132 w. 31st', 'customer_service@falkner.com','(222352-5467)'),
('Montgomery Fleet Equipment', '7 South Wild Horse Dr.', 'service@fleetequip.com','(919-960-5818)');

SELECT * FROM company;
SELECT '' AS 'DATA INSERT COMPLETED!!!';
-- Insert some data into table customer

INSERT INTO customer(first_name, last_name, age, country)
VALUES
('Adam', 'White', '22', 'India'),
('Darren', 'Addams', '31', 'Germany'),
('Debie', 'Allen', '54', 'Germany'),
('Monica', 'Kline', '18', 'USA'),
('Raymond', 'Diaz', '17', 'America'),
('Jacoby', 'Bradhaw', '20', 'Canada'),
('Ahtony', 'Perl', '32', 'Mexico'),
('Thomas', 'Owen', '23', 'America'),
('Gayle', 'King', '45', 'India'),
('devon', 'davis', '40', 'Italy');

SELECT * FROM customer;
SELECT '' AS 'DATA INSERT COMPLETED!!!';
-- Insert some data into table student

INSERT INTO student(first_name, last_name, phone)
VALUES
('Adam', 'White', '834-4349'),
('Darren', 'Addams', '(733)508-1603'),
('Debie', 'Allen', '(438)496-9721'),
('Monica', 'Kline', '222831-5041'),
('Raymond', 'Diaz', '352-5467'),
('Jacoby', 'Bradhaw', '919-960-5818'),
('Ahtony', 'Perl', '814-279-5654'),
('Thomas', 'Owen', '(222)831-4349'),
('Gayle', 'King', '732-963-7253'),
('devon', 'davis', '(814)717-5818');

SELECT * FROM student;
SELECT '' AS 'DATA INSERT COMPLETED!!!';
-- Let's do some update into table student

UPDATE student
SET first_name = 'Debbie', last_name = 'Allen'
WHERE student_id = 3;

UPDATE student
SET first_name = 'Jacob', last_name = 'Bradshaw'
WHERE student_id = 6;

UPDATE student
SET first_name = 'Anthony', last_name = 'Perl'
WHERE student_id = 7;

UPDATE student
SET first_name = 'Devon', last_name = 'Davis'
WHERE student_id = 10;

-- Let's make some update into table customer

UPDATE customer
SET first_name = 'Debbie', last_name = 'Allen'
WHERE customer_id = 3;

UPDATE customer
SET first_name = 'Jacob', last_name = 'Bradshaw'
WHERE customer_id = 6;

UPDATE customer
SET first_name = 'Anthony', last_name = 'Perl'
WHERE customer_id = 7;

UPDATE customer
SET first_name = 'Devon', last_name = 'Davis'
WHERE customer_id = 10;

-- Let's show the tables data
SELECT * FROM student;
SELECT * FROM customer;
SELECT * FROM company;
SELECT '' AS 'TABLES UPDATE COMPLETED!!!';