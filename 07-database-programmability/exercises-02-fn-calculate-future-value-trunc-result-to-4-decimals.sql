CREATE OR REPLACE FUNCTION fn_calculate_future_value(initial_sum INT, yearly_interest_rate NUMERIC, number_of_years INT)
RETURNS NUMERIC
AS
$$
	DECLARE
		raw_result NUMERIC;
		trunc_result NUMERIC;
	BEGIN
		raw_result = initial_sum * ((1 + yearly_interest_rate) ^ number_of_years);
		trunc_result = trunc(raw_result, 4);
		RETURN trunc_result;
	END
$$
LANGUAGE plpgsql;

-- SELECT fn_calculate_future_value (1000, 0.1, 5);
-- SELECT fn_calculate_future_value(2500, 0.30, 2);
-- SELECT fn_calculate_future_value(500, 0.25, 10);