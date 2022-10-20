--PARA LA CREACION DE BASE DE DATOS (La conexion debe estar en "master")
CREATE DATABASE testBD;
--PARA BORRAR UNA BASE DE DATOS (Debes habilitar la opcion de modificar base de datos al administrador para poder borrar)
DROP DATABASE testDB;
--PARA HACER BACKUP DE UNA BASE DE DATOS (Path: es la direccion absoluta)
BACKUP DATABASE testDB TO DISK = 'C:\Users\msi\Desktop\ITL\4to Semestre\Fundamentos Base de datos\SQL\backup\testDB.bak';
/*PARA HACER UN BACKUP CON DIFERENCIAL: 
Una copia de seguridad diferencial solo realiza una copia de seguridad de las partes de la base de datos que tienen ha cambiado 
desde la última copia de seguridad completa de la base de datos*/
BACKUP DATABASE testDB TO DISK = 'C:\Users\msi\Desktop\ITL\4to Semestre\Fundamentos Base de datos\SQL\backup\testDB.bak'
WITH DIFFERENTIAL; 
