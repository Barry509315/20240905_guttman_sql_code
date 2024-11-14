/* Name: Mohamed Barry              Date Created: 11/07/2024
                                    Date Modified: 11/07/2024
    Purpose: This script creates a stored procedure that given an 
    employee number, retrieves the number and name of the last
    department where the employee worked.
*/

-- SYSTEM CLEAR;

-- Opening print statement

SELECT 'LINE 09' AS 'INSTALLATION Starting!!!';
SELECT USER() AS 'INSTALLATION USER';
-- Remove the database if it is already there

DROP DATABASE IF EXISTS my_testdb;

/* Create the database after making sure it is 
    not already there 
*/

-- The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS my_testdb
-- The following line is unique to MYSQL it is optional
-- If left out the MYSQL database will take the default settings
-- of the database.
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created
SHOW DATABASES;

SELECT 'LINE 31' AS 'DATABASE CREATION COMPLETED';

-- Remove procedure if it is already there
DROP PROCEDURE IF EXISTS usp_get_employee_dept;

-- Create procedure
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS usp_get_employee_dept (IN e_emp_no INT)

BEGIN 
    SELECT
        'Successful' AS 'Installation',
        e.emp_no,
        d.dept_no,
        d.dept_name
    FROM
        employees e 
    JOIN 
        dept_emp de ON e.emp_no = de.emp_no
    JOIN 
        departments d ON de.dept_no = d.dept_no
    WHERE 
        e.emp_no = e_emp_no
        AND 
        de.from_date = (
                        SELECT 
                            MAX(from_date)
                        FROM
                            dept_emp
                        WHERE 
                            emp_no = e_emp_no
        );
END//

DELIMITER ;

CALL usp_get_employee_dept(10010);
