CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
AS
$$
	DECLARE
		e_count INT;
	BEGIN
		SELECT
			COUNT(e.employee_id)
		FROM employees AS e
		JOIN
			addresses AS a
		USING
			(address_id)
		JOIN
			towns AS t
		USING
			(town_id)
		WHERE
			t.name = town_name
		INTO e_count;
		RETURN e_count;
	END
$$
LANGUAGE plpgsql;

SELECT
	fn_count_employees_by_town('Sofia')
AS
	count;

SELECT
	fn_count_employees_by_town('Berlin')
AS
	count;