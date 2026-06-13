CREATE PROCEDURE sp_increase_salary_by_id(e_id INT)
AS
$$
	BEGIN
		IF e_id NOT IN (
			SELECT
				employee_id
			FROM
				employees
		) THEN 
		RAISE NOTICE 'No such employee id %', e_id;
		ROLLBACK;
		END IF;
	
		
		UPDATE employees
		SET
			salary = salary * 1.05
		WHERE
			employee_id = e_id;
		COMMIT;
	END
$$
LANGUAGE plpgsql;

-- CALL sp_increase_salary_by_id(17);
-- CALL sp_increase_salary_by_id(300);

-- SELECT
-- 	COUNT(*) as count_employees
-- FROM
-- 	employees;