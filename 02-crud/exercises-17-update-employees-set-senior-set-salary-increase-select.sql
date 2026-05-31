UPDATE employees
SET 
	job_title = 'Senior ' || job_title, 
	salary = salary + 1500
WHERE hire_date BETWEEN '1998-01-01' AND '2000-01-05';

SELECT
	first_name,
	job_title,
	salary
FROM employees
WHERE hire_date BETWEEN '1998-01-01' AND '2000-01-05';