use master
go
if exists (select * from sys.databases where name='NhaDat')
drop database NhaDat
go
create database NhaDat
go
use NhaDat