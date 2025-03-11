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

SELECT CONCAT(lower(a.first_name), ' ', lower(a.last_name)) AS Nombre, CONCAT(UPPER(LEFT(f.title, 1)), LOWER(SUBSTRING(f.title, 2)))  AS Título_pelicula
FROM film_actor AS fa
LEFT JOIN film AS f
USING (film_id)
INNER JOIN actor AS a
USING (actor_id);

-- 3. Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.

SELECT LOWER(f.title) AS Título, COUNT(i.film_id) AS Cantidad
FROM film AS f 
LEFT JOIN inventory AS i
USING (film_id)
GROUP BY f.title, i.film_id
;


