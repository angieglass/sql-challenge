--Checking the tables loaded with the CSV files 

SELECT * FROM departments; 
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM employees; 
SELECT * FROM salaries; 
SELECT * FROM titles; 


--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--Will apply an inner join to return records that have matching values in both tables: 
--employees and salaries. 

SELECT employees.emp_no, employees.first_name, employees.last_name, sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2.-List first name, last name, and hire date for employees who were hired in 1986.
--Found the BETWEEN example on https://www.w3schools.com/sql/sql_between.asp
--Adding the ORDER by with and without DESC to see if the between dates worked. 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--3.- List the manager of each department with the following information: 
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

--4.-List the department of each employee with the following information:
--employee number, last name, first name, and department name.

CREATE VIEW all_employees AS 
SELECT dept_emp.emp_no, dept_emp.dept_no, departments.dept_name
FROM dept_emp
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no;

SELECT all_employees.emp_no,employees.first_name, employees.last_name, all_employees.dept_name
FROM employees
INNER JOIN all_employees ON
employees.emp_no = all_employees.emp_no

--5.-List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."
--Results: 20 employees

SELECT employees.first_name, employees.last_name, sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--6.-List all employees in the Sales department:
--including their employee number, last name, first name, and department name.

CREATE VIEW sales AS
SELECT all_employees.emp_no,employees.first_name, employees.last_name, all_employees.dept_name
FROM employees
INNER JOIN all_employees ON
employees.emp_no = all_employees.emp_no

SELECT * 
FROM sales
WHERE dept_name ='Sales';

--7.-List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT * 
FROM sales
WHERE dept_name ='Sales' OR dept_name ='Development';

--8.-In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.
--Results: Baba is the most common last name. 

SELECT employees.last_name, COUNT(employees.last_name) AS "last name freq"
FROM employees
GROUP BY employees.last_name
ORDER BY "last name freq" DESC;
