--CREAR UNA TABLA
CREATE TABLE Personas (
    PersonaID int,
    LastName varchar(25),
    FirstName varchar(25),
    Address varchar(25),
    City varchar(25)
);
--CREAR UNA TABLA USANDO UNA TABLA EXISTENTE (UNA COPIA DE UNA TABLA EXISTENTE), el * indica los campos que se han copiado, en este caso, todos.
SELECT * INTO PersonasCopia FROM Personas;
--BORRAR UNA TABLA
DROP TABLE PersonasCopia;
--BORRAR TODO EL CONTENIDO DE LA TABLA
TRUNCATE TABLE Personas;