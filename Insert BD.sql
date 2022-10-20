------------------INSERCION DE REGISTROS EN UNA TABLA-------------------------------------
sp_Columns PersonaInsert;
---AUTOINCREMENT (DAR VALORES ALEATORIOS A UNA COLUMNA CADA QUE SE INGRESA UN NUEVO REGISTRO): Creacion de una tabla nueva, no se puede ingresar registros aparte.
CREATE TABLE PersonaInsert (
    PersonID int IDENTITY(1,1) PRIMARY KEY, -- Generara numeros en uno en uno desde el 1; (10,5): Genera de 5 en 5 desde el 10
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
---INSERT INTO (DAR VALORES A UN REGISTRO EN UNA TABLA ESTABLECIDA): Valores en columnas especificas
INSERT INTO PersonaInsert(LastName, FirstName, Age)
VALUES ('Zuñiga Gomez', 'Jose Alberto', 24);
---INSERT INTO (DAR VALORES A UN REGISTRO EN UNA TABLA ESTABLECIDA): Valores en todas las columnas (Debes conocer el orden de las columnas)
INSERT INTO PersonaInsert
VALUES ('Knight', 'Fisher', 20); 



