/* Name: Mohamed Barry              Date Created: 12/02/2024
                                    Date Modified: 12/02/2024
    Purpose:  
*/
-- Opening print statement

SELECT 'LINE 09' AS 'INSTALLATION SCRIPT STARTING!!!';

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
-- Select the database created
USE my_selectdb;

SELECT 'LINE 31' AS 'DATABASE CREATION COMPLETED',
        DATABASE() AS 'DATABASE NAME';
-- Let's create some tables

DROP TABLE IF EXISTS user_info;
CREATE TABLE user_info(
    info_id     INT         AUTO_INCREMENT,
    first_name  VARCHAR(50)     NOT NULL,
    last_name   VARCHAR(50)     NOT NULL,
    address_user    VARCHAR(100),
    created_at  TIMESTAMP,
    update_at   TIMESTAMP,

    PRIMARY KEY(info_id),
    CONSTRAINT UQ_Person UNIQUE(info_id, first_name, last_name)

);

DROP TABLE IF EXISTS delete_info;
CREATE TABLE delete_info(
    delete_id     INT         AUTO_INCREMENT,
    info_id        INT     NOT NULL,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    address_user    VARCHAR(100),
    delete_at   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(delete_id)

);
-- let's see the tables created 
SHOW TABLES;
-- Let's create some functions
DROP FUNCTION IF EXISTS usf_check_person;
DELIMITER $$
CREATE FUNCTION IF NOT EXISTS usf_check_person(
        uf_info_id   INT
)
RETURNS BOOLEAN DETERMINISTIC
BEGIN   
        DECLARE check_name_flag   BOOLEAN;
        SELECT EXISTS(
            SELECT *
            FROM user_info
            WHERE info_id = uf_info_id
        ) INTO check_name_flag;

        RETURN check_name_flag;

END $$

DELIMITER ;

SELECT usf_check_person(1);
INSERT INTO user_info(first_name, last_name, created_at)
        VALUES('Mohamed','Barry',CURRENT_TIMESTAMP);
SELECT usf_check_person(1);
-- Let's create some procedures
DROP PROCEDURE IF EXISTS usp_modify_user_info;
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS usp_modify_user_info(
    IN usp_first_name   VARCHAR(50),
    IN usp_last_name    VARCHAR(50),
    IN usp_address      VARCHAR(100),
    IN usp_info_id      INT
)
BEGIN
    DECLARE usf_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
    IF (SELECT usf_check_person(usp_info_id)) THEN 
        
        SELECT created_at
        INTO usf_created_at
        FROM user_info
        WHERE info_id = usp_info_id;

        SELECT "UPDATE" as user_info;

        UPDATE user_info
        SET     first_name = usp_first_name,
                last_name = usp_last_name,
                address_user = usp_address,
                created_at = usf_created_at,
                update_at = CURRENT_TIMESTAMP
        WHERE   info_id = usp_info_id;
    ELSE
        SELECT "ADDED ENTRY" as user_info;
        INSERT INTO user_info(first_name, last_name, address_user, created_at)
        VALUES(usp_first_name, usp_last_name, usp_address, CURRENT_TIMESTAMP);
    END IF;
END $$

DELIMITER ;
SELECT * FROM user_info;
CALL usp_modify_user_info('Med','Flex','123 Mayberry Ave',1);
CALL usp_modify_user_info('NewFirstName','NewLastName','Some address',0);
-- Let's see what's in the table
SELECT * FROM user_info;
-- Completion message
SELECT 
        'Installation' AS 'Completed',
        USER() AS 'BY',
        DATABASE() AS 'ON',
        NOW() AS 'AT';