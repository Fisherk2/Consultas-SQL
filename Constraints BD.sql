-----------------------------CREACION DE CONSTRAINTS (Restricciones)-----------------------------
sp_columns PersonaRestriccion;
---NOT NULL: CREANDO UNA TABLA DESDE CERO
CREATE TABLE PersonaRestriccion (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);
---NOT NULL: ALTERAR UNA COLUMNA DE UNA TABLA EXISTENTE
ALTER TABLE PersonaRestriccion ALTER COLUMN Age int NOT NULL; 
---UNIQUE (NO REPITE VALORES EN UNA COLUMNA): CREANDO UNA TABLA DESDE CERO
CREATE TABLE PersonaRestriccion (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Persona UNIQUE (ID,LastName) --UC_Persona es el nombre de la restriccion
); 
---UNIQUE (NO REPITE VALORES EN UNA COLUMNA): ALTERAR UNA COLUMNA DE UNA TABLA EXISTENTE
ALTER TABLE PersonaRestriccion ADD UNIQUE (ID);
---UNIQUE (NO REPITE VALORES EN UNA COLUMNA): ALTERAR UNA RESTRICCION DE MULTIPLES COLUMNAS DE UNA TABLA EXISTENTE O CREARLAS
ALTER TABLE PersonaRestriccion ADD CONSTRAINT UC_Persona UNIQUE (ID,LastName); --UC_Persona es el nombre de las restricciones agrupadas que indicamos en el parentesis
---UNIQUE (NO REPITE VALORES EN UNA COLUMNA): BORRAR UNA RESTRICCION DE UNA COLUMNA DE UNA TABLA EXISTENTE
ALTER TABLE PersonaRestriccion DROP CONSTRAINT UC_Persona; 
---CHECK (LIMITA EL RANGO DE VALORES): CREANDO UNA TABLA DESDE CERO
CREATE TABLE PersonaRestriccion (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18) --Solo admite valores para mayores de edad en este campo.
); 
---CHECK (LIMITA EL RANGO DE VALORES): CREAR UNA TABLA CON RESTRICCIONES DE MULTIPLES COLUMNAS Y NOMBRAR SU RESTRICCION
CREATE TABLE PersonaRestriccion (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes') --CHK_Persona es el nombre de las restricciones agrupadas que indicamos en el parentesis
); 
---CHECK (LIMITA EL RANGO DE VALORES): ALTERAR UNA COLUMNA DE UNA TABLA EXISTENTE
ALTER TABLE PersonaRestriccion ADD CHECK (Age>=18); 
---CHECK (LIMITA EL RANGO DE VALORES): ALTERAR UNA RESTRICCION DE MULTIPLES COLUMNAS DE UNA TABLA EXISTENTE O CREARLAS
ALTER TABLE PersonaRestriccion ADD CONSTRAINT CHK_PersonaAge CHECK (Age>=18 AND City='Sandnes'); 
---CHECK (LIMITA EL RANGO DE VALORES): BORRAR UNA RESTRICCION DE UNA COLUMNA DE UNA TABLA EXISTENTE
ALTER TABLE PersonaRestriccion DROP CONSTRAINT CHK_PersonaAge; 
---DEFAULT (ESTABLECER UN VALOR POR DEFECTO EN UNA CAMPO): CREANDO UNA TABLA DESDE CERO
CREATE TABLE PersonaRestriccion (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes' --Se puede usar valores del sistema como GETDATE()
);
---DEFAULT (ESTABLECER UN VALOR POR DEFECTO EN UNA CAMPO): ALTERAR UNA RESTRICCION DE MULTIPLES COLUMNAS DE UNA TABLA EXISTENTE O CREARLAS
ALTER TABLE PersonaRestriccion ADD CONSTRAINT df_City DEFAULT 'Sandnes' FOR City;
---DEFAULT (ESTABLECER UN VALOR POR DEFECTO EN UNA CAMPO): BORRAR UNA RESTRICCION DE UNA COLUMNA DE UNA TABLA EXISTENTE
ALTER TABLE PersonaRestriccion ALTER COLUMN City DROP DEFAULT; --Solo uno (Restriccion sin declarar)
ALTER TABLE PersonaRestriccion DROP CONSTRAINT df_City; --Multiples


