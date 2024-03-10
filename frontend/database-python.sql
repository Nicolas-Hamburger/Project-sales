CREATE DATABASE IF NOT EXISTS python;
USE python;

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    IDUsuario INT PRIMARY KEY AUTO_INCREMENT,
    NombreUsuario VARCHAR(50) NOT NULL,
    ContraseñaHash VARCHAR(255) NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    FechaRegistro DATE,
);

-- Tabla de Inventario
CREATE TABLE Inventario (
    IDProducto INT PRIMARY KEY AUTO_INCREMENT,
    NombreProducto VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    CantidadExistencia INT,
    PrecioUnitario DECIMAL(10, 2),
    FechaRegistro DATE,
    -- Otros campos relevantes aquí
);

-- Tabla de Movimientos de Inventario
CREATE TABLE MovimientosInventario (
    IDMovimiento INT PRIMARY KEY AUTO_INCREMENT,
    IDProducto INT,
    TipoMovimiento ENUM('Entrada', 'Salida') NOT NULL,
    CantidadMovida INT,
    FechaMovimiento DATE,
    -- Otros campos relevantes aquí
    FOREIGN KEY (IDProducto) REFERENCES Inventario(IDProducto)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    IDCliente INT PRIMARY KEY AUTO_INCREMENT
    -- Otros campos relevantes aquí
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    IDVenta INT PRIMARY KEY AUTO_INCREMENT,
    FechaVenta DATE,
    IDCliente INT,
    TotalVenta DECIMAL(10, 2),
    -- Otros campos relevantes aquí
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

-- Tabla de Detalles de Venta
CREATE TABLE DetallesVenta (
    IDDetalleVenta INT PRIMARY KEY AUTO_INCREMENT,
    IDVenta INT,
    IDProducto INT,
    CantidadVendida INT,
    PrecioUnitario DECIMAL(10, 2),
    -- Otros campos relevantes aquí
    FOREIGN KEY (IDVenta) REFERENCES Ventas(IDVenta),
    FOREIGN KEY (IDProducto) REFERENCES Inventario(IDProducto)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    IDProveedor INT PRIMARY KEY AUTO_INCREMENT
    -- Otros campos relevantes aquí
);

-- Tabla de Compras
CREATE TABLE Compras (
    IDCompra INT PRIMARY KEY AUTO_INCREMENT,
    FechaCompra DATE,
    IDProveedor INT,
    TotalCompra DECIMAL(10, 2),
    -- Otros campos relevantes aquí
    FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
);

-- Tabla de Detalles de Compra
CREATE TABLE DetallesCompra (
    IDDetalleCompra INT PRIMARY KEY AUTO_INCREMENT,
    IDCompra INT,
    IDProducto INT,
    CantidadComprada INT,
    PrecioUnitario DECIMAL(10, 2),
    -- Otros campos relevantes aquí
    FOREIGN KEY (IDCompra) REFERENCES Compras(IDCompra),
    FOREIGN KEY (IDProducto) REFERENCES Inventario(IDProducto)
);
