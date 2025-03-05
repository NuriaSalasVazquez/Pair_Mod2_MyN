USE northwind;

-- 1. Empleadas que sean de la misma ciudad: ubicación, nombre y apellido (jefes y empleados). 

SELECT e1.City AS CiudadEmpleado, e1.FirstName AS NombreEmpleado, e1.LastName AS ApellidoEmpleado, e2.City AS CiudadJefe, e2.FirstName AS NombreJefe, e2.LastName AS ApellidoJefe
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.ReportsTo = e2.EmployeeID;

SELECT *
FROM employees;

/* 2. El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados. 
Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría.
Podriamos usar un RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'*/ 

SELECT *
FROM products; 

SELECT *
FROM categories; 

SELECT p.ProductName, c.CategoryName
FROM products AS p
RIGHT JOIN categories AS c
USING (CategoryID); 

/*3. Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes. 
Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen cliente registrado.*/

SELECT * 
FROM customers;

SELECT * 
FROM orders;

SELECT o.OrderID, c.*
FROM customers AS c
LEFT JOIN orders AS o
USING (CustomerID);


/* 4. El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no. 
Queremos obtener una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.*/

SELECT * 
FROM orders; 

SELECT *
FROM employees;

SELECT e.FirstName, o.*
FROM orders AS o
LEFT JOIN employees AS e
USING (EmployeeID); 

/* 5. Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado.
Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos.*/

SELECT *
FROM shippers;

SELECT s.CompanyName, o.OrderID
FROM orders AS o
LEFT JOIN shippers as s
ON s.ShipperID = o.ShipVia;
