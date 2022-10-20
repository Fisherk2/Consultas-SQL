---------SELECCIONA REGISTROS CON VALORES ESPECIFICADAS----------------
---SELECT IN
SELECT * FROM PersonaInsert
WHERE FirstName IN ('Fisher', 'Alberto'); --Los registros que contengan lo del parentesis
---SELECT NOT IN
SELECT * FROM PersonaInsert
WHERE FirstName NOT IN ('Fisher', 'Alberto');-- Los registros que no contengan lo del parentesis
--SELECT IN (COMPARANDO CON OTRA TABLA)
SELECT * FROM PersonaInsert
WHERE FirstName IN (SELECT LastName FROM PersonaInsert); --Los registros que contengan los registros de otra tabla