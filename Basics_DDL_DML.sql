-- ---------------------------------------------------------------------
-- DDL: Data Description Language
-- ---------------------------------------------------------------------

-- CREATE, ALTER, DROP (removes a table from a database and from the schema), RENAME, TRUNCATE (removes table rows while keeping the schema)

-- ---------------
-- create commands:
-- ---------------

-- create database
CREATE DATABASE demonstration;

-- using database: points to a database
USE demonstration;

-- create table: information on field, type, null, key, default etc

CREATE TABLE customers (
--  <name> <data type> <constraint>
    id 		INT 		NOT NULL,
    name 	VARCHAR(32) NOT NULL,
    time 	TIMESTAMP 	DEFAULT CURRENT_TIMESTAMP NOT NULL,
    age 	INT,
    address VARCHAR(32),
    salary 	INT
);

-- describe schema: shows the schema of a table
DESC customers;

-- --------------
-- alter commands:
-- --------------

-- alter table: add primary key
-- ALTER TABLE customers ADD CONSTRAINT PRIMARY KEY (id);

-- alter table: add composite primary key
ALTER TABLE customers ADD CONSTRAINT PRIMARY KEY (id, name);

-- alter table: add column
ALTER TABLE customers ADD COLUMN employer VARCHAR(32);

-- -------------
-- drop commands:
-- -------------

-- drop column:
ALTER TABLE customers DROP COLUMN employer;

-- drop table: must be sure before executing this command
DROP TABLE customers;

-- drop database: must be sure before executing this command
DROP DATABASE demonstration;

-- ---------------------------------------------------------------------
-- DML: Data Manipulation Language
-- ---------------------------------------------------------------------

-- SELECT, INSERT, UPDATE, DELETE

-- DDL CREATE to create another table
CREATE TABLE transportation (
	ship_mode 		VARCHAR(25),
    vehicle_company	VARCHAR(25),
    toll_required	boolean
);

-- ---------------
-- insert commands:
-- ---------------

-- insert ('DELIVERY TRUCK', 'Ashok Layland', false);
INSERT INTO transportation VALUE ('DELIVERY TRUCK', 'Ashok Layland', false);

-- insert ('REGULAR AIR', 'Air India', false);
INSERT INTO transportation VALUE ('REGULAR AIR', 'Air India', false);


-- DML SELECT to display a table
SELECT * FROM transportation;

-- ---------------
-- update commands:
-- ---------------

-- update: a field value in a table for all records -> results in error if safe option is selected in preferences
UPDATE transportation SET toll_required = false;

-- DDL ALTER to set a primary key
ALTER TABLE transportation ADD CONSTRAINT PRIMARY KEY (ship_mode);

-- update: a field value in a table for selected records -> must use a key column in where clause if safe mode is selected in preferences
UPDATE transportation SET toll_required = true WHERE ship_mode = 'DELIVERY TRUCK';

-- update: a field value in a table for selected records -> no need to use a key column in where clause if safe mode is un-selected in preferences
UPDATE transportation SET toll_required = true WHERE vehicle_company = 'Ashok Layland';

-- ---------------
-- delete commands:
-- ---------------

-- delete: all records in a table -> results in error if safe option is selected in preferences
DELETE FROM transportation;

-- delete: a particular record in a table -> must use a key column in where clause if safe mode is selected in preferences
DELETE FROM transportation WHERE ship_mode = 'REGULAR AIR';

-- delete: a particular record in a table -> no need to use a key column in where clause if safe mode is un-selected in preferences
DELETE FROM transportation WHERE vehicle_company = 'Air India';


-- DDL ALTER to add a column
ALTER TABLE transportation ADD COLUMN vehicle_number VARCHAR(32);

-- DML UPDATE to update a field in a column, without WHERE
UPDATE transportation SET vehicle_number = 'MH-05-81234';

-- DML UPDATE to update a field in a column, with WHERE clause
UPDATE transportation SET vehicle_number = 'AI-12345' WHERE vehicle_company = 'Air India';












