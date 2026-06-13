CREATE OR REPLACE FUNCTION fn_difficulty_level(
	level INT
)
RETURNS TEXT
AS
$$
	DECLARE
		difficulty_level TEXT;
	BEGIN
		IF level <= 40 THEN
			difficulty_level := 'Normal Difficulty';
		ELSIF level <= 60 THEN
			difficulty_level := 'Nightmare Difficulty';
		ELSE
			difficulty_level := 'Hell Difficulty';
		END IF;
		RETURN difficulty_level;
	END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_get_users_data()
RETURNS TABLE (
	user_id INT,
	level INT,
	cash NUMERIC,
	difficulty_level TEXT
)
AS
$$
	BEGIN
		RETURN QUERY
		SELECT
			ug.user_id,
			ug.level,
			ug.cash,
			fn_difficulty_level(ug.level) AS difficulty_level
		FROM
			users_games AS ug
		ORDER BY
			ug.user_id;
	END
$$
LANGUAGE plpgsql;

SELECT
	*
FROM
	fn_get_users_data();