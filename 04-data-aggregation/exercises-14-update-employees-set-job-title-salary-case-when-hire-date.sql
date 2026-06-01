UPDATE employees
SET job_title =
	CASE 
		WHEN hire_date < '2015-01-16' THEN 'Senior ' || job_title 
		WHEN hire_date < '2020-03-04' THEN 'Mid-' || job_title
		ELSE job_title 
	END,
	salary =
	CASE 
		WHEN hire_date < '2015-01-16' THEN salary + 2500
		WHEN hire_date < '2020-03-04' THEN salary + 1500
		ELSE salary 
	END;

SELECT
	first_name,
	job_title,
	salary
FROM
	employees;
