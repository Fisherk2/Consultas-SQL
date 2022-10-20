-------------MOSTRAR LOS PRIMERO N ó % REGISTROS DE UN REGISTRO---------
---SELECT TOP: Puede ser combinado con condiciones WHERE
SELECT TOP 3 * FROM PersonaInsert; --Los primeros 3
SELECT TOP 50 PERCENT * FROM PersonaInsert;--El primer 50%
SELECT TOP 3 * FROM PersonaInsert ---Los primeros 3 que contengan una condicion
WHERE LastName='Knight';