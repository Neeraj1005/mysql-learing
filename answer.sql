-- TODO: 1 - Which categories of movies released in 2018? fetch with the number of movies

SELECT cat.category_id, cat.name, 
		film.release_year, film.film_id, 
        COUNT(cat.category_id) AS number_of_films
FROM category as cat
LEFT JOIN film_category as fc ON fc.category_id = cat.category_id
RIGHT JOIN film as film ON film.film_id = fc.film_id
WHERE film.release_year = "2018" GROUP BY cat.category_id;

-- TODO: update the address of actor id 36 to 677 Jazz Street

UPDATE `address` 
INNER JOIN actor ON actor.address_id = address.address_id
SET address = "677 Jazz Street"
WHERE actor.actor_id = 36

-- TODO: Add the new actors (id: 105, 95) in film ARSENIC INDEPENDENCE (id:41)

INSERT INTO `film_actor` (actor_id, film_id) VALUES (105, 41), (95, 41)
ON DUPLICATE KEY UPDATE film_id = VALUES(film_id), actor_id = VALUES(actor_id);

-- TODO: Get the name of film of the actors who belongs to INDIA.

SELECT DISTINCT film.title, country.country
FROM film
INNER JOIN film_actor ON film_actor.film_id = film.film_id
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
INNER JOIN address ON address.address_id = actor.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE country.country = "India";

-- TODO: How many actors are from the united states?

SELECT COUNT(*) 
FROM actor
INNER JOIN address ON address.address_id = actor.address_id
INNER JOIN city ON city.city_id = address.address_id
INNER JOIN country ON country.country_id = city.country_id
WHERE country.country = "United States";

-- TODO: Get all language in which films are released in the year between 2001 to 2010

SELECT language.name, film.release_year, COUNT(language.language_id) AS number_of_films
FROM language
LEFT JOIN film ON film.language_id = language.language_id
WHERE film.release_year BETWEEN 2001 AND 2010 GROUP BY language.language_id;

-- TODO: The film ALONE TRIP (id:17) was actually released in Mandarin, update the info

UPDATE film SET language_id = (SELECT language.language_id FROM language WHERE language.name = "Mandarin")
WHERE film.film_id = 17;

-- TODO: Fetch cast detail of films released during 2005 and 2015 with PG rating.
SELECT CONCAT(actor.first_name,' ', actor.last_name) AS actor_name, film.release_year, film.title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id
WHERE film.release_year BETWEEN 2005 AND 2015 AND film.rating = "PG";

-- TODO: In which year most films were released?
SELECT film.title, film.release_year, COUNT(film.release_year) AS no_of_films
FROM film GROUP BY film.release_year ORDER BY COUNT(film.release_year) DESC LIMIT 1;

-- TODO: In which year least films were released?
SELECT film.title, film.release_year, COUNT(film.release_year) AS no_of_films
FROM film GROUP BY film.release_year ORDER BY COUNT(film.release_year) ASC LIMIT 1;

-- TODO: Get the details of the film with maximum length released in 2014.
SELECT *, language.name as language
FROM film
LEFT JOIN language ON language.language_id = film.language_id
WHERE film.release_year = "2014" AND film.length = (SELECT MAX(film.length) FROM film);

-- TODO: 12 - Get all Sci-Fi movies with NC-17 ratings and language they are screened in.
SELECT film.film_id, film.title, film.release_year, film.length, film.description, film.rating, category.name AS category, language.name AS language
FROM film
LEFT JOIN language ON language.language_id = film.language_id
RIGHT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
WHERE film.rating = "NC-17";

-- TODO: 13 to 16 ques not added yet

-- TODO: 17- Assign a new category Thriller to the movies ANGELS LIFE.
-- TODO : Answer: create category and assign into film_category pivot table
INSERT INTO category (name) VALUES ("Thriller");

INSERT INTO film_category (film_id, category_id) 
VALUES ((SELECT film_id FROM film WHERE film.title = "ANGELS LIFE"), (SELECT category_id FROM category WHERE category.category_id = "Thriller"));

-- TODO: 18- Which actor acted in most movies?
SELECT film_actor.actor_id, COUNT(film_actor.actor_id), actor.first_name
FROM film_actor
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY film_actor.actor_id DESC LIMIT 1;

-- TODO: 23- How many actors acted in films releasd in 2017?
SELECT COUNT(*)
FROM film_actor
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE film.release_year = "2017";

-- TODO: 24- How many Sci-Fi films released betweeen the year 2007 to 2017?
SELECT COUNT(*)
FROM film_category
INNER JOIN category ON film_category.category_id = category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
WHERE film.release_year BETWEEN 2007 AND 2017 AND category.name = "Sci-Fi";

-- TODO: 25- Fetch the actors of the movie WESTWARD SEABISCUIT with the city they live in.
SELECT film.title, actor.first_name, actor.last_name, city.city
FROM film_actor
INNER JOIN film ON film.film_id = film_actor.film_id
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
INNER JOIN address ON address.address_id = actor.actor_id
INNER JOIN city ON city.city_id = address.city_id
WHERE film.title = "WESTWARD SEABISCUIT";

-- TODO: 26- What is the total lenght of all movies played in 2008?
SELECT SUM(film.length)
FROM film
WHERE film.release_year = "2008";

-- TODO: 28- How many movies were released each year?
SELECT film.release_year, COUNT(film.release_year) AS number_of_films
FROM film GROUP BY film.release_year;

-- TODO: 29- How many languages of movies were released each year?
SELECT language.name, COUNT(film.language_id) AS number_of_films
FROM film
INNER JOIN language ON language.language_id = film.language_id
GROUP BY film.language_id;

-- TODO: 30- Which actor did least movies?
SELECT CONCAT(actor.first_name, ' ' ,actor.last_name), COUNT(film_actor.actor_id)
FROM film_actor
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(film_actor.actor_id) ASC LIMIT 1;