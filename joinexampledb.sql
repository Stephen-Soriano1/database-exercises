-- Use the join_example_db. Select all the records from both the users and roles tables.
show tables;
show databases;
use join_example_db;
show tables;




-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.

select * 
from roles r
inner join users u 
	on r.id=u.role_id;
    
    
 select * 
from roles r
left join users u 
	on r.id=u.role_id;   





-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that have the role. 
-- Hint: You will also need to use group by in the query.

select * 
from roles r
right join users u 
	on r.id=u.role_id;







use employees;
show tables;


-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.
# ANOTHER GOOD TIP 
describe dept_manager; -- write what u need like emp_no and dep_name
describe departments;
describe titles;
describe dept_emp;
select * from dept_manager;
select * from departments;




#
select dept_name, concat(first_name,' ', Last_name) as 'Department Manager'
from employees as e
left join dept_manager as dm
on e.emp_no = dm.emp_no
right join departments as dp
on dm.dept_no = dp.dept_no
WHERE dm.to_date = '9999-01-01';


# another example
-- select dept_name, concat(first_name,' ', Last_name) as 'Department Manager'	
-- from departments d 		
-- join dept_manager dm 
-- on d.dept_no=dm.dept_no
-- join employees e 
-- on e.emp_no=dm.emp_no
-- where dm.to_date = '9999-01-01';




-- Find the name of all departments currently managed by women.
#alway plan what you will do or use the whiteborad 

select dept_name, concat(first_name,' ', Last_name) as dept_manager
from employees as e
left join dept_manager as dm
on e.emp_no = dm.emp_no
right join departments as dp
on dm.dept_no = dp.dept_no
WHERE dm.to_date = '9999-01-01' and gender = 'F'
order by dept_name;




-- Find the current titles of employees currently working in the Customer Service department.




#
select dept_name, count(dp.dept_name)
from employees as e
left join dept_emp as dm
on e.emp_no = dm.emp_no
right join departments as dp
on dm.dept_no = dp.dept_no
where dept_name = 'Customer Service';

#another way 
-- select
-- 	t.title as Title,
--     COUNT(de.emp_no) as Count
-- from titles t
-- join dept_emp de
-- 	on t.emp_no=de.emp_no and 
--     t.to_date > NOW() and
--     de.to_date > NOW()
-- join departments d
-- 	on d.dept_no=de.dept_no
-- where d.dept_name = 'Customer Service'
-- group by t.title
-- order by t.title;






-- Find the current salary of all current managers.

describe salaries;
select * from salaries;
describe departments;
 #was done a different way 
 
 
select dept_name, concat(first_name,' ', Last_name) as dept_manager, salary
from employees as e
left join dept_manager as dm
on e.emp_no = dm.emp_no
join departments as dp
on dm.dept_no = dp.dept_no
join salaries as s
on e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by dept_name;

#try and use more . to help you or organize better 




-- Find the number of current employees in each department.
select * from employees;
#


select dm.dept_no, dept_name, count(e.emp_no) 
from employees as e
left join dept_emp as dm
on e.emp_no = dm.emp_no
right join departments as dp
on dm.dept_no = dp.dept_no and dm.to_date > now()
group by dp.dept_no;



#another way 
-- select d.dept_no,d.dept_name,
-- count(de.dept_no)
-- from departments d 
-- join dept_emp de
-- on d.dept_no=de.dept_no and de.to_date > NOW()
-- group by d.dept_no,d.dept_name
-- order by d.dept_no
-- ;






-- Which department has the highest average salary? Hint: Use current not historic information.
show tables; 
describe dept_emp;

#



select dept_name, avg(salary)
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
join departments as dp
on de.dept_no = dp.dept_no
join salaries as s
on e.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by dept_name
having avg(salary) > 88000;

#another way 
-- select d.dept_name, round(AVG(s.salary),2) as average_salary
-- from departments d 
-- join dept_emp de
-- on d.dept_no=de.dept_no and de.to_date > NOW()
-- join salaries s 
-- on s.emp_no=de.emp_no and s.to_date > NOW()
-- group by d.dept_name
-- order by average_salary desc 
-- limit 1;







-- Who is the highest paid employee in the Marketing department?
describe departments;
describe employees;
describe salaries;
describe dept_emp;

#

select first_name, last_name, dept_name, salary
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as dp
on de.dept_no = dp.dept_no
join salaries as s
on e.emp_no = s.emp_no
WHERE last_name = 'warwick' and first_name = 'akemi' and dept_name = 'Marketing'
order by dept_name
limit 1 ;



-- select 
-- e.first_name, 
-- e.last_name,
-- s.salary,
-- d.dept_name
-- from employees e 
-- join salaries s
-- on e.emp_no=s.emp_no and s.to_date > NOW()
-- join dept_emp de
-- on de.emp_no=e.emp_no
-- join departments d
-- on d.dept_no=de.dept_no
-- where d.dept_name =  'Martking';









-- Which current department manager has the highest salary?
#

select first_name,last_name, salary, dept_name
from employees as e
left join dept_manager as dm
on e.emp_no = dm.emp_no
join departments as dp
on dm.dept_no = dp.dept_no
join salaries as s
on e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
limit 1;



-- Determine the average salary for each department. Use all salary information and round your results.


select dept_name, round(avg(salary),0)
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
join departments as dp
on de.dept_no = dp.dept_no
join salaries as s
on e.emp_no = s.emp_no
-- WHERE de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by dept_name
;






-- Bonus Find the names of all current employees, their department name, and their current manager's name.
describe employees;
describe departments;
describe dept_manager;
describe dept_emp;
--self join

select concat(first_name,' ',last_name) as 'Employee Name'
d.dept_name as 'Department Name'
concat(first_name,' '
from employees e  
join dept_emp de 
on e.emp_no=de.emp_no
join department d
on d.dept_no=de.dept_no and dm.to_date > NOW()
join employees as managers 
on managers.emp_no = dm.emp_no
where de.to_date > curdate()
order by d.dept_name 










