-- Write a query to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name 
-- together as a single column named full_name.
SHOW databases;
use employees;
select database();
show tables;
SELECT * FROM employees;  


select CONCAT(first_name, ' ', Last_name) as 'full_name'
from employees
WHERE last_name like 'e%e';

-- Convert the names produced in your last query to all uppercase.


select CONCAT(upper(first_name), " " ,upper(Last_name)) as FULL_NAME 
from employees
WHERE last_name like 'e%e';



-- Use a function to determine how many results were returned from your previous query.

select count(CONCAT(upper(first_name), " " ,upper(Last_name))) as row_return
from employees
WHERE last_name like 'e%e';


-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),

select *, datediff(now(), hire_date) as work_years
from employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
;



-- Find the smallest and largest current salary from the salaries table.


Select MAX(salary),min(salary) 
from salaries; 




-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, 
-- and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born,
--  and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:select CONCAT(First_Name , ' ' , ' ' , Lastname) as full_name from    employees LIMIT 0, 1000


Select *, lower(concat(substr(first_name,1,1) 
,substr(last_name, 1,4), '_',
 substr(birth_date, 6,2),
 substr(birth_date,3,2)))
 as username
from employees


