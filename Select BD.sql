----------CONSULTAS DE REGISTROS EN UNA TABLA------------
---SELECT (Selecciona las columnas de una tabla)
SELECT PersonID, Age FROM PersonaInsert; --Selecciona una columna especifica
SELECT * FROM PersonaInsert; --Selecciona toda la tabla
---SELECT DISTINCT (Selecciona las columnas de una tabla sin repetir valores
SELECT DISTINCT LastName, FirstName, Age FROM PersonaInsert;
---SELECT COUNT DISTINCT (CUENTA LOS ELEMENTOS DE LOS CAMPOS ESPECIFICADOS QUE SON DIFERENTES)
SELECT COUNT(DISTINCT Age) FROM PersonaInsert;
---WHERE (Sirve como filtro para especificar que registros quieres mostrar): Puede usarse en SELECT, DELETE, UPDATE
SELECT Age, FirstName FROM PersonaInsert 
WHERE Age=>20; --Puedes usar distintos operadores logicos
SELECT * FROM PersonaInsert
WHERE FirstName!='Jose Alberto'; 
---WHERE (Filtros multiples para especificar que registros quieres mostrar): Puede usarse en SELECT, DELETE, UPDATE
SELECT * FROM PersonaInsert
WHERE Age=20 AND PersonID=3; --AND
SELECT * FROM PersonaInsert
WHERE LastName='Knight' OR PersonID=1; --OR
SELECT * FROM PersonaInsert
WHERE NOT PersonID=2; --NOT
SELECT * FROM PersonaInsert
WHERE LastName='Knight' AND (Age=24 OR FirstName='Fisher'); --Combinando operadores
---ORDER BY (Consulta los registro de una tabla de manera ordenada)
SELECT Age, LastName FROM PersonaInsert ORDER BY Age; --Ordenara de manera ascendente por defecto
SELECT * FROM PersonaInsert ORDER BY FirstName DESC; -- Ordenara de manera descendente
SELECT * FROM PersonaInsert ORDER BY Age ASC, PersonID DESC; --Ordenado dependiendo de dos campos
---NULL VALUES (Muestra los registros de los campos que tienen valores null)
SELECT LastName FROM PersonaInsert WHERE FirstName IS NULL; --Selecciona el campo donde el segundo campo puede estar vacio
SELECT LastName FROM PersonaInsert WHERE FirstName IS NOT NULL; --Selecciona el campo donde el segundo campo puede NO estar vacio





