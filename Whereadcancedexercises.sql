-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SHOW databases;
use employees;
select database();
show tables;
SELECT * FROM employees;  
SELECT emp_no,first_name, last_name
FRom employees
WHERE first_name in ('Irena','vidya','maya');



#10200,10397,10610


-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?

SELECT emp_no,first_name, last_name
From employees 
WHERE emp_no > 100000 or first_name in ('Irena','vidya','maya');



#10200,10397,10610.          


-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results?
#10001,10003,10004

SELECT emp_no,first_name, last_name, gender
FRom employees
-- WHERE  first_name  ('Irena','vidya','maya') or  gender = 'm';

where (first_name = 'Irena' or
first_name = 'vidya' or 
first_name = 'maya') and gender = 'm';




-- Find all unique last names that start with 'E'.


SELECT first_name, last_name
FRom employees
WHERE Last_name LIKE 'E%';


-- Find all unique last names that start or end with 'E'.


SELECT DISTINCT first_name, last_name
FRom employees
WHERE Last_name LIKE 'E%' and last_name like '%e';


-- Find all unique last names that end with E, but does not start with E?

SELECT distinct first_name, last_name
FRom employees
WHERE Last_name LIKE '%E' and last_name NOT LIKE 'e%';





-- Find all unique last names that start and end with 'E'.

SELECT distinct last_name
FRom employees
WHERE Last_name like 'E%E';

#


-- Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
#10011,10032,10037
Select *
From employees
Where hire_date between '1990-01-01' and '1999-12-31';





-- Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
#10078,10115,10261

Select *
From employees
Where birth_date LIKE '%12-25%';


-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
#10261,10438,10681
Select *
From employees
Where hire_date between '1990-01-01' and '1999-12-31' and birth_date LIKE ('%12-25%');



-- Find all unique last names that have a 'q' in their last name.

SELECT DISTINCT last_name
FRom employees
WHERE Last_name LIKE '%q%';



-- Find all unique last names that have a 'q' in their last name but not 'qu'.

SELECT DISTINCT last_name
FRom employees
WHERE Last_name LIKE '%q%' and 
last_name not like '%qu%';