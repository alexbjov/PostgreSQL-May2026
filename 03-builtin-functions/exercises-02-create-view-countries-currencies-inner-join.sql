CREATE VIEW view_continents_countries_currencies_details AS
SELECT
	CONCAT_WS(': ', TRIM(cnts.continent_name), cnts.continent_code) 
	AS continent_details,
	CONCAT_WS(' - ', ctrs.country_name, ctrs.capital, ctrs.area_in_sq_km, 'km2') 
	AS country_information,
	CONCAT(crrs.description, ' (', crrs.currency_code, ')')
	AS currencies
FROM continents cnts
INNER JOIN
	countries ctrs ON cnts.continent_code = ctrs.continent_code
INNER JOIN
	currencies crrs ON ctrs.currency_code = crrs.currency_code
ORDER BY 
	country_information ASC, 
	currencies ASC;

SELECT * 
FROM view_continents_countries_currencies_details;