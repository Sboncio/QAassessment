-- Question 1
SELECT * FROM actor;

-- Question 2
SELECT * FROM actor WHERE first_name="John";

-- Question 3
SELECT * FROM actor WHERE last_name="Neeson";

-- Question 4
SELECT * FROM actor WHERE actor_id % 10 = 0;

-- Question 5
SELECT description FROM film WHERE film_id = 100;

-- Question 6
SELECT * FROM film WHERE rating="R";

-- Question 7
SELECT * FROM film WHERE rating!="R";

-- Question 8
SELECT * FROM film ORDER BY length LIMIT 10;

-- Question 9
SELECT title FROM film ORDER BY length LIMIT 10;

-- Question 10
SELECT * FROM film WHERE special_features="Deleted Scenes";

-- Question 11
SELECT last_name FROM actor GROUP BY last_name HAVING count(*) = 1;

-- Question 12
SELECT last_name FROM actor GROUP BY last_name HAVING count(*) > 1;

-- Question 13
SELECT actor.first_name, actor.last_name, count(film_actor.film_id) FROM film_actor JOIN actor ON film_actor.actor_id=actor.actor_id GROUP BY film_actor.actor_id ORDER BY count(film_actor.film_id) DESC LIMIT 1;

-- Question 14
SELECT film.title, inventory.store_id FROM inventory JOIN film ON film.film_id = inventory.film_id WHERE film.title="Academy Dinosaur";

-- Question 15
SELECT film.title,inventory.store_id, rental.return_date FROM ((inventory JOIN rental ON rental.inventory_id=inventory.inventory_id) Join film ON film.film_id=inventory.film_id) WHERE film.title = "Academy Dinosaur";

-- Question 16
SELECT AVG(length) from film;

-- Question 17
SELECT category.name, COUNT(film_category.film_id) as count FROM category JOIN film_category ON film_category.category_id=category.category_id GROUP BY category.name;

-- Question 18
SELECT COUNT(*) FROM film_text WHERE description LIKE "%robot%";

-- Question 19
SELECT title, length FROM film ORDER BY length DESC LIMIT 25;

-- Question 20
SELECT title, release_year FROM film WHERE release_year="2010";

-- Question 21
SELECT film.title FROM ((film_category JOIN film ON film_category.film_id=film.film_id) JOIN category ON film_category.category_id=category.category_id) WHERE category.name="Horror";

-- Question 22
SELECT CONCAT(first_name, last_name) AS full_name FROM staff WHERE staff_id = 1;

-- Question 23
SELECT film.title FROM ((film_actor JOIN actor ON film_actor.actor_id=actor.actor_id) JOIN film ON film_actor.film_id=film.film_id) WHERE actor.first_name = "Fred" AND actor.last_name="Costner";

-- Question 24
SELECT store.store_id,COUNT(store.store_id) as copies FROM ((inventory JOIN film ON film.film_id=inventory.film_id) JOIN store ON store.store_id=inventory.store_id) WHERE film.title="BUCKET BROTHERHOOD" GROUP BY store.store_id;

-- Question 25
SELECT COUNT(DISTINCT country) FROM country;
    -- 1
    SELECT name FROM language ORDER BY name;

-- Question 26
SELECT CONCAT(first_name," ",last_name) FROM actor WHERE last_name LIKE "%son%" ORDER BY first_name;

-- Question 27
SELECT category.name, count(film_category.film_id) FROM ((film_category JOIN category ON film_category.category_id=category.category_id) JOIN film ON film_category.film_id=film.film_id) GROUP BY film_category.category_id;

-- Question 28
SELECT CONCAT(actor.first_name," ",actor.last_name), count(film.film_id) FROM ((film_actor JOIN film ON film_actor.film_id=film.film_id) JOIN actor ON film_actor.actor_id=actor.actor_id) GROUP BY CONCAT(actor.first_name," ",actor.last_name);

-- Question 29
SELECT CONCAT(actor.first_name," ",actor.last_name), count(film.film_id) FROM ((film_actor JOIN film ON film_actor.film_id=film.film_id) JOIN actor ON film_actor.actor_id=actor.actor_id) GROUP BY CONCAT(actor.first_name," ",actor.last_name) ORDER BY count(film.film_id) DESC LIMIT 1;