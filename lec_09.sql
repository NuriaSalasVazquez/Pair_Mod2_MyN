-- Ejercicio --

USE northwind;

SELECT c.CustomerID,c.CompanyName,COUNT(o.CustomerID) AS numero_pedidos
FROM customers AS c
INNER JOIN orders AS o
USING (CustomerID)
WHERE c.Country="UK"
GROUP BY c.CustomerID;

SELECT COUNT(OrderID)
FROM orders
GROUP BY ShipCountry;

-- Ejercicio 2 --

SELECT c.CompanyName,YEAR(o.OrderDate) AS año, SUM(d.quantity) AS NUM_OBJETOS
FROM customers AS c
INNER JOIN orders AS o
USING (CustomerID)
INNER JOIN orderdetails AS d
USING (OrderID)
WHERE c.Country="UK"
GROUP BY c.CompanyName,año ;


