----------------ACTUALIZAR REGISTROS DE UNO O MAS CAMPOS----------------------------
---UPDATE (En un solo registro)
UPDATE PersonaInsert
SET LastName = 'Alfred Schmidt', FirstName= 'Frankfurt'
WHERE PersonID = 3;
---UPDATE (En varios registros)
UPDATE PersonaInsert
SET Age=33
WHERE FirstName='Fisher';
---UPDATE (En TODOS los registros)
UPDATE PersonaInsert
SET LastName='Knight';

