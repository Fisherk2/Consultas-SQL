/* A 1.2.b Diseño de Base de datos en el modelo relacional*/
--CREACION DE DISTINTAS TABLAS UNA TABLA
Create TABLE Automovil (
id_coche INT IDENTITY (1,1) NOT NULL PRIMARY KEY, --Llave primaria
marca varchar(255) NOT NULL, --Restricciones
cilindros SMALLINT NULL,
puertas SMALLINT DEFAULT 4 NULL, --Valores por defecto
precioBase money NOT NULL,
precioImpuesto as precioBase * 1.16 --Tabla calculada
);

CREATE TABLE Capacidad (
id_Capacidades varchar (3) NOT NULL PRIMARY KEY,   
idCoche INT FOREIGN KEY REFERENCES Automovil(id_coche) NOT NULL, --Llave foranea,
vel_max DECIMAL NOT NULL,
peso INT DEFAULT 500,
num_Serie SMALLINT UNIQUE --Valores unicos
);

sp_help Automovil;
sp_help Capacidad;

