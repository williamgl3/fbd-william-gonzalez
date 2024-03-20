CREATE DATABASE Banco;

USE Banco;

-- Tabla de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Tabla de sucursales
CREATE TABLE Sucursales (
    SucursalID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Tabla de cuentas bancarias
CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY IDENTITY,
    ClienteID INT,
    SucursalID INT,
    TipoCuenta VARCHAR(50),
    Saldo DECIMAL(18, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

-- Tabla de transacciones
CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY IDENTITY,
    CuentaID INT,
    TipoTransaccion VARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

-- Tabla de cheques
CREATE TABLE Cheques (
    ChequeID INT PRIMARY KEY IDENTITY,
    CuentaID INT,
    NumeroCheque VARCHAR(20),
    Monto DECIMAL(18, 2),
    FechaEmision DATE,
    FechaCobro DATE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

-- Tabla de tarjetas de crédito
CREATE TABLE TarjetasCredito (
    TarjetaID INT PRIMARY KEY IDENTITY,
    ClienteID INT,
    NumeroTarjeta VARCHAR(20),
    LimiteCredito DECIMAL(18, 2),
    SaldoActual DECIMAL(18, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabla de beneficiarios
CREATE TABLE Beneficiarios (
    BeneficiarioID INT PRIMARY KEY IDENTITY,
    ClienteID INT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
