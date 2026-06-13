CREATE VIEW continent_currency_usage AS
SELECT
	table_ranked.continent_code,
	table_ranked.currency_code,
	table_ranked.currency_usage
FROM (
	SELECT
		table_ct.continent_code,
		table_ct.currency_code,
		table_ct.currency_usage,
		DENSE_RANK() OVER (
			PARTITION BY table_ct.continent_code
			ORDER BY table_ct.currency_usage DESC
		) AS rank_usage
	FROM (
		SELECT
			continent_code,
			currency_code,
			COUNT(currency_code) AS currency_usage
		FROM countries
		GROUP BY
			continent_code,
			currency_code
		HAVING 
			COUNT(currency_code) > 1
	) AS table_ct
) as table_ranked
WHERE table_ranked.rank_usage = 1
ORDER BY table_ranked.currency_usage DESC;