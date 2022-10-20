/*Modificación de base de datos*/
--EJEMPLO A
USE master;
GO
ALTER DATABASE ModBD
Modify Name = ModDB ;
GO
--EJEMPLO B
USE master;
GO
CREATE DATABASE ModDBcollate --Creamos un formato de mapeado de caracteres latino
COLLATE SQL_Latin1_General_CP1_CI_AS ;
GO
ALTER DATABASE ModDBcollate
COLLATE French_CI_AI ; --Remplazamos el formato de mapeado de caracteres por uno Frances
GO
--EJEMPLO APLICADO
USE MASTER;
GO
CREATE DATABASE PRONOSTICOS --Creamos una base de datos de ejemplo con ruta y espacio de memoria establecido
ON
(
       NAME = PRONOSTICOS_DATA,
       FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\PRONOSTICOS_DATA.MDF',
       SIZE = 10,
       MAXSIZE=50,
       FILEGROWTH = 5
)
LOG ON
(
       NAME = PRONOSTICOS_LOG,
       FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\PRONOSTICOS_LOG.LDF',
       SIZE = 5MB,
       MAXSIZE = 25MB,
       FILEGROWTH = 5MB
)

USE master; 
GO 
ALTER DATABASE PRONOSTICOS 
Modify Name = ESTADISTICAS --Modificamos el nombre de la base de datos
GO  

ALTER DATABASE ESTADISTICAS
  MODIFY FILE (NAME='PRONOSTICOS_DATA', NEWNAME='ESTADISTICAS_DATA') --Modificamos los nombres logicos
GO

ALTER DATABASE ESTADISTICAS
  MODIFY FILE (NAME='PRONOSTICOS_LOG', NEWNAME='ESTADISTICAS_LOG') --Modificamos los nombres logicos
GO

ALTER DATABASE ESTADISTICAS
ADD FILEGROUP CATALOGOS --Agregamos una nueva carpeta dentro de la base de datos

ALTER DATABASE ESTADISTICAS -- Agregamos el archivo dentro de esta carpeta nueva
 ADD FILE (NAME='CATALOGOS', FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\CATALOGOS.NDF') 
 TO FILEGROUP CATALOGOS;

sp_helpdb 'ESTADISTICAS'

SELECT NAME, physical_name, SIZE  FROM SYS.database_files
SELECT * FROM SYS.filegroups

/*Eliminación de base de datos*/
DROP DATABASE IF EXISTS BorrarDB; --Borra la base de datos si existe