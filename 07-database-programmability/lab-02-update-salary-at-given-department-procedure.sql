CREATE PROCEDURE sp_increase_salaries(department_name VARCHAR(50))
AS
$$
	BEGIN
		UPDATE employees AS e
		SET
			salary = salary * 1.05
		WHERE
			e.department_id = (
				SELECT
					department_id
				FROM
					departments
				WHERE
					name = department_name
			);
	END
$$
LANGUAGE plpgsql;

-- CALL sp_increase_salaries('Sales');
-- CALL sp_increase_salaries('Finance');

-- SELECT
-- 	e.first_name,
-- 	e.salary,
-- 	d.name
-- FROM employees AS e
-- JOIN departments AS d
-- USING
-- 	(department_id)
-- WHERE
-- 	d.name = 'Finance'
-- ORDER BY
-- 	e.first_name,
-- 	e.salary;
