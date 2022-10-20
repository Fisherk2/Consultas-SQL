/* CREACION DE BASE DE DATOS */
--FORMA A
--USE master;
--GO
--IF DB_ID (N'dbA') IS NOT NULL
--DROP DATABASE dbA;
--GO
--CREATE DATABASE dbA;
--GO
----Verifica los archivos y tamaños de la base de datos
--SELECT name, size, size*1.0/128 AS [Size in MBs]
--FROM sys.master_files
--WHERE name = N'dbA';
--GO

--FORMA B
--USE master;
--GO
--CREATE DATABASE dbB
--ON
--( NAME = dbB_dat,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\dbB.mdf',
--    SIZE = 10,
--    MAXSIZE = 50,
--    FILEGROWTH = 5 )
--LOG ON
--( NAME = dbB_log,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\dbB.ldf',
--    SIZE = 5MB,
--    MAXSIZE = 25MB,
--    FILEGROWTH = 5MB ) ;
--GO

--FORMA C
--USE master;
--GO
--CREATE DATABASE dbC
--ON
--PRIMARY
--    (NAME = Arch1,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\archdat1.mdf',
--    SIZE = 100MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 20),
--    ( NAME = Arch2,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\archdat2.ndf',
--    SIZE = 100MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 20),
--    ( NAME = Arch3,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\archdat3.ndf',
--    SIZE = 100MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 20)
--LOG ON
--  (NAME = Archlog1,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\archlog1.ldf',
--    SIZE = 100MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 20),
--  (NAME = Archlog2,
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\archlog2.ldf',
--    SIZE = 100MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 20) ;
--GO

--FORMA E
--USE master;
--GO
--sp_detach_db dbC;
--GO
--CREATE DATABASE dbE
--  ON (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\archdat1.mdf')
--  FOR ATTACH ;
--GO

--FORMA F
USE master;
GO
CREATE DATABASE dbF_snapshot001 ON
    ( NAME = Arch1, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\SNri1dat_001.ss'),
    ( NAME = Arch2, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\SNri2dt_001.ss'),
    ( NAME = Arch3, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHERSQL\MSSQL\DATA\SNri3dt_001.ss')
AS SNAPSHOT OF dbE ;
GO
