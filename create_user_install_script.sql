/* Name: Mohamed Barry              Date Created: 10/21/2024
                                    Date Modified: 11/2/2024
    Purpose: this script creates users with some permissions 
*/

SELECT '' AS 'Installation Starting!!!';

/* Remove the users if they are already there.
*/

SELECT '' AS 'Dropping users';

DROP USER IF EXISTS 'prj_root'@'localhost';
DROP USER IF EXISTS 'prj_user_01'@'localhost';
DROP USER IF EXISTS 'prj_user_02'@'localhost';
DROP USER IF EXISTS 'prj_user_03'@'localhost';

SELECT '' AS 'Creating user';

-- Create a root user named prj_root

CREATE USER IF NOT EXISTS 'prj_root'@'localhost'
        IDENTIFIED BY 'guttman_2024'
        PASSWORD REQUIRE CURRENT;

SELECT '' AS 'User prj_root Created'; 

-- Let's create prj_user_01
CREATE USER IF NOT EXISTS 'prj_user_01'@'localhost'
        IDENTIFIED BY 'test_user_20241021'
-- Add some password settings 
        FAILED_LOGIN_ATTEMPTS 0
        PASSWORD_LOCK_TIME 0
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

SELECT '' AS 'User prj_user01 Created'; 

-- Let's create prj_user_02
CREATE USER IF NOT EXISTS 'prj_user_02'@'localhost'
        IDENTIFIED BY 'test_user_20241021'
-- Add some password settings 
        FAILED_LOGIN_ATTEMPTS 4
        PASSWORD_LOCK_TIME 1
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

SELECT '' AS 'User prj_user02 Created'; 

-- Let's create prj_user_03
CREATE USER IF NOT EXISTS 'prj_user_03'@'localhost'
        IDENTIFIED BY 'test_user_20241021'
-- Add some password settings 
        FAILED_LOGIN_ATTEMPTS 4
        PASSWORD_LOCK_TIME UNBOUNDED    
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

SELECT '' AS 'User prj_user03 Created'; 

-- DROP and Create roles
SELECT '' AS 'CREATING ROLES';
DROP ROLE IF EXISTS 'read_only_classicmodels_db';
CREATE ROLE IF NOT EXISTS 'read_only_classicmodels_db';

GRANT SELECT ON classicmodels.* TO read_only_classicmodels_db;

SELECT '' AS 'Access To All Tables classicmodels Created';
                            
SELECT '' AS 'CREATING ROLES';
DROP ROLE IF EXISTS 'read_all_employees';
CREATE ROLE IF NOT EXISTS 'read_all_employees';
-- Grant Access
GRANT SELECT ON classicmodels.employees TO read_all_employees;

SELECT '' AS 'Acess Created For read_all_employees';

SELECT '' AS 'Granting Privileges';

-- Give the user prj_user_01 some privileges INSERT and UPDATE
GRANT INSERT, UPDATE
    ON employees.* TO 'prj_user_01'@'localhost' WITH GRANT OPTION;

SELECT '' AS 'Privileges For prj_user_01 Created';

-- let's give privilege to user prj_user_02 
GRANT read_only_classicmodels_db TO 'prj_user_02'@'localhost';

SELECT '' AS 'Privileges For prj_user_02 Created';

-- let's give privilege to user prj_user_03
 GRANT read_only_classicmodels_db TO 'prj_user_03'@'localhost';

 SELECT '' AS 'Privilege For prj_user_03 Created';

SELECT user, show_db_priv, account_locked
FROM mysql.user;
SELECT '' AS 'installation Completed';