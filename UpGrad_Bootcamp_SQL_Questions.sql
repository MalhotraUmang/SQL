
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
