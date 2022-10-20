/*A 2.7 Creación, modificación y eliminación de vistas*/

--Crea una vista para mostrar el producto, su categoría y precio, posteriormente haz una consulta de la vista que acabas de crear (Ejemplo A), nota: Se utiliza la vista como si fuera una tabla.
CREATE VIEW EjemploA
AS
SELECT ProductName,CategoryID,UnitPrice 
FROM Products;

SELECT * FROM EjemploA;
--Crea una vista encriptada de alguna consulta que hayas hecho previamente (Ejemplo B)
CREATE VIEW EjemploB
WITH ENCRYPTION
AS
SELECT * FROM EjemploA

SELECT * FROM EjemploB;
--Realiza una vista que muestre los 10 mejores vendedores (Ejemplo D)
CREATE VIEW EjemploD
AS
SELECT TOP(10) EmployeeID, COUNT(*) as Ventas FROM Orders
GROUP BY EmployeeID
ORDER BY Ventas DESC;

SELECT * FROM EjemploD;
--El ejemplo E, es para crear una base de datos particionada (se supone que las tablas deberían estar en diferentes servidores ubicados en zonas geográficas distintas, (centros de datos)). Crea primero las tablas, posteriormente la vista e inserta los registros en la vista.
CREATE TABLE dbo.SUPPLY1 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 1 and 150),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY2 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 151 and 300),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY3 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 301 and 450),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY4 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 451 and 600),  
supplier CHAR(50)  
);  
GO  

CREATE VIEW EjemploE  
WITH SCHEMABINDING  
AS  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY1  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY2  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY3  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY4;  
GO

INSERT EjemploE VALUES ('1', 'CaliforniaCorp'), ('5', 'BraziliaLtd')    
, ('231', 'FarEast'), ('280', 'NZ')  
, ('321', 'EuroGroup'), ('442', 'UKArchip')  
, ('475', 'India'), ('521', 'Afrique');  
GO  

SELECT * FROM EjemploE;
--Modifica una vista que hayas creado anteriormente, agregando alguna condición.
ALTER VIEW EjemploA
AS
SELECT ProductName,CategoryID,UnitPrice 
FROM Products
WHERE UnitPrice<10;

SELECT * FROM EjemploA;
--Elimina una vista que ya tengas realizada.
DROP VIEW EjemploE;

SELECT * FROM EjemploE;