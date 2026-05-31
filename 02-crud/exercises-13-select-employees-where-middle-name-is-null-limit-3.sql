SELECT
	id,
	first_name,
	last_name
FROM employees
WHERE middle_name IS NULL
ORDER BY id
LIMIT 3;