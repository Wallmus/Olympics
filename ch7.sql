-- Winter Olympics Gold Medals
	-- Write a CTE called top_gold_winter to find the top 5 gold-medal-winning countries for Winter Olympics.
	-- Query the CTE to select countries and their medal counts where gold medals won are ≥ 5.
WITH top_gold_winter AS (
	SELECT countries.country AS country,SUM(gold) AS goldz
	FROM winter_games
	LEFT JOIN countries
	ON winter_games.country_id = countries.id
	WHERE gold IS NOT NULL
	GROUP BY country
	Order by goldz DESC
	)
SELECT *
FROM top_gold_winter
WHERE goldz >= 5
LIMIT 5;
