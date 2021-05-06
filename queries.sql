-- Data analysis
--1.)List the following details of each employee: employee number, last name, first name, sex, and salary.
select * from employees
--SELECT e.emp_no,e.first_name,e.last_name,e.sex,s.salary FROM employees as e, salaries as s
--WHERE e.emp_no = s.emp_no
--didnt get result exactly how i wanted

SELECT  e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees as e
    LEFT JOIN salaries as s
    ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no;

--2.)List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name,e.last_name,e.hire_date
FROM employees as e
WHERE e.hire_date >= '1/01/1986' AND e.hire_date <= '12/31/1986' 
-- tried out to see if worked
--WHERE e.hire_date between '1/01/1986' AND '12/31/1986'
		
--3.)List the manager of each department with the following information: 
--         department number, department name, the manager's employee number, last name, first name.

SELECT  dm.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN employees AS e
        ON (dm.emp_no = e.emp_no);

select * from employees
select * from departments

--4.)List the department of each employee with the following information:
--		employee number, last name, first name, and department name.

SELECT  e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS dp
        ON (e.emp_no = dp.emp_no)
    INNER JOIN departments AS d
        ON (dp.dept_no = d.dept_no)
ORDER BY e.emp_no;

--5.) List first name, last name, and sex for employees whose first name is "Hercules" 
--         and last names begin with "B."

SELECT e.first_name, e.last_name, e.birth_date, e.sex
FROM employees as e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--6.)List all employees in the Sales department,
--		including their employee number, last name, first name, and department name.
select * from departments

SELECT  e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

--7.)List all employees in the Sales and Development departments, 
--			 including their employee number, last name, first name, and department name.

SELECT  e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'
ORDER BY e.emp_no;

--8.)In descending order, list the frequency count of employee last names
--			i.e., how many employees share each last name.

SELECT e.last_name, Count(*) AS cnt
FROM employees as e
GROUP BY e.last_name
ORDER BY cnt desc;