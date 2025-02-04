
# Question 1: Top 3 students:
/*
Consider the 'upgrad' schema having a 'marks' table containing the following columns.
application_id|email_id|physics|chemistry|mathematics

The university needs to select the top 3 students to offer a seat. 
The students have to be selected on the basis of the total marks obtained in all three subjects. 
In case two students have the same total marks, a student with higher marks in mathematics is given priority. 
In case the deadlock still persists, higher marks in physics are given priority. 

Write a query that will provide the email for the top 3 students?
*/

SELECT email_id																			# only emeil_id to be displayed
FROM marks																				# table reference
ORDER BY (physics + chemistry + mathematics) DESC, mathematics DESC, physics DESC		# order descending first based on total marks, then on mathematics marks and them on physics marks
LIMIT 3;																				# top 3 such students to be selected


# Question 2: Spread:
/*
Consider the following table 'marks' part of a school database containing the following columns
Student_id : Storing the id of the student
Course     : Storing the name of the course 
Marks      : Storing the marks obtained by the student in the particular course

Write a query to determine the spread of the marks of the student having average marks greater than the overall average. 
Spread is defined as the difference between the highest and lowest marks obtained by the student.

The output should be as below
|Student_id|Marks|
*/

SELECT Student_id, (MAX(Marks) - MIN(Marks)) AS Marks		# Student_id and Spread of his/her Marks need to be displayed
FROM marks													# table reference
GROUP BY Student_id											# grouping by Student_id to be able to aggregate student-wise
HAVING AVG(Marks) > (SELECT AVG(Marks) FROM marks);			# students with personal average Marks greater than overall average Marks
-- ORDER BY Student_id;										# optional, if sorting based on Student_id


# Question 3: Self Join:
/*
Consider a table named 'father' storing the details of all father-son pairs in a residential society. 

Write a code to determine the number of grandfather-grandson pairs in the society. 
For the purpose of the problem, consider grandson as son of one's son. 

Note that the table 'father' stores data in the following form﻿
father_id | son_id
*/

SELECT COUNT(*)					# Number of grandfather-grandson pairs to be diaplayed
FROM father f					# table reference as one alias
INNER JOIN father s				# same table reference as another alias, Self Join
ON f.father_id = s.son_id;		# father and son ids should be matching


# Question 4: Inner Join:
/*
Consider a table named 'home' storing Arsenal football club's performance in the league at home in 2003-04 season, 
while the table 'away' stores Arsenal's performance away in the same season.﻿
home:	opponent | goals_scored | goals_conceded
away:	opponent | goals_scored | goals_conceded

﻿Note that a team is awarded three points for a win, one for a draw and zero for a loss. 

Write a query to determine the number of teams against whom Arsenal won all the available six points.
*/

SELECT COUNT(*)										# Number of teams to be displayed
FROM home h											# reference for home table
INNER JOIN away a									# inner join with away table
ON h.opponent = a.opponent							# common attribute is opponent
WHERE (h.goals_scored >= h.goals_conceded) AND 		# condition 1: goals scored should be greater than or equal to goals conceded on home ground, >= bcoz points can be awarded with a winning or draw case
		(a.goals_scored >= a.goals_conceded);		# condition 1: goals scored should be greater than or equal to goals conceded on away ground, >= bcoz points can be awarded with a winning or draw case



/******************************
Cars Classic Model Questions 
-----------------------------
Cars_Classic_Models_ERD.png
******************************/

# Question 1: Details of Employees:
/*
Write a query to return the employee number, first name and last name of all the employees. 
Order the employees in the alphabetical order of their first names.

Sample Output:
employeeNumber 	| firstName	| lastName
1002			| Diane		| Murphy
*/
SELECT employeeNumber, firstName, lastName
FROM employees
ORDER BY firstName;

# Question 2: Employee Email IDs:
/*
Write a query to return the email ids of all the employees in the increasing order of their employee numbers.
*/
SELECT email
FROM employees
ORDER BY employeeNumber;

# Question 3: Employees with a Specific Office Code:
/*
Write a query to retrieve the first names and last names of all the employees having an office code of 4. 
Arrange them in the alphabetical order of their last names.

Sample Output:
firstName	| lastName
Diane		| Murphy
*/
SELECT firstName, lastName
FROM employees
WHERE officeCode = 4
ORDER BY lastName;

# Question 4: All Employee Details:
/*
Write a query to retrieve the entire data of all the employees from the employees table. 
Arrange them in the alphabetical order of their first names.
*/
SELECT *
FROM employees
ORDER BY firstName;

# Question 5: Filtered Employees:
/*
Write a query to retrieve the email addresses of all the employees who have an office code of 6 and 
report to employees with code '1088'. 

Arrange these employees in the increasing order of their employee numbers.
*/
SELECT email
FROM employees
WHERE officeCode = 6 AND reportsTo = '1088'
ORDER BY employeeNumber;

# Question 6: More Filtered Employees:
/*
Write a query to retrieve the email addresses of all the employees who have an office code of 6 or 
report to employees with employee number '1088'. 

Arrange them in the reverse alphabetical order of their first names.
*/
SELECT email
FROM employees
WHERE officeCode = 6 OR reportsTo = '1088'
ORDER BY firstName DESC;

# Question 7: Employees from Specific Office Codes:
/*
Write a query to retrieve all the details of all the employees who have an office code from 2 to 4. 
Arrange them in the alphabetical order of their first names.
*/
SELECT *
FROM employees
WHERE officeCode BETWEEN 2 AND 4
ORDER BY firstName;

# Question 8: Employees with Odd-Numbered Office Codes:
/*
Write a query to retrieve the extensions and office codes of all the employees having an odd-numbered office code. 
Arrange them in the alphabetical order of their first names.
*/
SELECT extension, officeCode
FROM employees
WHERE officeCode %2 != 0		# odd office codes
ORDER BY firstName;

# Question 9: Employees with Even-Numbered Office Codes:
/*
Write a query to retrieve the extensions and office codes of all the employees having an even-numbered office code. 
Arrange them in the alphabetical order of their first names.
*/
SELECT extension, officeCode
FROM employees
WHERE officeCode %2 = 0		# even office codes
ORDER BY firstName;

# Question 10: Lucky Employees:
/*
Write a query to retrieve all the details of employees who don't report to anyone. 
Arrange them in the increasing order of their employee numbers.
*/
SELECT *
FROM employees
WHERE reportsTo IS NULL
ORDER BY employeeNumber;

