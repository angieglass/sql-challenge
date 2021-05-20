--Checking the tables loaded with the CSV files 

SELECT * FROM departments; 
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM employees; 
SELECT * FROM salaries; 
SELECT * FROM titles; 


--List the following details of each employee: employee number, last name, first name, sex, and salary.
--Will apply an inner join to return records that have matching values in both tables: 
--employees and salaries. 

SELECT employees.emp_no, employees.first_name, employees.last_name, sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
--Found the BETWEEN example on https://www.w3schools.com/sql/sql_between.asp
--Adding the ORDER by with and without DESC to see if the between dates worked. 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name
--Result: 24 managers 

CREATE VIEW managers AS 
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no;

SELECT employees.first_name, employees.last_name, managers.dept_no, managers.dept_name, managers.emp_no
FROM employees
INNER JOIN managers ON
employees.emp_no = managers.emp_no;
