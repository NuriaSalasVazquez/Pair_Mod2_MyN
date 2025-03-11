USE sakila; 

-- -------------------------------
-- -----------JOINS---------------
-- -------------------------------

-- 1. Obtener los clientes y las películas que han alquilado.

SELECT CONCAT(lower(c.first_name), ' ', lower(c.last_name)) AS nombre, lower(f.title) AS Título
FROM rental AS r
INNER JOIN customer AS c
USING (customer_id)
INNER JOIN inventory AS i
USING(inventory_id)
INNER JOIN film AS f
USING (film_id); 


-- 2. Obtener los actores y las películas en las que han actuado.

-- De esta forma se cogen sólo los actores que tienen una película asociada. 

SELECT CONCAT(lower(a.first_name), ' ', lower(a.last_name)) AS Nombre, CONCAT(UPPER(LEFT(f.title, 1)), LOWER(SUBSTRING(f.title, 2)))  AS Título_pelicula
FROM film_actor AS fa
LEFT JOIN film AS f
USING (film_id)
INNER JOIN actor AS a
USING (actor_id);

-- Forma de César en clase

SELECT a.first_name, a.last_name, f.title
	FROM actor AS a LEFT JOIN film_actor AS f_a
    USING (actor_id)
    INNER JOIN film AS f
    USING (film_id);

-- 3. Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.

-- Lo primero del select es donde se hace el GROUP BY. Cuidado con contar en cosas que son NULL!!! 

SELECT LOWER(f.title) AS Título, COUNT(i.film_id) AS Cantidad
FROM film AS f 
LEFT JOIN inventory AS i
USING (film_id)
GROUP BY f.title;

-- 4. Obtener todos los clientes y mostrar la cantidad de alquileres que han realizado, incluso si no han realizado ningún alquiler.

-- -------------------------------
-- -----------UNION---------------
-- -------------------------------

/* Encuentra todos los actores cuyos nombres comienzan con la letra "A" en la tabla actor, y encuentra todos los clientes cuyos nombres comienzan con la letra "B" en la tabla customer.
 Combina ambos conjuntos de resultados en una sola tabla.*/ 
 
 SELECT first_name, "actor" AS Origen
 FROM actor
 WHERE first_name LIKE ('A%')
 
 UNION
 
 SELECT first_name, "cliente"
 FROM customer 
 WHERE first_name LIKE ('B%');
 
-- ------------------------------------
-- -----------SUBQUERIES --------------
-- ------------------------------------

/* Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película "ACADEMY DINOSAUR" se alquilara por primera vez.
 Ordena los resultados alfabéticamente por apellido.*/
 
 SELECT actor.first_name, actor.last_name, rental.rental_date
	FROM actor
    INNER JOIN film_actor
    USING (actor_id)
    INNER JOIN film AS f
    USING (film_id)
    INNER JOIN inventory
    USING (film_id)
    INNER JOIN rental
    USING (inventory_id)
    WHERE rental_date > (SELECT MIN(rental_date)
								FROM film AS f
								INNER JOIN inventory as i
								USING (film_id)
								INNER JOIN rental
								USING (inventory_id)
								WHERE title = "ACADEMY DINOSAUR")
	ORDER BY last_name;
 
 -- ---------------------------
-- ----------- CTEs -----------
-- ----------------------------

/* Es como crearse una tabla que existe sólo en la query */

WITH actores_pelis AS (
						SELECT a.first_name, a.last_name, f.title
							FROM actor AS a
                            INNER JOIN film_actor
                            USING (actor_id)
                            INNER JOIN film AS f
                            USING (film_id))

SELECT * 
	FROM actores_pelis
    WHERE first_name = "PENELOPE"; 
