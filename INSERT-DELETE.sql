/* A 2.1.b Poblar la base de datos y eliminar registros*/
USE coches
--INSERCION DE REGISTROS
SP_COLUMNS Automovil;

INSERT INTO Automovil(marca, cilindros, puertas, precioBase,matricula)
VALUES 
('ISUZU', 4, 2, 180000,'UDFSJEU'),
('Ferrari', 12, 2, 8000000,'NBSGTEY'),
('Audi', 10, 2, 3500000,'ETDGNUS'),
('BMW', 6, 4, 200000,'UUYYHNM'),
('Nissan', 4, 4, 70000,'JDUEISO'),
('Volkwagen', 4, 4, 50000,'KIDUEYT'),
('Jaguar', 6, 2, 7000000,'HDGETR7'),
('Mitsubishi', 4, 4, 130000,'JDHETSY'),
('Honda', 6, 2, 237000,'LSOWURG'),
('Jeep', 6, 2, 280000,'BCHDYE5');

SELECT * FROM Automovil;

SP_COLUMNS Capacidad;

INSERT INTO Capacidad(id_Capacidades, idCoche, vel_max, peso,num_Serie)
VALUES 
('c10', 1, 230, 1000,12),
('c11', 1, 280,1200,54),
('c12', 1, 320,1100,80),
('b20', 4, 220,1260,81),
('b21', 4, 270,1020,63),
('f15', 5, 200,1600,56),
('t31', 9, 180,2300,82),
('g10', 2, 250,1200,18),
('e13', 6, 160,2100,92),
('e10', 6, 200,1100,91);

SELECT * FROM Capacidad;

--BORRADO DE REGISTROS

DELETE FROM Capacidad 
WHERE vel_max = 180; --Una condicion

DELETE FROM Capacidad 
WHERE vel_max = 220 OR idCoche=4; --Dos condiciones

DELETE FROM Capacidad ; --Todos los registros

SELECT * FROM Capacidad;

