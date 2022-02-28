/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
SELECT DISTINCT f.title 
FROM actor a1
JOIN film_actor fa1 ON (a1.actor_id = fa1.actor_id)
JOIN film_actor fa2 ON (fa1.film_id = fa2.film_id)
JOIN actor a2 ON (fa2.actor_id=a2.actor_id)
JOIN film f ON (f.film_id=fa2.film_id)
WHERE (a1.first_name,a1.last_name,a2.first_name,a2.last_name) IN
(
    SELECT a1.first_name,a1.last_name, a2.first_name,a2.last_name 
    FROM actor a1
    JOIN film_actor fa1 ON (a1.actor_id = fa1.actor_id)
    JOIN film_actor fa2 ON (fa1.film_id = fa2.film_id)
    JOIN actor a2 ON (fa2.actor_id=a2.actor_id)
    JOIN film f ON (f.film_id=fa2.film_id)
    WHERE NOT (a1.first_name=a2.first_name AND a1.last_name=a2.last_name) AND (f.title='AMERICAN CIRCUS')
)
GROUP BY f.title;
