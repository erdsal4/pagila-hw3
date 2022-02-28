/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT country, sum(amount) AS total_payments
FROM (
    SELECT country, amount
    from payment
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
) t
GROUP BY country
ORDER BY total_payments DESC, country ASC;


