/*A 2.3.b Consultar registros con order by, like, union, except e intersect*/
--Realiza una consulta para mostrar el nombre completo de los empleados y su a�o de contrataci�n (tomado del campo hiredate).
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto, DATEPART(YYYY,HireDate) A�oContratacion FROM Employees;
--Muestra los productos cuyo nombre inicie con una vocal, ordena de forma ascendente los registros por el campo unitprice.
SELECT ProductName,UnitPrice FROM Products
WHERE ProductName LIKE'[a,e,i,o,u]%'
ORDER BY UnitPrice ASC;
--Realiza una consulta de todos los productos que inicien con B y ord�nalos de forma descendente
SELECT ProductName FROM Products
WHERE ProductName LIKE '[b]%'
ORDER BY ProductName DESC;
--Efect�a una consulta de todos los productos que inicien con alguna vocal y ord�nalos de forma ascendente
SELECT ProductName FROM Products
WHERE ProductName LIKE'[a,e,i,o,u]%'
ORDER BY ProductName ASC;
--Haz una consulta de todos los productos que tengan una c en el tercer car�cter y ord�nalos de forma ascendente
SELECT ProductName FROM Products
WHERE ProductName LIKE'__c%'
ORDER BY ProductName ASC;
--Realiza una consulta en donde en una sola columna resultante juntes el nombre y el apellido de los empleados. (concatenaci�n)
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees;
--Realiza una uni�n de la consulta anterior con el campo Contactname de Customers, esto te mostrar� los nombres de todos los empleados y los clientes en una tabla resultante con una sola columna
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees
UNION 
SELECT ContactName Customers FROM Customers;
--Cambia la consulta haciendo una intersecci�n, con esto obtienes los empleados que tambi�n son clientes, ord�nalos de forma ascendente
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees
INTERSECT 
SELECT ContactName Customers FROM Customers
ORDER BY NombreCompleto ASC;
--Ahora haz una diferencia (resta en algebra de conjuntos visto en Matem�ticas discretas) empleando EXCEPT, esto te mostrar� los empleados que no son clientes, con ordenamiento descendente
SELECT CONCAT(FirstName,' ',LastName) NombreCompleto FROM Employees
EXCEPT
SELECT ContactName Customers FROM Customers
ORDER BY NombreCompleto DESC;

