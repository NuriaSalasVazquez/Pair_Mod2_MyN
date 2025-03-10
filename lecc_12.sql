USE northwind; 

/* Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.*/

SELECT *
FROM orders; 

SELECT *
FROM employees;

SELECT o1.OrderID, o1.CustomerID, o1.EmployeeID, o1.OrderDate, o1.RequiredDate
FROM orders AS o1
WHERE OrderDate = (SELECT MAX(o2.OrderDate)
					FROM orders AS o2
                    GROUP BY EmployeeID
                    HAVING o2.EmployeeID = o1.EmployeeID);

/*Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/

SELECT ProductID, ProductName, CategoryID
FROM products
WHERE CategoryID IN (SELECT CategoryID
					FROM categories
                    WHERE CategoryName = 'Beverages');
                    
/*Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.*/		

SELECT Country
FROM suppliers;

SELECT DISTINCT Country
FROM customers 
WHERE Country NOT IN (SELECT Country
						FROM suppliers);
                        
/*Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"

Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido. */

SELECT ProductID
FROM products
WHERE ProductName = "Grandma's Boysenberry Spread"; -- = 6 

SELECT OrderID
FROM orderdetails
WHERE ProductID = 6 AND Quantity >= 20; 

SELECT OrderID, CustomerID 
FROM orders
WHERE OrderID IN (SELECT OrderID
					FROM orderdetails
					WHERE ProductID = (SELECT ProductID
										FROM products
										WHERE ProductName = "Grandma's Boysenberry Spread") 
					AND Quantity >= 20);








