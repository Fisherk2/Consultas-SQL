---------SELECCIONA Y RETORNA VALORES EN CONDICIONES ESPECIFICADAS----------------
---SELECT COUNT (Cuenta un numero N de registros)
SELECT COUNT(FirstName)
FROM PersonaInsert;
---SELECT AVG (Promedia registros de un campo)
SELECT AVG(Age)
FROM PersonaInsert;
---SELECT COUNT (Suma los registros de un campo)
SELECT SUM(Age)
FROM PersonaInsert
WHERE Age > 25