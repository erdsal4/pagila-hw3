/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
SELECT first_name, last_name
FROM actor
WHERE (first_name,last_name) NOT IN (
    SELECT first_name,last_name
    FROM actor a2 
    JOIN film_actor fa ON (a2.actor_id=fa.actor_id)
    JOIN film f ON (fa.film_id=f.film_id)
    JOIN film_category fc on (fc.film_id=f.film_id)
    JOIN category c on (fc.category_id=c.category_id)
    WHERE c.name='Horror'
) AND (first_name,last_name) IN (
    SELECT first_name,last_name
    FROM actor a2
    JOIN film_actor fa ON (a2.actor_id=fa.actor_id)
    JOIN film f ON (fa.film_id=f.film_id)
    JOIN film_category fc on (fc.film_id=f.film_id)
    JOIN category c on (fc.category_id=c.category_id)
    WHERE c.name='Children'
)
ORDER BY last_name,first_name;
