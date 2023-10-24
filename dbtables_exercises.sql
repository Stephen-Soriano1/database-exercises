#List all the databases
SHOW databases; 
#Write the SQL code necessary to use the albums_db database
USE albums_db;
#List all tables in the database
SELECT database();
#List all tables in the database
SHOW tables;
#Write the SQL code to switch to the employees database
USE employees; 
#List all tables in the database
SHOW tables;
DEscribe employees;

SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'employees';


#Which table(s) do you think contain a numeric type column? 
#dept_emp, Dept_manager,employees, salaries, titles

#Which table(s) do you think contain a string type column?
#deparment,dept_emp, dept_manger_, emplyees,

#Which table(s) do you think contain a date type column?
#dept_emp, Dept_managerr, salaries, titles

#What is the relationship between the employees and the departments tables?
#There is no similar columns between the two, but we know that 
#employess should be linked to a department somehow

SHow CREATe TABLE dept_manager;
 # `emp_no` int NOT NULL,
  #`dept_no` char(4) NOT NULL,
  #`from_date` date NOT NULL,
  #`to_date` date NOT NULL,
  #PRIMARY KEY (`emp_no`,`dept_no`),
  #KEY `dept_no` (`dept_no`),
  #CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) 
  #REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  #CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` 
-- (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
#) ENGINE=InnoDB DEFAULT CHARSET=latin1
 
