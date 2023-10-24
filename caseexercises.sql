# Write a query that returns all employees, their department number, 
# their start date, their end date, and a new column 'is_current_employee' 
# that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

select emp_no,concat(first_name,' ',last_name) as full_name, 
if(to_date like '%9999%', 'n/a','not_working') as still_working,
if(to_date > now(), true,false) as is_current_employee
from dept_emp
join employees
using (emp_no);

 




# # Write a query that returns all employee names (previous and current), 
# and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.


select first_name,last_name,
case
when left(last_name,1) between 'A'and 'H' then 'A-H'
when left(last_name,1) between 'I' and 'Q' then 'I-Q'-- order does matter 
when left(last_name,1) between 'R'and 'Z' then 'R-Z'
else 'other' -- could have put the last when as else 
end as 'alpha_group'
from employees;




 # How many employees (current or previous) were born in each decade?
use employees;
select birth_date from employees order by birth_date ; -- could have done min(birth_date) and max(birth_date)

select 
count(case when birth_date between '1950-01-01' and '1959-12-31' then birth_date end ) as '50s', -- coule have use like birth_date like '195%' then '50s'
count(case when birth_date between '1960-01-01' and '1969-12-31' then birth_date end ) as '60s',
count(case when birth_date between '1970-01-01' and '1979-12-31' then birth_date end ) as '70s'
from employees -- could have count(*) in select and a group by birth_date
;





# # What is the current average salary for each of the following department groups: R&D,
#  Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
select avg(salary)
from salaries;

select *
from departments;

select 
case 
when dept_name in ('Research', 'Development') then 'R&D'
when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
when dept_name in ('Production','Quality Management') then 'Prod & QM'
when dept_name in ('Finance','Human Resources') then 'Finance & HR'
when dept_name in ('Customer Service') then 'Customer Service'
end as dept_group, round(avg(salary),2) as avg_salary
from departments
join dept_emp 
using (dept_no) 
join salaries as s
using (emp_no)
where s.to_date > now()
and dept_emp.to_date > now()
group by dept_group; # can not be in select statment  



