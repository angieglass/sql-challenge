--Creating tables 
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(100)   NOT NULL,
    birh_date date   NOT NULL,
    first_name VARCHAR(100)   NOT NULL,
    last_name VARCHAR(100)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no)

);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

CREATE TABLE titles (
    title_id VARCHAR(100)   NOT NULL,
    title VARCHAR(100)   NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR(100)   NOT NULL,
    dept_name VARCHAR(100)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(100)   NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)


);

CREATE TABLE dept_manager (
    dept_no VARCHAR(100)   NOT NULL,
    emp_no INT   NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);





