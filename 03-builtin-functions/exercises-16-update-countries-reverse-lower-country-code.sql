UPDATE countries
SET country_code = REVERSE(LOWER(country_code));

SELECT
	id,
	country_code
FROM countries;