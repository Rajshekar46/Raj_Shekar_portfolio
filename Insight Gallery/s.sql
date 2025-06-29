## 1.	create a database called 'assignment' (Note please do the assignment tasks in this database) ?
# Answer : Created. 
--- Create DATABASE assignment;
USE ASSIGNMENT;

--------------------------------------------------------------------------------------------------------------
## 2. Create the tables from ConsolidatedTables.sql and enter the records as specified in it ?
# Answer: Consolidated tables Imported in the name of ' assignment'
SHOW TABLES;
---------------------------------------------------------------------------------------------------------------
## 3. Create a table called countries with the following columns ,name, population, capital ?
# Answer: 

Create TABLE Countries(
Name varchar (20),
Population INT UNSIGNED,
Capital VARCHAR (20));

## - choose appropriate datatypes for the columns :
## 3. (a) Insert the following data into the table : 

SELECT * FROM COUNTRIES;
INSERT INTO COUNTRIES 
VALUES('China', 			1382,	 	'Beijing'),
('India',			1326,	 	'Delhi'),
('United States',		324,	 	'Washington D.C'),
('Indonesa',		260,	 	'Jakarta'),
('Brazil',			209,	 	'Brasilia'),
('Pakistan',		193,	 	'Islamabad'),
('Nigeria',			187,	 	'Abuja'),
('Bangladesh',		163,	 	'Dhaka'),
('Russia',			143,	 	'Moscow'),
('Mexico',			128,	 	'Mexico City'),
('Japan',			126,	 	'Tokyo'),
('Philippines',		102,	 	'Manila'),
('Ethiopia',		101,	 	'Addis Ababa'),
('Vietnam', 		94,	 	'Hanoi'),
('Egypt',			93,	 	'Cairo'),
('Germany',		81,	 	'Berlin'),
('Iran',			80,	 	'Tehran'),
('Turkey',			79,	 	'Ankara'),
('Congo',			79,	 	'Kinshasa'),
('France',			64,	 	'Paris'),
('United Kingdom',	65,	 	'London'),
('Italy',			60,	 	'Rome'),
('South Africa',		55,	 	'Pretoria'),
('Myanmar',		54,	 	'Naypyidaw');

SELECT * FROM COUNTRIES;
--------------------------------------------------------------------------------------------------
## 3.(b) Add a couple of countries of your choice ?
# Answer: 
SELECT * FROM COUNTRIES;
INSERT INTO COUNTRIES 
VALUES('Afganisthan', 6758,'Kabul'),
('Austria',3452,'Vienna'),
('Australia',7654,'Canberra'),
('Malaysia',8945,'Kuala Lumpur'),
('UAE',1236, 'Dubai');
----------------------------------------------------------------------------------------------------
## 3.(c) Change ‘Delhi' to ‘New Delhi'?
# Answer : 
UPDATE	COUNTRIES SET CAPITAL ='New Delhi'  WHERE NAME = 'INDIA';
SET SQL_SAFE_UPDATES=0;
UPDATE	COUNTRIES SET CAPITAL ='New Delhi'  WHERE NAME = 'INDIA';
SELECT * FROM COUNTRIES;

------------------------------------------------------------------------------------------------------

## 4. Rename the table countries to big_countries?
# Answer: 
ALTER TABLE COUNTRIES RENAME TO BIG_COUNTRIES;
SELECT * FROM BIG_COUNTRIES;

------------------------------------------------------------------------------------------------------

## 5. Create the following tables. Use auto increment wherever applicable ?
-- a. Product
-- product_id - primary key
-- product_name - cannot be null and only unique values are allowed
-- description
-- supplier_id - foreign key of supplier table

# Answer (a) : 
CREATE TABLE PRODUCT(
PRODUCT_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
PRODUCT_NAME VARCHAR (50) NOT NULL UNIQUE,
DESCRIPTION VARCHAR(50),
SUPPLIER_ID INT UNSIGNED);

DESC PRODUCT;

-- b. Suppliers
-- supplier_id - primary key
-- supplier_name
-- location
# Answer (b) : 
CREATE TABLE SUPPLIERS(
SUPPLIER_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
SUPPLIER_NAME VARCHAR (50),
LOCATION VARCHAR(50));
ALTER TABLE PRODUCT ADD CONSTRAINT FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS (SUPPLIER_ID);

DESC SUPPLIERS;

-- c. Stock
-- id - primary key
-- product_id - foreign key of product table
-- balance_stock
# Answer (C) : 
CREATE TABLE STOCK(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
PRODUCT_ID INT UNSIGNED,
BALANCE_STOCK VARCHAR(50),
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID));

ALTER TABLE STOCK AUTO_INCREMENT =100;

DESC STOCK;
-------------------------------------------------------------------------------------------------------

## 6. Enter some records into the three tables?
#ANSWER: 
-- FIRST WE NEED TO ENTER THE VALUE IN PARENT TABLE = SUPPLIERS
# SUPPLIERS :
SELECT * FROM SUPPLIERS;
DESC SUPPLIERS;
INSERT INTO SUPPLIERS (SUPPLIER_NAME,LOCATION) VALUES 
('HYUNDAI MOTORS GROUP','SOUTH KOREA');
INSERT INTO SUPPLIERS (SUPPLIER_NAME,LOCATION) VALUES
('SAIC MOTOR','SHANGHAI'),
('MARUTI UDYOG LIMITED','INDIA'),
('MERCEDES_BENZ AG','GERMANY'),
('BAYERISCHE MOTOREN WERKE AG','GERMANY');
SELECT*FROM SUPPLIERS;

-- SECOND WE NEED TO ENTER THE VALUE IN CHILD TABLE = PRODUCT FOR PARENT TABLE SUPPLIERS 
# PRODUCT :
SELECT * FROM PRODUCT;
DESC PRODUCT;
INSERT INTO product (PRODUCT_NAME,DESCRIPTION,SUPPLIER_ID) VALUES(
'CRETA','PETROL',1),
('MG HECTOR','DIESEL',2),
('BREZZA','PETROL',3),
('BENZ C CLASS','DIESEL',4),
('BMW 7 SERIES','DIESEL',5);

-- THIRD WE NEED TO ENTER THE VALUE IN CHILD TABLE = STOCK FOR PARENT TABLE PRODUCT--
# STOCK :
SELECT * FROM STOCK;
DESC STOCK;
INSERT INTO STOCK (PRODUCT_ID,BALANCE_STOCK) VALUES(
5,10),
(6,20),
(7,12),
(8,5),
(9,2);
----------------------------------------------------------------------------------------------------------
## 7. Modify the supplier table to make supplier name unique and not null.
# ANSWER: 
DESC SUPPLIERS;
ALTER TABLE suppliers MODIFY SUPPLIER_NAME VARCHAR(50) UNIQUE NOT NULL;
-----------------------------------------------------------------------------------------------------------
## 8. Modify the emp table as follows
# (A) Add a column called deptno
-- ANSWER: 
SELECT * FROM EMP;
ALTER TABLE EMP ADD COLUMN DEPTNO INT UNSIGNED;
#(B) Set the value of deptno in the following order
-- deptno = 20 where emp_id is divisible by 2
-- deptno = 30 where emp_id is divisible by 3
-- deptno = 40 where emp_id is divisible by 4
-- deptno = 50 where emp_id is divisible by 5
-- deptno = 10 for the remaining records.
-- ANSWER: 
SELECT * FROM EMP;
--- WE NEED TO CHANGE THE COLUMN NAME FROM EMP_NO TO EMP_ID
ALTER TABLE EMP RENAME COLUMN EMP_NO TO EMP_ID;
SELECT * FROM EMP;

--- ONE METHOD
UPDATE EMP SET DEPTNO =
CASE
WHEN EMP_ID MOD 2 = 0 THEN 20
WHEN EMP_ID MOD 3 = 0 THEN 30
WHEN EMP_ID MOD 4 = 0 THEN 40
WHEN EMP_ID MOD 5 = 0 THEN 50
ELSE 10
END;
-- SECOND METHOD--- 
UPDATE EMP SET DEPTNO =
 CASE
 WHEN EMP_ID % 2 = 0 THEN 20
 WHEN EMP_ID % 3 = 0 THEN 30
 WHEN EMP_ID % 4 = 0 THEN 40
 WHEN EMP_ID % 5 =0 THEN 50
 ELSE 10
 END;
 -------------------------------------------------------------------------------------------------------
 
 ## 9. Create a unique index on the emp_id column.
 # ANSWER: 
 CREATE UNIQUE INDEX EMP_ROLL_ID ON emp(EMP_ID);
 SELECT * FROM EMP;
 SHOW INDEXES FROM EMP;
 ---------------------------------------------------------------------------------------------------------
 
 ## 10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
     --- emp_no, first_name, last_name, salary
# ANSWER: 
-- EMP_NO IS CHANGED TO EMP_ID
CREATE VIEW EMP_SAL AS SELECT EMP_ID,FIRST_NAME,LAST_NAME,SALARY FROM emp
ORDER BY SALARY DESC;

SELECT * FROM EMP_SAL;

 