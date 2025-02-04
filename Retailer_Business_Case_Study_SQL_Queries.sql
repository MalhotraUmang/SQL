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




-- Insert the following entry into the employee table.
insert into employees 
values
(1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', 4, '1056', 'Sale Manager(EMEA)')

-- Q-8: There is no product under category of boat. Hence, delete the Boat entry from productlines table.




-- Q-9: Convert the 'quantityOrdered' column's data type into int from varchar.




-- Q-10: Print the employees with the job title “Sales Rep”. 
-- What is the first name of the employee that appears on the top after applying this query?




-- Q-10: Find the total number of employees from the 'employees’ table and alias it as "Total_Employees".




-- Q-10: How many customers belongs to Australia? also alias it as "Australia_Customers".




-- Q-11: Print the quantity in stock for "Red Start Diecast" product vendors with product line is "Vintage Cars" from the table "products".




-- Q-11: Count the total number of orders that has not been shipped yet in the "orders" table. 




-- Q-12: Count the entries in "orderdetails" table with "productCode" starts with S18 and "priceEach" greater than 150.




-- Q- 13: What are the top three countries which have the maximum number of customers?




-- Q-14: What is the average credit limit for Singapore from "customers" table?




-- Q-15: What is the total amount to be paid by the customer named as “Euro+ Shopping Channel”?
-- You need to use the “customers” and “payments” tables to answer this question.





-- Q-16: Which month has recieved the maximum aggragated payments from the customers? 
-- Q-16: What is the aggregated value of the payment recieved from that month?




-- Q-17: What is the shipped date of the maximum quantity ordered for "1968 Ford Mustang" product name?




-- Q-18: Inner join:  What is the average value of credit limit corresponds to the customers which have been contacted by the employees with their office located in “Tokyo” city? 



    
-- Q-19: Outer Join: What is the name of the customer which has paid the lowest amount to the company. 




-- Q-20: Outer Join: What is the city of the employee whose job title is "VP Marketing" ? 




-- Q-21: What is the name of the customer who belongs to ‘France’ and has the maximum creditLimit among the customers in France?




-- Q-22: What will be the remaining stock of the product code that equals ‘S18_1589’ if it is sent to all the customers who have demanded it?




-- Q-23: What is the average amount paid by the customer 'Mini Gifts Distributors Ltd.'?
