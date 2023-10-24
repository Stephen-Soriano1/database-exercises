use employees;
select database();
show tables;
select * from dept_emp;
-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
# they have been 7 unique title

SELECT distinct title
from titles; 


-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.

select last_name 
from employees 
Where last_name like 'e%e'
group by last_name;



-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

Select first_name, last_name
from employees 
where last_name like 'e%e'
group by first_name, last_name
order by last_name, first_name;





-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

#chieq,linqvist,Qiwen

select last_name           -- distinct last_name  
from employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
    group by last_name;





-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.

select last_name, count(*) as cnt
from employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
    group by last_name;
    





-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.

select first_name, gender, count(*) as cnt 
from employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya' 
    OR first_name = 'Maya'
    and gender = 'M'
    and gender = 'F'
group by first_name, gender
;


-- Using your query that generates a username for all employees, 
-- generate a count of employees with each unique username.

SELECT count(*),
	CONCAT(LOWER(SUBSTR(first_name,1,1)),
		   LOWER(SUBSTR(last_name,1,4)),
           '_',SUBSTR(birth_date,6,2),
           SUBSTR(birth_date,3,2)) 
           AS username
FROM employees
group by username
;









-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?


SELECT 
count(*),
	CONCAT(LOWER(SUBSTR(first_name,1,1)),
		   LOWER(SUBSTR(last_name,1,4)),
           '_',SUBSTR(birth_date,6,2),
           SUBSTR(birth_date,3,2)) 
           AS username 
   
FROM employees
group by username
having count(*) > 1
order by count(*) desc;



;

select count(*)
from
( SELECT 
count(*),
	CONCAT(LOWER(SUBSTR(first_name,1,1)),
		   LOWER(SUBSTR(last_name,1,4)),
           '_',SUBSTR(birth_date,6,2),
           SUBSTR(birth_date,3,2)) 
           AS username 
   
FROM employees
group by username
having count(*) > 1
order by count(*) desc ) as count;



-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
show tables;
select * from salaries; 
select emp_no, avg(salary)   -- could as do round(avg(salary),1) as avg_sal 
from salaries 
group by emp_no;






-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.

select dept_no,count(*) as cnt
 from dept_emp
 where to_date = '9999-1-01'
 group by dept_no;


-- Determine how many different salaries each employee has had. This includes both historic and current.

select emp_no,count(*) 
from salaries
group by emp_no;



-- Find the maximum salary for each employee.

select max(salary),emp_no      -- also could have done select emp_no, max(salary), min(salary), count (salary)
from salaries
group by emp_no;




-- Find the minimum salary for each employee.

select min(salary),emp_no
from salaries
group by emp_no;



-- Find the standard deviation of salaries for each employee.
select emp_no, round(std(salary),1)
from salaries
group by emp_no;




-- Find the max salary for each employee where that max salary is greater than $150,000.

select emp_no, max(salary)
from salaries 
group by emp_no
having max(salary) > 150000;




-- Find the average salary for each employee where that average salary is between $80k and $90k.

select emp_no, avg(salary) 
from salaries
group by emp_no
having avg(salary) between 80000 and 90000;
