use sakila;

-- 1. What query would you run to get all the customers inside city_id = 312? Your query should return the customers' first name, last name, email, address, and city.

SELECT cust.first_name, cust.last_name, cust.email, a.address, cty.city
FROM customer cust, address a, city cty
WHERE cust.address_id=a.address_id AND a.city_id=cty.city_id;

-- 2. What query would you run to get all comedy films? Note that the genre is called the category in this schema. Your query should return film title, description, release year, rating, and special features.

SELECT f.title, f.description, f.release_year, f.rating, f.special_features
FROM film f, film_category fc, category c
WHERE f.film_id=fc.film_id AND fc.category_id=c.category_id AND c.name='Comedy';

-- 3. What query would you run to get all the films that Johnny Lollobrigida was in? Your query should return the actor's last name, film title, and release year.

SELECT a.last_name, f.title, f.release_year
FROM film f, film_actor fa, actor a
WHERE f.film_id=fa.film_id AND fa.actor_id=a.actor_id AND a.first_name='JOHNNY' AND a.last_name='LOLLOBRIGIDA';

-- 4. What query would you run to get the first and last names of all the actors in the movie titled "Bingo Talented"?

SELECT a.first_name, a.last_name
FROM film f, film_actor fa, actor a
WHERE f.film_id=fa.film_id AND fa.actor_id=a.actor_id AND f.title='BINGO TALENTED';

-- 5. What query would you run to get the customer_id associated with all payments greater than twice the average payment amount? (HINT: use 2* in your query to get twice the amount). Your result should include the customer id and the amount.

SELECT customer_id, AVG(amount) AS amt
FROM payment
GROUP BY customer_id
HAVING amt > (SELECT 2*AVG(amount) FROM payment);

-- 6. What query would you run to list the first and last names of the 5 customers who have the highest number(count) of payments? You can title the number of payments as num_payments.

SELECT c.first_name, c.last_name
FROM customer c, payment p
WHERE c.customer_id=p.customer_id
GROUP BY p.customer_id
ORDER BY COUNT(p.amount) DESC
LIMIT 5;

# --------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------





-- PROOF!! (5)
-- select customer_id, avg(amount) as amt
-- from payment
-- group by customer_id
-- having amt > (select avg(amount)*1.2 from payment);
-- select avg(amount)*1.2 from payment;

-- PROOF!! (6)
-- select c.customer_id, c.first_name, c.last_name, count(p.amount)
-- from customer c, payment p
-- where c.customer_id=p.customer_id
-- group by p.customer_id
-- ORDER BY count(p.amount) desc
-- limit 5;

