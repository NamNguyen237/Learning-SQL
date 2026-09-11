USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name='NhaDat')
    DROP DATABASE NhaDat
GO

-- Question 1: Tạo và dùng CSDL
CREATE DATABASE NhaDat
GO

USE NhaDat
GO

-- Question 2: Tạo 3 bảng ban đầu (chưa gắn Constraint)[cite: 1]
CREATE TABLE QuanHuyen (
    MAQH INT NOT NULL,
    TenQH NVARCHAR(100) NOT NULL
)

CREATE TABLE DuongPho (
    DuongID INT NOT NULL,
    MAQH INT NOT NULL,
    TENDUONG NVARCHAR(MAX) NOT NULL,
    NgayDuyetTen DATETIME NULL
)

CREATE TABLE Nha_Tren_Pho (
    NhaID INT NOT NULL,
    DuongID INT NOT NULL,
    ChuHo NVARCHAR(50) NULL,
    Dientich MONEY NULL
)
GO

-- Question 3: Thêm cột SoNhanKhau[cite: 1]
ALTER TABLE Nha_Tren_Pho
ADD SoNhanKhau INT
GO


-- Primary Keys
ALTER TABLE QuanHuyen
ADD CONSTRAINT PK_QuanHuyen PRIMARY KEY (MAQH)

ALTER TABLE DuongPho
ADD CONSTRAINT PK_DuongPho PRIMARY KEY (DuongID)

ALTER TABLE Nha_Tren_Pho
ADD CONSTRAINT PK_Nha_Tren_Pho PRIMARY KEY (NhaID)

-- Foreign Keys (Sửa lại tên CONSTRAINT để không bị trùng)
ALTER TABLE DuongPho
ADD CONSTRAINT FK_DuongPho_QuanHuyen FOREIGN KEY (MAQH) REFERENCES QuanHuyen(MAQH)

ALTER TABLE Nha_Tren_Pho
ADD CONSTRAINT FK_Nha_Tren_Pho_DuongPho FOREIGN KEY (DuongID) REFERENCES DuongPho(DuongID)

-- Check Constraint
ALTER TABLE DuongPho
ADD CONSTRAINT CK_NgayDuyetTen CHECK (NgayDuyetTen >= '1945-09-02' AND NgayDuyetTen <= GETDATE())

-- Unique Constraint
ALTER TABLE QuanHuyen
ADD CONSTRAINT UQ_TenQH UNIQUE (TenQH)

ALTER TABLE Nha_Tren_Pho
ADD CONSTRAINT DF_SoNhanKhau DEFAULT 1 FOR SoNhanKhau
GO
INSERT INTO QuanHuyen VALUES (1,N'Ba Dinh'),(2,N'Hoang Mai');

INSERT INTO DuongPho VALUES (1,1,N'Duong Doi Can','1946-10-19'),
                            (2,1,N'Duong Vinh Phuc','1998-12-30'),
                            (3,2,N'Pho Giai Phong','1975-09-21');
INSERT INTO Nha_Tren_Pho VALUES (1,1,N'Ha Khanh Toan',100,4),
                            (2,1,N'Le Hong Hai',20,12),
                            (3,2,N'Tran Khanh',40,1);
GO
SELECT * FROM QuanHuyen;
SELECT * FROM DuongPho;
SELECT * FROM Nha_Tren_Pho;