/* A 3.4.1 Entidades de seguridad */
--Deshabilitar el invitado(guest) en la base de datos en la que estamos trabajando con el fin de inhabilitar esta puerta de acceso que puede ser un problema de seguridad
USE Northwind
REVOKE CONNECT FROM GUEST;
--Asignar al usuario con privilegios limitados un rol del servidor, ingresar con ese usuario y revisar los permisos que tiene de acuerdo al rol otorgado; por ejemplo si se asigna el rol dbcreator (revisa que el usuario pueda crear, modificar, quitar y restaurar una base de datos), revisa también lo que no puede hace
ALTER ROLE db_datawriter ADD MEMBER UsuarioNorwin;
--Quitar al usuario con privilegios limitados el rol que le asignaste.
ALTER ROLE db_datawriter DROP MEMBER UsuarioNorwin;
--Asignar al usuario un rol de nivel de la base de datos, ingresa con ese usuario y revisar los permisos que tiene de acuerdo al rol otorgado; por ejemplo si se asigna el rol dbdatareader (revisar que el usuario pueda leer todos los datos), revisar también lo que no puede hacer de acuerdo al rol que le asignaste.
ALTER ROLE db_ddladmin ADD MEMBER UsuarioNorwin;

CREATE TABLE PruebaUser(nombre varchar(50), edad tinyint);
DROP TABLE PruebaUser;
SELECT * FROM PruebaUser;

ALTER ROLE db_ddladmin DROP MEMBER UsuarioNorwin;