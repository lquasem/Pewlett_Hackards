select * from titles
select * from salaries
select * from departments
select * from employees
select * from Dept_emp
select * from dept_managers

1)--employee: employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salary.salary
From employees
Join salaries as salary
	ON employees.emp_no = salary.emp_no;
	
2)--List employees who were hired in 1986.
select * from employees
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
From employees
where employees.hire_date >='1986-01-01'

3)--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select * from departments
select dept_name
from departments
SELECT dept_managers.dept_no, dept_managers.emp_no, dept_managers.from_date, dept_managers.to_date, 
	   EmpTable.first_name,EmpTable.last_name, Dept.dept_name
FROM dept_managers
JOIN employees AS EmpTable
	ON dept_managers.emp_no = EmpTable.emp_no
JOIN departments As Dept
	ON dept_managers.dept_no = Dept.dept_no;
	
4)--department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT  employees.first_name, employees.last_name, emp.emp_no,dept.dept_name 
FROM employees
JOIN dept_emp as emp
	ON employees.emp_no = emp.emp_no
JOIN departments as dept
	ON emp.dept_no = dept.dept_name;

5)---List all employees whose first name is "Hercules" and last names begin with "B.
SELECT first_name, last_name
From employees
WHERE
   first_name = 'Hercules'
AND last_name LIKE 'B%' ;

6)--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name
SELECT  employees.first_name, employees.last_name, emp.emp_no,dept.dept_name 
FROM employees
JOIN dept_emp as emp
	ON employees.emp_no = emp.emp_no
JOIN departments as dept
	ON emp.dept_no = dept.dept_no
	WHERE dept_name = 'Sales';

	
7)--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.last_name, emp.emp_no,dept.dept_name 
FROM employees
JOIN dept_emp as emp
	ON employees.emp_no = emp.emp_no
JOIN departments as dept
	ON emp.dept_no = dept.dept_no
	WHERE
    dept_name IN ('Sales', 'Development');



--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
8)SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;




