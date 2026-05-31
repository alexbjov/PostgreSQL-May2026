UPDATE projects
SET name = UPPER(name);

SELECT
	id,
	name,
	description
FROM projects
ORDER BY id;