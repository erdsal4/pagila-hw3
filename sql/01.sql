/*
 * Compute the number of customers who live outside of the US.
 */
SELECT count(*)
FROM (
    SELECT country
    FROM customer
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
) t
WHERE NOT t.country='United States';
