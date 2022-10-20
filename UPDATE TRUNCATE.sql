/*A 2.1.c Actualizar registros */
--1) Actualiza todos los registros de una tabla, definiendo la fecha actual (en un campo de tipo DATE) ver ejemplo A del recurso Instrucción UPDATE
USE coches

ALTER TABLE Capacidad ADD fecha DATE; --Agregamos una columna extra
UPDATE Capacidad SET fecha = GETDATE(); 

SELECT * FROM Capacidad;

--2)Actualiza 2 o más campos de un sólo registro (ver ejemplo B y C)
UPDATE Capacidad SET vel_max=300,peso=1500 WHERE id_Capacidades='b20' OR id_Capacidades='b21';
SELECT * FROM Capacidad;

--3)Actualiza los primeros 5 registros de una tabla (ver ejemplo D)
UPDATE TOP(5) Capacidad SET peso=peso+100;
SELECT * FROM Capacidad;

--4)Actualiza el valor de una columna calculada (ejemplo G)
UPDATE Automovil SET precioBase = precioBase*0.95
SELECT * FROM Automovil;

--5)Actualiza un campo de alguna columna con un valor por Default (ejemplo J)
sp_columns Automovil;
UPDATE Automovil SET puertas = DEFAULT WHERE matricula= 'GKV2702'; --El valor por default de puertas es 4, se le cambiara al Mercedez Benz
SELECT * FROM Automovil;

--6)Realiza una consulta que consulte 3 campos y ordene los datos por uno de ellos.
SELECT precioBase, matricula, id_coche FROM Automovil ORDER BY precioBase ASC; --Precio base de forma ascendente

--7)Efectúa una consulta que haga algún calculo con uno de los campos existentes en tu tabla
SELECT precioBase + 500 as Precio500 FROM Automovil;

--8)Realiza una consulta que muestre un sólo campo eliminando los valores duplicados
SELECT DISTINCT idCoche FROM Capacidad;