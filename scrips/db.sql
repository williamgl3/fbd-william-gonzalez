-- Crear tablas

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(200), 
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(50)
);

CREATE TABLE Sucursales (
    SucursalID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    SucursalID INT,
    TipoCuenta VARCHAR(50),
    Saldo DECIMAL(18, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY AUTO_INCREMENT,
    CuentaID INT,
    TipoTransaccion VARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

CREATE TABLE Cheques (
    ChequeID INT PRIMARY KEY AUTO_INCREMENT,
    CuentaID INT,
    NumeroCheque VARCHAR(20),
    Monto DECIMAL(18, 2),
    FechaEmision DATE,
    FechaCobro DATE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

-- Insertar datos en las tablas

INSERT INTO Clientes (Nombre, Apellido, Direccion, Telefono, CorreoElectronico)
VALUES 
('Juan', 'Perez', 'Calle Leon 15', '9511457896', 'juan@gmail.com'),
('Noe', 'Reyes', 'Calle Hidalgo 5', '9534567820', 'noe@gmail.com'),
('Gibran', 'Vazquez', 'Calle Peru 15', '9539634518', 'gibran@gmail.com');

INSERT INTO Sucursales ( Nombre, Direccion, Ciudad, Telefono)
VALUES 
('Sucursal A', 'Av Mexico 123', 'Ciudad de México', '5551234567'),
( 'Sucursal B', 'Av Juárez 456', 'Monterrey', '5559876543'),
( 'Sucursal C', 'Av Revolución 789', 'Guadalajara', '555457890');

INSERT INTO Cuentas (ClienteID, SucursalID, TipoCuenta, Saldo)
VALUES 
(1, 1, 'Ahorro', 10000.00),
(2, 2, 'Corriente', 5000.00),
(3, 3, 'Ahorro', 7500.00);

INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion)
VALUES 
(1, 'Depósito', 500.00, '2024-01-01'),
(2, 'Retiro', 200.00, '2024-01-02'),
(3, 'Depósito', 300.00, '2024-01-03');

INSERT INTO Cheques (CuentaID, NumeroCheque, Monto, FechaEmision, FechaCobro)
VALUES 
(1, 'CHK001', 100.00, '2024-01-01', '2024-01-05'),
(2, 'CHK002', 200.00, '2024-01-02', '2024-01-06'),
(3, 'CHK003', 150.00, '2024-01-03', '2024-01-07');

-- Consultas de ejemplo aplicando diferentes niveles de normalización

-- 1.1. Seleccionar todos los datos de una tabla:
SELECT * FROM Clientes;

-- 1.2. Seleccionar datos específicos de una tabla:
SELECT Nombre, Apellido FROM Clientes;

-- 1.3. Seleccionar datos filtrados por una condición:
SELECT * FROM Clientes WHERE Apellido = 'Perez';

-- 1.4. Ordenar resultados en orden ascendente o descendente:
SELECT * FROM Clientes ORDER BY Nombre ASC;

-- 1.5. Contar el número de filas en una tabla:
SELECT COUNT(*) FROM Clientes;

-- 1.6. Sumar valores de una columna:
SELECT SUM(Saldo) FROM Cuentas;

-- 1.7. Obtener el valor máximo y mínimo de una columna:
SELECT MAX(Saldo), MIN(Saldo) FROM Cuentas;

-- 1.8. Unir dos tablas usando INNER JOIN:
SELECT Clientes.Nombre, Cuentas.Saldo
FROM Clientes
INNER JOIN Cuentas ON Clientes.ClienteID = Cuentas.ClienteID;

-- 2.1. Consulta con JOIN y condiciones adicionales:
SELECT Clientes.Nombre AS Cliente, Sucursales.Nombre AS Sucursal
FROM Cuentas
JOIN Clientes ON Cuentas.ClienteID = Clientes.ClienteID
JOIN Sucursales ON Cuentas.SucursalID = Sucursales.SucursalID
WHERE Cuentas.Saldo > 6000;

-- 2.2. Consulta con subconsultas correlacionadas:
SELECT Nombre, Saldo
FROM Cuentas
WHERE Saldo > (
    SELECT AVG(Saldo) FROM Cuentas WHERE TipoCuenta = 'Ahorro'
);

-- 2.3. Consulta con funciones de agregación y GROUP BY:
SELECT SucursalID, AVG(Saldo) AS SaldoPromedio
FROM Cuentas
GROUP BY SucursalID;

-- 2.4. Consulta con funciones de fecha:
SELECT Nombre, FechaTransaccion
FROM Transacciones
WHERE YEAR(FechaTransaccion) = 2024;

-- 2.5. Consulta con UNION para combinar resultados:
SELECT Nombre, 'Cliente' AS Tipo
FROM Clientes
UNION
SELECT Nombre, 'Sucursal' AS Tipo
FROM Sucursales;

-- 2.6. Consulta con operadores LIKE para búsqueda de texto parcial:
SELECT  Direccion
FROM Clientes
WHERE Direccion LIKE '%Calle%';

-- 2.7. Consulta con subconsultas y operadores EXISTE o NO EXISTE:
SELECT Nombre
FROM Clientes
WHERE EXISTS (
    SELECT 1 FROM Cuentas WHERE ClienteID = Clientes.ClienteID
);

-- 2.8. Consulta con ordenamiento y paginación:
SELECT  Saldo
FROM Cuentas
ORDER BY Saldo DESC
LIMIT 10 OFFSET 0;
