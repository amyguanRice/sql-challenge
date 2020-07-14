-- Physical
--DROP TABLE if exists Title;
--DROP TABLE if exists Employee;
--DROP TABLE if exists Department;
--DROP TABLE if exists Department_Employee;
--DROP TABLE if exists Department_Manager;
--DROP TABLE if exists Salary;

CREATE TABLE Title (
    id VARCHAR(45) PRIMARY KEY  NOT NULL,
    title_name VARCHAR(45)   NOT NULL
);

CREATE TABLE Employee (
    emp_no INT PRIMARY KEY  NOT NULL,
    emp_title VARCHAR(45)   NOT NULL,
    birth_date VARCHAR(45)   NOT NULL,
    first_name VARCHAR(45)   NOT NULL,
    last_name VARCHAR(45)   NOT NULL,
    sex VARCHAR(45)   NOT NULL,
    hire_date VARCHAR(45)   NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES Title(id)
);

CREATE TABLE Department (
    dept_no VARCHAR(45) PRIMARY KEY  NOT NULL,
    dept_name VARCHAR(45)   NOT NULL
);

CREATE TABLE Department_Employee (
    emp_no INT  NOT NULL,
	dept_no VARCHAR(45)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR(45) NOT NULL,
    emp_no INT PRIMARY KEY  NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Salary (
    emp_no INT  PRIMARY KEY NOT NULL,
    salary INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);


