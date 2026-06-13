CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
RETURNS VARCHAR
AS
$$
	DECLARE
		words_combined VARCHAR;
		full_name VARCHAR;
	BEGIN
		words_combined = CONCAT(first_name, ' ', last_name);
		full_name = INITCAP(words_combined);
		RETURN full_name;
	END
$$
LANGUAGE plpgsql;

-- SELECT fn_full_name('fred', 'sanford');
-- SELECT fn_full_name('', 'SIMPSONS');
-- SELECT fn_full_name('JOHN', '');
-- SELECT fn_full_name(NULL, NULL);
