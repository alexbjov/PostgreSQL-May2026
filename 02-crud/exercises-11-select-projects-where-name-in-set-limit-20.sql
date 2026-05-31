SELECT
	name,
	start_date
FROM projects
WHERE name IN ('Mountain', 'Road', 'Touring')
ORDER BY id
LIMIT 20;