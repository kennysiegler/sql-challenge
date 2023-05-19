-- List the employee number, last name, 
-- first name, sex, and salary of each employee.

		Select e.emp_no, 
			   e.last_name, 
			   e.first_name, 
			   e.sex, 
			   s.salary FROM employees e
		JOIN salaries s ON e.emp_no = s.emp_no;

-- List the first name, last name, 
-- and hire date for the employees who were hired in 1986.

		SELECT e.first_name,
			   e.last_name,
			   e.hired_date 
			   FROM employees e
		WHERE cast(hired_date as text) like '1986%';

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name

		SELECT dm.dept_no,
			   d.dept_name,
			   dm.emp_no,
			   e.last_name,
			   e.first_name
			   FROM employees e
		JOIN dept_manager dm ON dm.emp_no = e.emp_no
		JOIN departments d ON d.dept_no = dm.dept_no;

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name

		SELECT d.dept_no, 
			   e.emp_no,
			   e.last_name,
			   e.first_name,
			   d.dept_name
			   FROM employees e
		JOIN dept_emp de ON de.emp_no = e.emp_no
		JOIN departments d ON d.dept_no = de.dept_no;
		
-- List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.

		SELECT e.first_name,
			   e.last_name,
			   e.sex
			   FROM employees e 
		WHERE first_name like 'Hercules'
		AND last_name like 'B%';
		
-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.

		Select e.emp_no,
			   e.last_name,
			   e.first_name
			   FROM employees e
			   JOIN dept_emp de ON de.emp_no = e.emp_no
			   JOIN departments d ON d.dept_no = de.dept_no
		WHERE d.dept_name like 'Sales';
		
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

		Select e.emp_no,
			   e.last_name,
			   e.first_name,
			   d.dept_name
			   FROM employees e 
			   JOIN dept_emp de On de.emp_no = e.emp_no
			   JOIN departments d ON d.dept_no = de.dept_no
		WHERE d.dept_name in ('Sales', 'Development');
		
-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name).
		
		Select e.last_name, 
			   count(e.last_name)
			   FROM employees e 
		GROUP BY e.last_name;
