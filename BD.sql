CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY,
    edad INT
);

CREATE TABLE Proveedor (
    Id_Proveedor VARCHAR(20) PRIMARY KEY,
    dia_surtido DATE,
    hora_surtido TIME
);

CREATE TABLE Telefono_Proveedor (
    Id_Proveedor VARCHAR(20),
    telefono VARCHAR(20),
    PRIMARY KEY (Id_Proveedor, telefono),
    FOREIGN KEY (Id_Proveedor) REFERENCES Proveedor(Id_Proveedor)
);

CREATE TABLE Compra (
    Id_Ticket INT PRIMARY KEY,
    hora TIME,
    fecha DATE,
    total DECIMAL(10, 2),
    Id_Cliente INT,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

CREATE TABLE Producto (
    Codigo_Barras VARCHAR(50) PRIMARY KEY,
    precio DECIMAL(6, 2),
    cantidad INT,
    nombre TEXT,
    Id_Proveedor VARCHAR(20),
    FOREIGN KEY (Id_Proveedor) REFERENCES Proveedor(Id_Proveedor)
);

CREATE TABLE Detalle_Compra (
    Id_ticket INT,
    Codigo_Barras VARCHAR(50),
    Precio_Unitario DECIMAL(6, 2),
    Cantidad INT,
    PRIMARY KEY (Id_ticket, Codigo_Barras),
    FOREIGN KEY (Id_ticket) REFERENCES Compra(Id_Ticket),
    FOREIGN KEY (Codigo_Barras) REFERENCES Producto(Codigo_Barras)
);

CREATE TABLE Producto_No:Duradero (
    codigo_de_barras VARCHAR(50) PRIMARY KEY,
    caducidad DATE,
    temperatura DECIMAL(5, 2),
    FOREIGN KEY (codigo_de_barras) REFERENCES Producto(Codigo_Barras)
);

CREATE TABLE Producto_Duradero (
    codigo_de_barras VARCHAR(50) PRIMARY KEY,
    garantia VARCHAR(50),
    FOREIGN KEY (codigo_de_barras) REFERENCES Producto(Codigo_Barras)
);



INSERT INTO Producto (Codigo_Barras, precio, cantidad, nombre, Id_Proveedor)
VALUES ('7501234567890', 20.00, 24, 'Sabritas Adobadas', 'SAB-001');


INSERT INTO Producto_No_Duradero (codigo_de_barras, caducidad, temperatura)
VALUES ('7501234567890', '2026-10-31', 25.0);


INSERT INTO Producto (Codigo_Barras, precio, cantidad, nombre, Id_Proveedor)
VALUES ('2801234566881', 36, 10, 'Cepillo Colgate 360', 'COL-110');

INSERT INTO Producto_Duradero (codigo_de_barras, garantia)
VALUES ('2801234566881', 'sin');


INSERT INTO Producto (Codigo_Barras, precio, cantidad, nombre, Id_Proveedor)
VALUES ('2801234566891', 85, 6, 'Colgate Total 12', 'COL-110');

INSERT INTO Producto_No_Duradero (codigo_de_barras, caducidad, temperatura)
VALUES ('2801234566891', '2026-06-31', 25.0);