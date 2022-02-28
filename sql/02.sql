/*
 * Compute the country with the most customers in it. 
 */
SELECT country
FROM(
    SELECT country,count(*) AS count
    FROM (
        SELECT country
        FROM customer
        JOIN address USING (address_id)
        JOIN city USING (city_id)
        JOIN country USING (country_id)
    ) t
    GROUP BY country
    ORDER BY count DESC
)t2
LIMIT 1;
