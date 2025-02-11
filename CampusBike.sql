create database CampusBike;
use CampusBike;
create table cliente(
    idCliente int primary key,
    nombreCliente varchar(50) not null,
    apellidoCliente varchar(50) not null,
    direccionCliente varchar(50) not null,
    cedulaCliente varchar(25) not null,
    idCompra int
);
create table proveedor(
    idProveedor int primary key,
    nombreProveedor varchar(50) not null,
    apellidoProveedor varchar(50) not null,
    direccionProveedor varchar(50) not null,
    cedulaProveedor varchar(25) not null,
    idSuministro int
);
create table suministroProveedor(
    idSuministro int primary key,
    idProveedor int,
    idAccesorio int,
    idRepuesto int,
    foreign key (idProveedor) references proveedor(idProveedor)
);
create table compra(
    idCompra int primary key,
    idCliente int, 
    idAccesorio int,
    idRepuesto int,
    fechaCompra date,
    valorTotal float check (valorTotal > 0)
);
create table accesorio(
    idAccesorio int primary key,
    precioUnitario float check (precioUnitario > 0),
    idCompra int,
    idInventario int,
    foreign key (idCompra) references compra(idCompra)
);
create table repuesto(
    idRepuesto int primary key,
    precioUnitario float check (precioUnitario > 0),
    idCompra int,
    idInventario int,
    foreign key (idCompra) references compra(idCompra)
);
create table inventario(
    idInventario int primary key,
    CampusBike int,
    idAccesorio int,
    idRepuesto int,
    idVenta int,
    foreign key (idAccesorio) references accesorio(idAccesorio),
    foreign key (idRepuesto) references repuesto(idRepuesto)
);
create table venta(
    idVenta int primary key,
    idInventario int,
    idAccesorio int,
    idRepuesto int,
    fechaVenta date,
    foreign key (idInventario) references inventario(idInventario),
    foreign key (idAccesorio) references accesorio(idAccesorio),
    foreign key (idRepuesto) references repuesto(idRepuesto)
);
create table CampusBike(
    CampusBike int primary key,
    idInventario int,
    idCliente int,
    foreign key (idInventario) references inventario(idInventario),
    foreign key (idCliente) references cliente(idCliente)
);




