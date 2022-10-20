-----------------------------CREACION DE INDICES (Restricciones con claves primarias o secundarias)-----------------------------
sp_columns PersonaIndice
---CREATE INDEX (ESTABLECER INDICES EN UNA TABLA): CREANDO UN INDICE EN UNA TABLA YA EXISTENTE
CREATE INDEX idx_pname ON PersonaRestriccion (LastName, FirstName); 
---CREATE INDEX (ESTABLECER INDICES EN UNA TABLA): CREANDO UN INDICE UNICO EN UNA TABLA YA EXISTENTE (No permite valores duplicados)
CREATE UNIQUE INDEX idx_pname ON PersonaRestriccion (LastName, FirstName);
---CREATE INDEX (ESTABLECER INDICES EN UNA TABLA): BORRAR UN INDICE 
DROP INDEX PersonaRestriccion.idx_lastname;
---PRIMARY KEY (PK): CREANDO UNA TABLA DESDE CERO (Solo un PK)
CREATE TABLE PersonaIndice (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
---PRIMARY KEY (PK): CREANDO UNA TABLA DESDE CERO (Con multiples columnas con PK)
CREATE TABLE PersonaIndice (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName) --PK_Person es el nombre de la restriccion que incluye las llaves del parentesis
);
---PRIMARY KEY (PK): ALTERANDO LAS COLUMNAS DE UNA TABLA YA ESTABLECIDA (Solo un PK)
ALTER TABLE PersonaIndice ADD PRIMARY KEY (ID);
---PRIMARY KEY (PK): ALTERANDO LAS COLUMNAS DE UNA TABLA YA ESTABLECIDA (Con multiples columnas con PK)
ALTER TABLE PersonaIndice ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
---PRIMARY KEY (PK): BORRAR PK DE UNA TABLA YA ESTABLECIDA
ALTER TABLE PersonaIndice DROP PRIMARY KEY; --Solo un PK sin restriccion
ALTER TABLE PersonaIndice DROP CONSTRAINT PK_Person; --Multiples columnas con PK
---FOREIGN KEY (FK): CREANDO UNA TABLA DESDE CERO (Solo referenciando un PK) pendiente
CREATE TABLE PersonaIndiceFK (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES PersonaIndice(ID)
);
sp_columns PersonaIndiceFK
---FOREIGN KEY (FK): CREANDO UNA TABLA DESDE CERO (Referenciando multiples PK) pendiente
CREATE TABLE PersonaIndiceFK (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID), --Clave principal de la tabla
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) --Clave foranea de la tabla
    REFERENCES PersonaIndice(ID) --Referencia para la clave foranea
);
---FOREIGN KEY (FK): ALTERANDO LAS COLUMNAS DE UNA TABLA YA ESTABLECIDA (Solo referenciando un FK)
ALTER TABLE PersonaIndiceFK ADD FOREIGN KEY (PersonID) REFERENCES PersonaIndice(ID); 
---FOREIGN KEY (FK): ALTERANDO LAS COLUMNAS DE UNA TABLA YA ESTABLECIDA (Referenciando multiples FK)
ALTER TABLE PersonaIndiceFK ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES PersonaIndice(ID);
---FOREIGN KEY (FK): BORRAR FK DE UNA TABLA YA ESTABLECIDA
ALTER TABLE PersonaIndiceFK DROP CONSTRAINT FK_PersonOrder; --Con referencia 

