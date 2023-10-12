-- deserve a bonus for the year 2017
SELECT st.staff_id, st.first_name, st.last_name, SUM(p.amount) AS total_revenue
FROM staff st
JOIN payment p ON st.staff_id = p.staff_id
JOIN rental r ON p.rental_id = r.rental_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2017
GROUP BY st.staff_id, st.first_name, st.last_name
HAVING SUM(p.amount) > 0
ORDER BY total_revenue DESC;