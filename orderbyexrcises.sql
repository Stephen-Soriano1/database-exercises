-- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

SHOW databases;
use employees;
select database();
show tables;
SELECT * FROM employees;  


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

# Maya Shedden and Vidya Simmen 

SELECT *
FRom employees
WHERE first_name in ('Irena','vidya','maya')
ORDER BY first_name;


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

#irena acton and vidya Zweizig  
#no it was not the same 

SELECT emp_no,first_name, last_name
FRom employees
WHERE first_name in ('irena','vidya','maya')
ORDER BY first_name, last_name;


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

#vidya akiyama and maya zyda
#no it was a different name 

SELECT emp_no,first_name, last_name
FRom employees
WHERE first_name in ('irena','vidya','maya')
ORDER BY last_name, first_name;


-- Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

#10021 ramzi erde and 499648 tadahiro erde

SELECT emp_no,first_name, last_name
FRom employees
WHERE Last_name like 'e%' and last_name like '%e'
ORDER by emp_no;


-- Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

#11/27/1999 teiji eldridge and 2/2/1985 sergi erde

SELECT hire_date,first_name, last_name
FRom employees
WHERE Last_name like 'e%' and last_name like '%e'
ORDER by hire_date DESC;

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.

#05/04/1990 douadi pettis and 08/31/1999 khun bernini

Select *
From employees
Where hire_date between '1990-01-01' and '1999-12-31' and birth_date LIKE ('%12-25%')
Order by birth_date, hire_date desc;



