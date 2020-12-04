--Create a table of retirees and their titles
SELECT e.emp_no,
    e.first_name,
    e.lastname,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
    ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (emp_no);

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title

INTO unique_titles
FROM retirement_titles as r
ORDER BY emp_no, to_date DESC;

SELECT COUNT (emp_no)
FROM unique_titles

-- Employee count by title
SELECT COUNT(title) count,
	title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count DESC;