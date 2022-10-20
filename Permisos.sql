/*A 3.3 Otorgar, negar y revocar permisos a usuarios*/
--Creacion de dos usuarios:
CREATE LOGIN Usuario1 WITH PASSWORD = 'sus';
CREATE LOGIN Usuario2 WITH PASSWORD = 'pect';

--Cambia la contraseña de alguno de los inicios de sesión (Ejemplo B)
ALTER LOGIN Usuario2 WITH PASSWORD ='Hello there';
--Elimina un inicio de sesión (Ejemplo A DROP LOGIN)
DROP LOGIN Usuario2;
--Con alguno de los usuarios que ya creaste, define las actividades que va a poder hacer y asígnale los permisos correspondientes.
USE coches
GRANT SELECT ON OBJECT::Automovil TO Usuario1;
GRANT INSERT ON OBJECT::Automovil TO Usuario1;--Tabla 1
GRANT UPDATE ON OBJECT::Automovil TO Usuario1;
--A alguno de los usuarios permítele capturar datos en 2 tablas de la base de datos
GRANT INSERT ON OBJECT::Capacidad TO Usuario1;--Tabla 2

/*EJERCICIO 1*/
--Crea un inicio de sesión
CREATE LOGIN UsuarioEjercicio WITH PASSWORD ='123456';
--Crea un usuario de la base de datos de tu proyecto
USE BDejercicios
CREATE USER UsuarioEjercicio FOR LOGIN UsuarioEjercicio;
--Asigna los permisos para agregar y actualizar datos  a alguna tabla
GRANT UPDATE ON OBJECT::ORDERS TO UsuarioEjercicio;
GRANT INSERT ON OBJECT::ORDERS TO UsuarioEjercicio;
--Asigna que pueda crear tablas y vistas en la base de datos 
GRANT CREATE TABLE ON DATABASE::BDejercicios TO UsuarioEjercicio;
GRANT CREATE VIEW ON DATABASE::BDejercicios TO UsuarioEjercicio;

/*EJERCICIO 2*/
--Crea un inicio de sesión
CREATE LOGIN UsuarioNorwin WITH PASSWORD ='123456';
--Crea un usuario de la base de datos de tu proyecto
USE Northwind
CREATE USER UsuarioNorwin FOR LOGIN UsuarioNorwin;
--Asigna el permiso para ver las tablas
GRANT SELECT ON DATABASE::Northwind TO UsuarioNorwin;
--Asigna permisos para eliminar y actualizar datos  en una sola tabla
GRANT DELETE ON OBJECT::Region TO UsuarioNorwin;
GRANT UPDATE ON OBJECT::REGION TO UsuarioNorwin;
--Asigna el permiso para borrar tablas en la base de datos
GRANT ALTER ON DATABASE::Northwind TO UsuarioNorwin;
