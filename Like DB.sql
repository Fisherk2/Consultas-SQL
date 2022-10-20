---------SELECCIONA REGISTROS EN CONDICIONES CON PATRONES ESPECIFICADAS----------------
---SELECT LIKE
SELECT * FROM PersonaInsert
WHERE FirstName LIKE 'a%'; --Selecciono los registros donde la primer letra es 'a'
SELECT * FROM PersonaInsert
WHERE FirstName LIKE '%erto%'; --Selecciono los registros donde contengan exactamente 'erto'
--VER MAS CONDICIONES EN LA TABLA DE LIKE y WILDCARDS