CREATE VIEW view_addresses AS
SELECT
	e.first_name || ' ' || e.last_name AS full_name,
	e.department_id,
	a.number || ' ' || a.street AS address
FROM employees e
JOIN addresses a ON e.address_id = a.id;

SELECT * FROM view_addresses
ORDER BY address;