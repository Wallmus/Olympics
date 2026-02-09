SELECT country, left(year, 4) calendar_year, nobel_prize_winners,
	CASE
		WHEN pop_in_millions::numeric > 100 THEN 'Large'
		WHEN pop_in_millions::numeric BETWEEN 50 and 100 THEN 'Medium'
		WHEN pop_in_millions::numeric < 50 THEN 'Small'
	END AS country_size
FROM country_stats
LEFT JOIN countries
	ON country_stats.country_id = countries.id
ORDER BY nobel_prize_winners DESC;