-- Delete the table "Employee"
-- DROP TABLE if exists employee;

-- Query all fields from the table
SELECT *
FROM employee;

SELECT *
FROM salary;

-- 1) Join the two tables employee and salary for a query
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salary.salary
FROM salary
JOIN employee On
employee.emp_no = salary.emp_no

-- 2) Query first name, last name, and hire date for employees who were hired in 1986
SELECT employee.last_name, employee.first_name, employee.hire_date
FROM employee
WHERE employee.hire_date like '%1986'

-- 3) Query the manager of each dept with the following info: dept_no, dept_name, manager's emp_no, last & first name
SELECT department_manager.dept_no, department.dept_name, employee.emp_no, employee.last_name, employee.first_name
FROM department_manager
INNER JOIN department ON department_manager.dept_no = department.dept_no
INNER JOIN employee ON department_manager.emp_no = employee.emp_no

-- 4) Query the dept of each employee with the following info: emp_no, last & first name, dept_name
SELECT employee.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM department_employee
INNER JOIN employee on department_employee.emp_no = employee.emp_no
INNER JOIN department on department.dept_no = department_employee.dept_no

-- 5) Query first name, last name, and sex for employees whose first name is 'Hercules' and last names begin with 'B'
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE employee.first_name like '%Hercules' AND employee.last_name like 'B%'

-- 6) Query all employees in the Sales dept, including emp_no, last_name, first_name and dept_name
SELECT employee.emp_no, employee.first_name, employee.last_name, department.dept_name
FROM department_employee
INNER JOIN employee on department_employee.emp_no = employee.emp_no
INNER JOIN department on department.dept_no = department_employee.dept_no
WHERE department.dept_name like '%Sales'

-- 7) Query all employees in the Sales and Development depts, including emp_no, last_name, first_name and dept_name
SELECT employee.emp_no, employee.first_name, employee.last_name, department.dept_name
FROM department_employee
INNER JOIN employee on department_employee.emp_no = employee.emp_no
INNER JOIN department on department.dept_no = department_employee.dept_no
WHERE department.dept_name like '%Sales' or department.dept_name like '%Develop%'

-- 8) Query the frequency count of employee last names in descending order
SELECT employee.last_name, COUNT(employee.last_name) as "LNcount"
FROM employee
GROUP BY employee.last_name
ORDER BY "LNcount" DESC;

