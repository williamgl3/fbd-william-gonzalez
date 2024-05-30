-- Crear base de datos y usarla
CREATE DATABASE Banco;
USE Banco;

-- Tabla de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(200), 
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(50)
);

-- Tabla de sucursales
CREATE TABLE Sucursales (
    SucursalID INT PRIMARY KEY ,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Tabla de cuentas bancarias
CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    SucursalID INT,
    TipoCuenta VARCHAR(50),
    Saldo DECIMAL(18, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

-- Tabla de transacciones
CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY AUTO_INCREMENT,
    CuentaID INT,
    TipoTransaccion VARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

-- Tabla de cheques
CREATE TABLE Cheques (
    ChequeID INT PRIMARY KEY AUTO_INCREMENT,
    CuentaID INT,
    NumeroCheque VARCHAR(20),
    Monto DECIMAL(18, 2),
    FechaEmision DATE,
    FechaCobro DATE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

INSERT INTO Clientes (nombre, Apellido, Direccion, Telefono, CorreoElectronico)
VALUES ('juan', 'perez', 'calle leon 15', '9511457896', 'juan@gmail.com'),
       ('Noe')