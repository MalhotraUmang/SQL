-- Questions:

-- Q-6: Insert the following two rows in the 'customers' table.
-- (495,'Diecast Collectables','Franco','Valarie','Boston','MA','51003','USA','1188',85100),
-- (496,'Kelly\'s Gift Shop','Snowden','Tony','Auckland  ','NULL','NULL','New Zealand','1612',110000)




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
