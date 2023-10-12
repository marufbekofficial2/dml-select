--Which five movies were rented more than the others, and what is the expected age of the audience for these movies?
SELECT f.film_id, f.title, COUNT(r.customer_id) AS rental_count, AVG(EXTRACT(YEAR FROM AGE(c.create_date))) AS average_customer_age
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;