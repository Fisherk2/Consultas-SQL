/*ACTIVIDAD 6.2*/
CREATE DATABASE BDejercicios; --CREACION DE UNA BASE DE DATOS NUEVA
USE BDejercicios
CREATE TABLE PrimerTabla( --CREACION DE UNA TABLA NUEVA
ID_Celular int NOT NULL, 
nombre varchar(20), 
marca varchar (20), 
camaraPix tinyint, 
memoria tinyint, 
peso tinyint);

/*ACTIVIDAD 6.3.1*/
CREATE TABLE SegundaTabla( --CREACION DE UNA TABLA NUEVA CON PK
ID_Comprador int NOT NULL PRIMARY KEY, 
nombre varchar(20), 
apellido varchar (20), 
edad varchar (20));
ALTER TABLE PrimerTabla ADD PRIMARY KEY (ID_Celular); --Establecemos un PK a la primer tabla
ALTER TABLE SegundaTabla ADD CelularID int NOT NULL; --Creamos una nueva columna para almacenar las Fk del celular
ALTER TABLE SegundaTabla ADD CONSTRAINT fk_celular --Agregamos una restriccion Fk a la segunda tabla
FOREIGN KEY (CelularID) REFERENCES PrimerTabla(ID_Celular);--Establecemos un FK a la segunda tabla
INSERT INTO PrimerTabla (ID_Celular,nombre,marca,camaraPix,memoria,peso) --Insertamos varios registros
VALUES (100,'Galaxy','Samsumg',50,500,784);
SELECT * FROM PrimerTabla --Consultamos toda la tabla
INSERT INTO SegundaTabla (ID_Comprador,nombre,apellido,edad,CelularID) --Insertamos varios registros
VALUES (207,'Fisher','Zuñiga',17,105);
SELECT * FROM SegundaTabla; --Consultamos toda la tabla

/*ACTIVIDAD 6.3.2*/
SELECT * FROM PrimerTabla ORDER BY peso ASC; --Ordenar peso en forma ascendente
SELECT * FROM PrimerTabla ORDER BY memoria DESC; --Ordenar peso en forma ascendente
SELECT * FROM PrimerTabla ORDER BY memoria DESC,camaraPix DESC; --Ordenar camaraPix en forma descendiente con respecto al orden descendiente de la memoria

SELECT SUM(peso) as pesoAcumulado
FROM PrimerTabla;
SELECT AVG(edad) as edadPromedio
FROM SegundaTabla;
SELECT MIN(edad) as edadMasPequeño
FROM SegundaTabla;
SELECT MAX(camaraPix) as camaraPixMax
FROM PrimerTabla;
SELECT COUNT(nombre) as numClientes
FROM SegundaTabla;

/*ACTIVIDAD 6.3.3*/
ALTER TABLE PrimerTabla ALTER COLUMN memoria FLOAT(3); --Metimos una precision de 3 decimales a memoria
ALTER TABLE PrimerTabla ALTER COLUMN peso FLOAT(3); --Metimos una precision de 3 decimales a peso
SELECT memoria*1.16 as memoria16 --Aumentar un 16% a todo el registro memoria
FROM PrimerTabla;
SELECT peso*0.90 as peso10 --reducir un 10% a todo el registro peso
FROM PrimerTabla;

CREATE TABLE TercerTabla ( --Creamos una tabla donde haya un campo que reciba fechas
ID_numPedido int NOT NULL PRIMARY KEY,  
ClienteID int NOT NULL FOREIGN KEY REFERENCES SegundaTabla(ID_Comprador),
fechaPedido DATE NOT NULL);
INSERT INTO TercerTabla (ID_numPedido,ClienteID,fechaPedido) --Insertamos algunos registros
VALUES (5008,202,'2010-06-15');
SELECT *FROM TercerTabla; --Consultamos toda la tabla
SELECT DATEDIFF(year,GETDATE(),'2011/08/25') AS DiferenciaDATE
 SELECT YEAR(GETDATE())-YEAR(fechaPedido) as diferenciaAños
 FROM TercerTabla 
 WHERE ID_numPedido=5008
 SELECT DAY(GETDATE())-DAY(fechaPedido) as diferenciaDias
 FROM TercerTabla 
 WHERE ID_numPedido=5002

/*ACTIVIDAD 6.3.4*/
SELECT * INTO CuartaTabla FROM TercerTabla; --Copiamos la tercer tabla
TRUNCATE TABLE CuartaTabla; --Vaciamos esa tabla copiada para ingresar otros registros
INSERT INTO CuartaTabla (ID_numPedido,ClienteID,fechaPedido) --Insertamos algunos registros
VALUES (3004,201,'2022-05-28');
ALTER TABLE CuartaTabla ADD PRIMARY KEY (ID_numPedido);--Agregar una PK nueva a la cuarta tabla
ALTER TABLE CuartaTabla ADD CONSTRAINT fk_cliente FOREIGN KEY (ClienteID) REFERENCES SegundaTabla(ID_Comprador);--Referenciar el FK a la cuarta tabla
SELECT * FROM TercerTabla;
SELECT * FROM CuartaTabla;

SELECT ClienteID FROM TercerTabla
UNION --SELECCIONA TODOS LOS ELEMENTOS DEL CAMPO SIN REPETIR
SELECT ClienteID FROM CuartaTabla;
SELECT ClienteID FROM TercerTabla
UNION ALL --SELECCIONA TODOS LOS ELEMENTOS DEL CAMPO
SELECT ClienteID FROM CuartaTabla;

SELECT * FROM TercerTabla
INNER JOIN CuartaTabla --Interseccion
ON TercerTabla.ClienteID = CuartaTabla.ClienteID; 