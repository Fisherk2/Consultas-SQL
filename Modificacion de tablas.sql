/*A 1.2.c Modificación del esquema lógico de la base de datos*/

--CAMPO CON VALORES UNICOS
ALTER TABLE Automovil ADD matricula varchar(7) UNIQUE;
ALTER TABLE Capacidad ADD lote varchar(10) UNIQUE;

--ELIMINACION DE LLAVE FORANEA EN CAPACIDAD (idCoche)
ALTER TABLE Capacidad DROP CONSTRAINT FK__Capacidad__idCoc__3A81B327;

--ELIMINACION DE TABLA CAPACIDAD
DROP TABLE Capacidad;
sp_help Capacidad;

--Recuperamos la tabla sin creacion de llave foranea
CREATE TABLE Capacidad (
id_Capacidades varchar (3) NOT NULL PRIMARY KEY,   
idCoche INT NOT NULL, --Llave que va ser foranea
vel_max DECIMAL NOT NULL,
peso INT DEFAULT 500,
num_Serie SMALLINT UNIQUE --Valores unicos
);

--ADICION DE LLAVE FORANEA A idCoche
ALTER TABLE Capacidad ADD FOREIGN KEY (idCoche) REFERENCES Automovil(id_coche);

sp_help Capacidad;
