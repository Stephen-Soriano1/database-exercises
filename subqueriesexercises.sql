show tables;
describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;
select * from titles;

-- Find all the current employees with the same hire date as employee 101010 using a subquery.
-- finding hire date 
-- finding all same as 101010
#done


select hire_date 
from employees 
where emp_no = '101010';


SELECT *
FROM titles
join employees
using (emp_no)
WHERE hire_date = (SELECT hire_date 
FROM employees 
WHERE emp_no = 101010) 
    AND to_date > now();

# another way 
select * 
from employees
join dept_emp
using (emp_no)
where hire_date = (select hire_date 
from employees 
where emp_no = '101010') and 
to_date > now();




-- Find all the titles ever held by all current employees with the first name Aamod.
-- finding title
-- current employee 
-- fist_name aamod 
#done

select first_name 
from employees 
where first_name = 'Aamod'
limit 1 ;

select distinct title
from titles 
join employees
using (emp_no)
where first_name = ( select first_name 
				from employees 
				where first_name = 'Aamod'
               limit 1 ) 
and to_date > NOw();

# another way 
select emp_no
from employees 
where first_name = 'Aamod';


select distinct title 
from titles
where emp_no in ( select emp_no
from employees 
where first_name = 'Aamod') and to_date > now(); 





-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- looking for no longer working
-- how many people 
#  59900

Select emp_no 
from dept_emp 
where to_date > now();


SELECT count(*)
from employees e 
where emp_no not in 	(Select emp_no 
						from dept_emp 
						where to_date > now())

;


-- Find all the current department managers that are female. List their names in a comment in your code.
# leon,isamu,karsten,hilary
	
    Select gender 
    from employees 
    where gender = 'F';
    
    select d.dept_name as 'Department Name',
    concat(e.first_name,' ',e.last_name) as 'Manager Name'
from departments d
join dept_manager dm
	on d.dept_no=dm.dept_no and
    dm.to_date > NOW()
join employees e
	on e.emp_no=dm.emp_no
where  gender in ( Select gender 
    from employees 
    where gender = 'F')
order by dept_name;



# another way 
select emp_no
from dept_manager
where to_date > now();

select * 
from employees 
where gender = 'F'
and emp_no in		( select emp_no
					from dept_manager
					where to_date > now()) ;






-- Find all the employees who currently have a higher salary than the companie's overall, historical average salary.

select round(avg(salary),2) 
	from salaries;

select count(*)
from salaries
	JOIN employees
		on employees.emp_no = salaries.emp_no
WHERE salary > 	(
				select round(avg(salary),2) 
				from salaries
				)
        and to_date > NOW()
        ;

# another way 

select round(avg(salary),2)
from salaries;

select count(*) 
from salaries
where to_date > now()
and salary > (select round(avg(salary),2)
from salaries)
;
-- 154543

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built-in function to calculate the standard deviation.) What percentage of all salaries is this?
-- -- Hint You will likely use multiple subqueries in a variety of ways
-- -- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query 
-- showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
#83
#.0346% 


select max(salary) 
from salaries
where to_date > now();

select stddev(salary)
from salaries
where to_date > NOW();

select (max(salary)-std(salary)) as cutoff
from salaries 
where to_date > now();

select count(*)
from salaries 
where salary >=
(select (max(salary)-std(salary)) as cutoff
from salaries 
where to_date > now())
and to_date > now();


select count(*)
from salaries
where to_date > now();
#240124 

select (			select count(*)
					from salaries 
					where salary >=
					(select (max(salary)-std(salary)) as cutoff
					from salaries 
					where to_date > now())
					and to_date > now())
                    /
                    (select count(*)
from salaries
where to_date > now()) * 100;


















-- BONUS
-- Find all the department names that currently have female managers.



-- Find the first and last name of the employee with the highest salary.




-- Find the department name that the employee with the highest salary works in.




-- Who is the highest paid employee within each department.