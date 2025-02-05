-- Questions:

/*
Q1: The first step of every RDBMS activity is to create a star schema for a particular data set. 
You have a total of eight tables as described earlier, and 
it is essential for you to create an entity relational diagram (ERD) in order to relate the various tables. 
Which of the following is the most appropriate relation among ‘employees’, ‘customers’, ‘orders’ and ‘offices’ based on the
problem statement?

-- A customer can be handled by one and only one employee as their sales representative.
-- An employee might be handling one or many customers as their sales representative.

-- An order can be placed by one and only one customer.
-- A customer can place one or more orders.

-- A customer can pay with one or more cheques
-- A payment can be done by one and only one customer

-- An employee can be part of one and only one office
-- An office can have one or more employees

A: Option B

The 'customers' table has only a one-to-many/zero relation with the 'orders' table. 
The 'employees' table has one/zero to many/zero relation with the 'customers' table. 
Also, the 'offices' table has only a one-to-many/zero relation with the 'employees' table.
*/


/*
Q2: Which of the following table names has a self-referential relationship based on the descriptions
of columns of each table given in the problem statement?

A: Option C: employees

The 'employees' table has a field 'reportsTo' which indicates that some of the employees have other employees as their reporting managers.
So, this table should have a self referencial relationship.
*/

/*
Q3: As you can see in the figure below, a one/zero-to-many/zero relation exists between the 'employees' and 'customers' tables. 
Identify the foreign key in the 'customers' table that relates this table with the 'employees' table.

A: Option D: salesRepEmployeeNumber

An employee is expected to be associated to zero or more customers as a sales representative.
*/

/*
Q4: Match the following actions with the appropriate SQL commands presented in the table given below.

a | Find all the employees from the 'employees' table | I   | ALTER
b | Add information about a new employee              | II  | DROP
c | Change the structure of the employee table        | III | SELECT
d | Remove the 'employees' table                      | IV  | INSERT

A: Option D: a-III, b-IV, c-I, d-II
*/

/*
Q5: Suppose you want to create a table named 'payments' in SQL with the two primary keys
'customerNumber' and 'checkNumber', as mentioned in the ERD. 
Which of the following queries is the correct one to achieve this?

A: Option A: 

CREATE TABLE `payments` (
  `customerNumber` int(11) NOT NULL,
  `checkNumber` varchar(12) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`,`checkNumber`),
  CONSTRAINT `customerNumber_fk` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
)

A composite primary key can be defined with both the key fields mentioned at the same time.
*/

-- Q-6: Insert the following two rows in the 'customers' table.
-- (495,'Diecast Collectables','Franco','Valarie','Boston','MA','51003','USA','1188',85100),
-- (496,'Kelly\'s Gift Shop','Snowden','Tony','Auckland  ','NULL','NULL','New Zealand','1612',110000)

# check number of records in customers table first
SELECT COUNT(*) FROM customers;
# 120 records

# insert the new records
INSERT INTO customers
VALUES
(495,'Diecast Collectables','Franco','Valarie','Boston','MA','51003','USA','1188',85100),
(496,'Kelly\'s Gift Shop','Snowden','Tony','Auckland','NULL','NULL','New Zealand','1612',110000);
# 2 records added

# check number of records in customers table again to verify
SELECT COUNT(*) FROM customers;
# 122 records

# confirm again by looking at unique customers in customers table
SELECT COUNT(DISTINCT customerNumber) FROM customers;
# 122 unique customers

-- A: Option A: INSERT


-- Q-7: In the "employees" table there are some entries where 'SR' is written instead of 'Sales Rep' where office code is equal to 4.
-- Update the 'employees' table by inserting a job title as 'Sales Rep' where office code is equal to 4.

-- check the table according to the given statement
SELECT jobTitle
FROM employees
WHERE officeCode = 4;
# There are 4 records with officeCode 4 but jobTitle is already 'Sales Rep' in these records

-- change the jobTitle in such records to 'SR' and back to 'Sales Rep' to demostrate running the update query
-- change to 'SR'
UPDATE employees
SET jobTitle = 'SR'
WHERE officeCode = 4;
-- check the table again to confirm the change
SELECT jobTitle
FROM employees
WHERE officeCode = 4;
# There are 4 records with officeCode 4 and jobTitle is changed to 'SR' in these records
-- change back to 'Sales Rep'
UPDATE employees
SET jobTitle = 'Sales Rep'
WHERE officeCode = 4;
-- check the table again to confirm the change
SELECT jobTitle
FROM employees
WHERE officeCode = 4;
# There are 4 records with officeCode 4 and jobTitle is changed back to 'Sales Rep' in these records

-- A: Option B


-- Insert the following entry into the employee table.
-- insert into employees 
-- values
-- (1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', 4, '1056', 'Sale Manager(EMEA)')

# check number of records in employees table first
SELECT COUNT(*) FROM employees;
# 22 records

# Insert the given record into employees table
insert into employees 
values
(1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', 4, '1056', 'Sale Manager(EMEA)');

# check number of records in employees table again to verify
SELECT COUNT(*) FROM employees;
# 23 records



-- Q-8: There is no product under category of boat. Hence, delete the Boat entry from productlines table.

# Check the table information based on the given statement
SELECT pl.productLine, COUNT(p.productCode) AS products_in_productline
FROM productlines pl LEFT JOIN products p ON pl.productLine = p.productLine
GROUP BY pl.productLine;
# There are indeed 0 products associated with 'Boats' product line

# Check how many records have 'Boat' as productLine in 'productlines' table
SELECT COUNT(productLine)
FROM productlines
WHERE productLine = 'Boats';
# There is only one row in productlines table with productLine as 'Boats'

# delete the record with productLine 'Boats' in produclines table
DELETE FROM productlines
WHERE productLine = 'Boats';

# Check how many records have 'Boat' as productLine in 'productlines' table
SELECT COUNT(productLine)
FROM productlines
WHERE productLine = 'Boats';
# There is no record with productLine as 'Boats' in productlines table

# Check number or rows in 'productlines' table
SELECT COUNT(*)
FROM productlines;
# Now, there are only 7 rows left after deletion of a record with 'Boats' as productLine

-- A: Option B: 7


-- Q-9: Convert the 'quantityOrdered' column's data type into int from varchar.

# check the column data types in orderdetails table
DESCRIBE orderdetails;
# Data type of quantityOrdered column is VARCHAR

# Change the data type of quantityOrdered column in orderdetails table to INTEGER
# Using CHANGE option
-- ALTER TABLE orderdetails
-- CHANGE COLUMN quantityOrdered quantityOrdered INTEGER;		# old and new column name remains same.
# OR using MODIFY option instead
ALTER TABLE orderdetails 
MODIFY COLUMN quantityOrdered INTEGER;						# column name needs to ne mentioned only once

# check the column data types in orderdetails table
DESCRIBE orderdetails;
# Data type of quantityOrdered column is changed to INT

-- A: B: MODIFY


-- Q-10: Print the employees with the job title “Sales Rep”. 
-- What is the first name of the employee that appears on the top after applying this query?
SELECT firstName, lastName
FROM employees
WHERE jobTitle = 'Sales Rep';
# first name on the top of the result is 'Leslie'

-- Q-10: Find the total number of employees from the 'employees’ table and alias it as "Total_Employees".
SELECT COUNT(*) AS Total_Employees
FROM employees;
# total employees are 23

-- Q-10: How many customers belongs to Australia? also alias it as "Australia_Customers".
SELECT COUNT(*)
FROM customers
WHERE country = 'Australia';
# 5 customers from Australia

-- A: Option C: Leslie, 23, 5


-- Q-11: Print the quantity in stock for "Red Start Diecast" product vendors with product line is "Vintage Cars" from the table "products".
SELECT SUM(quantityInStock)
FROM products
WHERE productLine = 'Vintage Cars' AND productVendor = 'Red Start Diecast';
# 8073

-- Q-11: Count the total number of orders that has not been shipped yet in the "orders" table. 
SELECT COUNT(*) AS total_orders
FROM orders
WHERE status != 'Shipped';
# 23

-- A: Option B: 8073, 23


-- Q-12: Count the entries in "orderdetails" table with "productCode" starts with S18 and "priceEach" greater than 150.
SELECT COUNT(*)
FROM orderdetails
WHERE productCode REGEXP '^S18' AND priceEach > 150;
# 26

-- A: Option D: 26


-- Q- 13: What are the top three countries which have the maximum number of customers?
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC
LIMIT 3;
# USA 36, Germany 13, France 12

-- A: Option B: USA, Germany, France


-- Q-14: What is the average credit limit for Singapore from "customers" table?
SELECT ROUND(AVG(creditLimit),2) AS avg_credit_limit
FROM customers
WHERE country = 'Singapore';
# 677233.33

-- A: Option A: 67233


-- Q-15: What is the total amount to be paid by the customer named as “Euro+ Shopping Channel”?
-- You need to use the “customers” and “payments” tables to answer this question.
SELECT SUM(pay.amount) AS total_customer_dues
FROM payments pay INNER JOIN customers cus ON pay.customerNumber = cus.customerNumber
WHERE cus.customerName = 'Euro+ Shopping Channel';
# 715738.98

-- A: Option A: 715738


-- Q-16: Which month has recieved the maximum aggragated payments from the customers? 
SELECT MONTHNAME(paymentDate) AS payment_month
FROM payments
GROUP BY payment_month
ORDER BY SUM(amount)
LIMIT 1;
# January

-- Q-16: What is the aggregated value of the payment recieved from that month?
SELECT SUM(amount) AS month_wise_payments
FROM payments
GROUP BY MONTHNAME(paymentDate)
ORDER BY month_wise_payments
LIMIT 1;
# 397887.81

-- A: Option C: January, 397887


-- Q-17: What is the shipped date of the maximum quantity ordered for "1968 Ford Mustang" product name?
-- with JOIN approach
SELECT (ord.shippedDate) AS shipped_date, ordet.quantityOrdered AS quantity_ordered
FROM orders ord
INNER JOIN orderdetails ordet ON ord.orderNumber = ordet.orderNumber
INNER JOIN products prod ON prod.productCode = ordet.productCode
WHERE productName = '1968 Ford Mustang'
ORDER BY quantity_ordered DESC
LIMIT 1;
# 09-09-2003 00:00:00

-- with a little nested query added
SELECT (ord.shippedDate) AS shipped_date, ordet.quantityOrdered AS quantity_ordered
FROM orders ord
INNER JOIN orderdetails ordet ON ord.orderNumber = ordet.orderNumber
INNER JOIN products prod ON prod.productCode = ordet.productCode
WHERE 
	productName = (SELECT productName FROM products WHERE productName = '1968 Ford Mustang')
ORDER BY quantity_ordered DESC
LIMIT 1;
# 09-09-2003 00:00:00

-- A: Option C: 09-09-2003


-- Q-18: Inner join:  What is the average value of credit limit corresponds to the customers which have been contacted by the employees with their office located in “Tokyo” city? 
-- using inner join and nested query
SELECT AVG(c. creditLimit) AS avg_credit_limit
FROM customers c INNER JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE c. salesRepEmployeeNumber IN (SELECT salesRepEmployeeNumber FROM customers WHERE state = 'Tokyo');
# 83900.00

-- A: Option D: 83900

    
-- Q-19: Outer Join: What is the name of the customer which has paid the lowest amount to the company. 

-- using outer join
SELECT customerName
FROM customers
LEFT OUTER JOIN payments USING(customerNumber)
GROUP BY customerName
HAVING SUM(amount) IS NOT NULL						# outer join takes all customers including the ones with NULL in payment amount
ORDER BY SUM(amount)								# The customer name with least payment amount to be extracted
LIMIT 1;
# Boards & Toys Co.

# using inner join
SELECT customerName
FROM customers
INNER JOIN payments USING(customerNumber)
GROUP BY customerName
ORDER BY SUM(amount)								# The customer name with least payment amount to be extracted
LIMIT 1;
# Boards & Toys Co.

# Note: With inner join, it already excludes customers with payment amount NULL

-- A: Option A: Boards & Toys Co.


-- Q-20: Outer Join: What is the city of the employee whose job title is "VP Marketing" ? 

# using outer join
SELECT office_city
FROM employees
LEFT OUTER JOIN offices USING(officeCode)
WHERE jobTitle = 'VP Marketing';
# San Francisco

# using inner join
SELECT office_city
FROM employees
INNER JOIN offices USING(officeCode)
WHERE jobTitle = 'VP Marketing';
# San Francisco

-- A: Option C: San Francisco


-- Q-21: What is the name of the customer who belongs to ‘France’ and has the maximum creditLimit among the customers in France?
SELECT customerName
FROM customers
WHERE country = 'France'
ORDER BY creditLimit DESC
LIMIT 1;
# Saveley & Henriot, Co.

-- A: Options are not matching


-- Q-22: What will be the remaining stock of the product code that equals ‘S18_1589’ if it is sent to all the customers who have demanded it?

# how many stock is available for the product with product code 'S18_1589'?
SELECT quantityInStock
FROM products
WHERE productCode = 'S18_1589';
# 9042

# how much total quantity customers have ordered the product with product code 'S18_1589'?
SELECT SUM(quantityOrdered)
FROM orderdetails
WHERE productCode = 'S18_1589';
# 350

# find the stiock remaining of the product with product code 'S18_1589'
WITH 
stock_available AS (
	SELECT quantityInStock AS Available_Stock
	FROM products
	WHERE productCode = 'S18_1589'),
quantity_ordered AS (
	SELECT SUM(quantityOrdered) AS Ordered_Stock
	FROM orderdetails
	WHERE productCode = 'S18_1589')
SELECT Available_Stock-Ordered_Stock FROM stock_available, quantity_ordered;
# 8692 (9042 - 350)

-- A: Option A: 8692


-- Q-23: What is the average amount paid by the customer 'Mini Gifts Distributors Ltd.'?
SELECT AVG(amount) AS avg_amount_per_customer, customerName
FROM payments, customers
WHERE customerName = 'Mini Gifts Distributors Ltd.' AND payments.customerNumber = customers.customerNumber
GROUP BY customerName;
# 64909.80

-- A: Option B: 64910

