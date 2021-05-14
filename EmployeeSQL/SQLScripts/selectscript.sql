-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Employee Number", last_name AS "Last Name", first_name AS "First Name", sex AS "Sex", s.salary AS "Salary" 
FROM employee e
JOIN salaries s 
ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hired Date"
FROM employee
WHERE (hire_date >= '1986-01-01') AND (hire_date<='1986-12-31');

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no AS "Department Number", d.dept_name AS "Department Name", dm.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name" 
FROM dept_manager dm
JOIN department d
ON d.dept_no = dm.dept_no
JOIN employee e
ON e.emp_no = dm.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",d.dept_name AS "Department Name"
FROM employee e
JOIN dept_emp de
ON de.emp_no = e.emp_no
JOIN department d
ON d.dept_no = de.dept_no
ORDER BY d.dept_name;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name AS "Last Name", first_name AS "First Name", sex AS "Sex"
FROM employee e
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%');

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",d.dept_name AS "Department Name"
FROM employee e
JOIN dept_emp de
ON de.emp_no = e.emp_no
JOIN department d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",d.dept_name AS "Department Name"
FROM employee e
JOIN dept_emp de
ON de.emp_no = e.emp_no
JOIN department d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employee.last_name, COUNT(employee.last_name)
FROM employee
GROUP BY employee.last_name
ORDER BY employee.last_name DESC;