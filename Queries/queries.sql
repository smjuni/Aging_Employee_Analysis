SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.dept_no
INTO sales_info
FROM retirement_info AS ri
INNER JOIN dept_emp AS de
	ON (ri.emp_no=de.emp_no)
WHERE de.dept_no = 'd007'
AND de.to_date = ('9999-01-01')
;