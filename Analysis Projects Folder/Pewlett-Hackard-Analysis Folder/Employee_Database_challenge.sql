--CHALLENGE--
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause.
--Join both tables on the primary key.

SELECT employees.emp_no, 
	employees.first_name, 
employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no=titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

INTO unique_titles
FROM retirement_titles
WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

SELECT COUNT(*),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;