use master
go
create DATABASE Sach
On Primary
(
    Name = Sach_Data,
    FileName = '/var/opt/mssql/data/Sach.mdf',
    Size = 20MB,
    MaxSize = 100MB,
    FileGrowth = 10%
)
Log On
(
    Name = Sach_Log,
    FileName = '/var/opt/mssql/data/Sach.ldf',
    Size = 5MB,
    MaxSize = 20MB,
    FileGrowth = 10%
);