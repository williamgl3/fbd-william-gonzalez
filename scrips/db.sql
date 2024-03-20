CREATE DATABASE Banco;

USE Banco;

-- Tabla de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Direccion NVARCHAR(200),
    Ciudad NVARCHAR(100),
    Telefono NVARCHAR(20)
);

-- Tabla de sucursales
CREATE TABLE Sucursales (
    SucursalID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(200),
    Ciudad NVARCHAR(100),
    Telefono NVARCHAR(20)
);

-- Tabla de cuentas bancarias
CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY IDENTITY,
    ClienteID INT,
    SucursalID INT,
    TipoCuenta NVARCHAR(50),
    Saldo DECIMAL(18, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

-- Tabla de transacciones
CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY IDENTITY,
    CuentaID INT,
    TipoTransaccion NVARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

-- Tabla de cheques
CREATE TABLE Cheques (
    ChequeID INT PRIMARY KEY IDENTITY,
    CuentaID INT,
    NumeroCheque NVARCHAR(20),
    Monto DECIMAL(18, 2),
    FechaEmision DATE,
    FechaCobro DATE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

-- Tabla de tarjetas de crédito
CREATE TABLE TarjetasCredito (
    TarjetaID INT PRIMARY KEY IDENTITY,
    ClienteID INT,
    NumeroTarjeta NVARCHAR(20),
    LimiteCredito DECIMAL(18, 2),
    SaldoActual DECIMAL(18, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabla de beneficiarios
CREATE TABLE Beneficiarios (
    BeneficiarioID INT PRIMARY KEY IDENTITY,
    ClienteID INT,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Direccion NVARCHAR(200),
    Ciudad NVARCHAR(100),
    Telefono NVARCHAR(20),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
