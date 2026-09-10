use master
if exists (select * from sys.databases where name = 'QLSanPham')
drop database QLSanPham
go
create database QLSanPham
go
use QLSanPham
go
create table Suppliers(
    SID int primary key not null,
    Sname nvarchar(100) not null,
    Address nvarchar(100) not null
)
go
create table Products(
    PID int primary key not null,
    Pname nvarchar(100) not null
)
go
create table Orders(
    SID int not null,
    PID int not null,
    Price int not null
)
go
alter table Orders
alter column Price float not null
go
alter table Suppliers
add Phone nvarchar(15) not null