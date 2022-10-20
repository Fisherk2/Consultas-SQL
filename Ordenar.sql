/* A 2.3.a Consultar registros con order by y group by */
--1) Consulta todos los empleados, ordenándolos por su Lastname
Select * from Employees ORDER BY LastName;
--2) En la tabla de empleados su nombre es un atributo compuesto, muestra el nombre completo (concatenando las columnas firstname y lastName) y renombrandolo como nCompleto,  el telefono, direccion y ciudad ordenándo los registros por los campos  apellido y nombre
Select concat(FirstName,' ', LastName) as nCompleto, HomePhone, Address, City FROM Employees ORDER BY LastName,FirstName;
--3) Realiza una consulta que muestre todas las ciudades en las que radican los empleados (sin tener valores repetidos)
SELECT DISTINCT City FROM Employees;
--4) Mediante una consulta muestra la ciudad y el total de empleados que viven allí
SELECT City, COUNT(*) nEmpleados FROM Employees GROUP BY City;
--5) A la consulta anterior agrégale la condición de que solo se muestren aquellas ciudades que tienen más de 10 empleados
SELECT City, COUNT(*) nEmpleados FROM Employees 
GROUP BY City
HAVING COUNT(*)>10;
--6) Revisa el ejemplo B, del documento R 2.3.a SELECT con GROUP BY, realiza un inner join con las tablas products y categories, agrupa por CategoryName y cuenta el total de productos que pertenecen a dicha categoria.
SELECT CategoryName, COUNT(*) nProductos 
FROM Products AS p 
INNER JOIN Categories AS c
ON p.CategoryID=c.CategoryID
GROUP BY CategoryName;
--7) Empleando como referencia el ejemplo B y D, realiza lo siguiente: Muestra los nombres de las categorías que tienen más de 10 productos.
SELECT CategoryName, COUNT(*) nProductos 
FROM Products AS p 
INNER JOIN Categories AS c
ON p.CategoryID=c.CategoryID
GROUP BY CategoryName
HAVING COUNT(*)>10;
--8) Realiza una consulta que muestre los distintos años en que se hicieron contrataciones y el total de empleados que fueron contratados en esos años (ver ejemplo D)
SELECT DATEPART (yyyy,HireDate) as Año, COUNT(*) nEmpleados FROM Employees
GROUP BY DATEPART(yyyy,HireDate);
--9) Muestra el nombre del proveedor y el total de productos diferentes que surten(suppliers, products)
SELECT CompanyName, COUNT (*) nProductos 
FROM Suppliers as s
INNER JOIN Products as p
ON s.SupplierID=p.SupplierID
GROUP BY CompanyName;
--10) Busca cuáles son los clientes que han realizado menos pedidos (Customers y Orders)
SELECT ContactName, COUNT (*) nPedidos FROM Orders as o
INNER JOIN Customers as c
ON o.CustomerID=c.CustomerID
GROUP BY ContactName
ORDER BY nPedidos ASC;
--11) Te piden saber en promedio cada pedido de cuántos productos consta (orders, order details y en especial es el campo Quantity)
SELECT OrderID, SUM(Quantity) cantidad, AVG(Quantity) promedio FROM [Order Details]
GROUP BY OrderID;