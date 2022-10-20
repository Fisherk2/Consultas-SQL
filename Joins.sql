/*A 2.3.b Consultar registros con order by, like, union, except e intersect*/
--Realiza una consulta para mostrar el nombre completo de los empleados y su año de contratación (tomado del campo hiredate).
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto, DATEPART(YYYY,HireDate) AñoContratacion FROM Employees;
--Muestra los productos cuyo nombre inicie con una vocal, ordena de forma ascendente los registros por el campo unitprice.
SELECT ProductName,UnitPrice FROM Products
WHERE ProductName LIKE'[a,e,i,o,u]%'
ORDER BY UnitPrice ASC;
--Realiza una consulta de todos los productos que inicien con B y ordénalos de forma descendente
SELECT ProductName FROM Products
WHERE ProductName LIKE '[b]%'
ORDER BY ProductName DESC;
--Efectúa una consulta de todos los productos que inicien con alguna vocal y ordénalos de forma ascendente
SELECT ProductName FROM Products
WHERE ProductName LIKE'[a,e,i,o,u]%'
ORDER BY ProductName ASC;
--Haz una consulta de todos los productos que tengan una c en el tercer carácter y ordénalos de forma ascendente
SELECT ProductName FROM Products
WHERE ProductName LIKE'__c%'
ORDER BY ProductName ASC;
--Realiza una consulta en donde en una sola columna resultante juntes el nombre y el apellido de los empleados. (concatenación)
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees;
--Realiza una unión de la consulta anterior con el campo Contactname de Customers, esto te mostrará los nombres de todos los empleados y los clientes en una tabla resultante con una sola columna
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees
UNION 
SELECT ContactName Customers FROM Customers;
--Cambia la consulta haciendo una intersección, con esto obtienes los empleados que también son clientes, ordénalos de forma ascendente
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees
INTERSECT 
SELECT ContactName Customers FROM Customers
ORDER BY NombreCompleto ASC;
--Ahora haz una diferencia (resta en algebra de conjuntos visto en Matemáticas discretas) empleando EXCEPT, esto te mostrará los empleados que no son clientes, con ordenamiento descendente
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees
EXCEPT
SELECT ContactName Customers FROM Customers
ORDER BY NombreCompleto DESC;

