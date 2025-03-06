-- TEMA 11 Ejercicios PAIR

-- EJERCICIO 1

SELECT city AS ciudad, CompanyName AS nombre_compañia, contactName AS nombre
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%";

-- Ejercicio 2

SELECT c.city AS ciudad, c.CompanyName AS nombre_compañia, c.contactName AS nombre, COUNT(o.OrderID) AS numero_pedidos
FROM customers AS c
INNER JOIN orders AS o
USING (CustomerID)
WHERE city LIKE "L%"
GROUP BY ciudad,nombre_compañia,nombre;

-- Ejercicio 3

SELECT ContactName AS nombre_contacto, ContactTitle AS titulo, CompanyName As nombre_compañia
FROM customers 
WHERE ContactTitle NOT LIKE "%Sales%";

-- Ejercicio 4

SELECT ContactName AS nombre_contacto
FROM customers
WHERE ContactName NOT LIKE "_A%";

-- Ejercicios 5

SELECT City AS ciudad, CompanyName AS nombre_compañia, ContactName AS nombre_contacto, "clientes" As relacion
FROM customers

UNION

SELECT City, CompanyName,ContactTitle,"proveedores"
FROM suppliers;

-- Ejercicio 6
SELECT CategoryName AS categoria,Description AS descripcion
FROM categories 
WHERE Description REGEXP  "sweet";

-- Ejercicio 7

SELECT ContactName AS nombre, "clientes" AS tipo
FROM customers

UNION ALL

SELECT concat(FirstName, " " ,LastName),"empleados"
FROM employees;


