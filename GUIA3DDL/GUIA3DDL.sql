




create database supermercado;

-- 1 --
create table  cliente(
idCliente int  primary key,
nombreCliente  varchar(150) not null,
apellidoCliente varchar(150) not null,
DUICliente  varchar( 12) not null,
correoCliente varchar(150) not null,
FechaNacimientoCliente  date  not null,
telefonoCliente  varchar(20) not null,
idDireccion  int  not null
);
-- 2 --
create table direccion(
idDireccion int primary key,
linea1 varchar(100) not null,
linea2 varchar(100) not null,
codigoPostal   varchar(7) not null,
idDistrito  int not null
);

-- 3 --
create table   Distrito(
idDistrito int primary key,
distrito varchar(50) not null,
idMunicipio int not null
);
-- 4 --
create   table Municipio(
idMunicipio int  primary key,
Municipio varchar(50) not null,
idDepartamento int  not null
);
-- 5 -- 
create table Departamento(
idDepartamento int primary key,
Departamento varchar (25)not null,
pais varchar (25) not null
);
-- 6 --
create table Cargos (
idCargos int primary key,
Cargo varchar(25) not null,
descripcionCargos longtext not null

);
-- 7 --
create  table Empleado(
idEmpleado int primary key,
nombreEmpleado varchar(150) not null,
apellidoEmpleado varchar (150) not null,
DUIEmpleado int not null,
correoEmpleado varchar (150) not null,
FechaNacimientoEmpleado  date not null,
telefonoEmpleado int not null,
idCargos  int not null,
idDireccion int not null
);
-- 8 --
create table  Venta(
idVenta int primary key,
FechaVenta  date not null,
total decimal(10,0) not null,
idEmpleado int not null,
idCliente int not null

);
-- 9 --
create table Distribuidor (
idDistribuidor int primary key,
Distribuidor varchar(100) not null,
descripcionDistribuidor longtext not null,
idDireccion int not null 
);
-- 10 --
create  table Pedidos(
idPedidos int primary Key,
montoPedido varchar(45) not null,
unidadespedidos  varchar(45)  not null,
fechaPedido  date  not null,
idEmpleado int ,
idDistribuidor  int 

);
-- 11 --
create table  Unidadmedida(
idUnidadMedida int  primary key,
UnidadMedida varchar (30) not null
);


-- 12 --
create table Producto(
idProducto int primary key,
Producto varchar (100) not null,
descripcionProducto varchar (200) not null,
precioVenta decimal (10,0) not null,
stock int not null,
fechaCaducida date  not null,
idDistribuidor int  not null,
idUnidadMedida int not null,
idBodega int not null,
idCategoria int  not null,
idMarca int not null
);


-- 13 --
create  table   DetallePedido(
idDetallePedido int primary key,
cantidadProductoPedido  int not null,
idProducto int not null,
idPedidos int not null,
idFacturaCompra int not null
);
-- 14 --
create  table DetalleVenta(
idDetalleVenta int primary key,
cantidadProductoVenta int not null,
idProducto int not null,
idVenta int not null
);
-- 15 --
create  table Bodega(
idBodega int primary key ,
nombreBodega varchar(100) not null,
descripcion longtext not null,
capacidad  int not null,
tipoAlmacenamiento  varchar (200) not null,
fechaEntrada date not null,
fechaSalida date not null
);
-- 16 --
create table Categoria (
idCategoria int  primary key,
Categoria varchar (50) not  null,
descripcionCategoria longtext not null

);
-- 17 --
create table Marca(
idMarca int primary key,
Marca varchar(50) not null,
descripcionMarca longtext not null
);
-- 18 --
create table FacturaCompra(
idFacturaCompra int primary key,
numeroFacturaCompra varchar (45) not null,
montoFacturaCompra decimal  not null,
ivaFacturaCompra  decimal not null,
creditoFiscalFacturaCompra  varchar(20) not null,
idDetallePedido int  not null,
idFormaPago int not null
);
-- 19 --
create table FormaPago(
idFormaPago int primary key,
FormaPago varchar (150)
);
-- 20 --
create table FacturaVenta(
idFacturaVenta int primary key,
numerodeFactura varchar ( 50) not null,
MontoFacturaVenta  decimal not  null,
ivaFacturaVenta  decimal not null,
creditoFiscalFacturaVenta  varchar(20) not null,
idDetalleVenta int not null,
idFormaPago int not null   
);
-- LLAVES FORANEAS DE DIRECCIONES --
ALTER TABLE Municipio ADD  FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);
ALTER TABLE Distrito ADD FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio);
ALTER TABLE Direccion ADD FOREIGN KEY ( idDistrito) REFERENCES Distrito(idDistrito);
--   llave foranea para empleado --
ALTER TABLE Empleado  ADD FOREIGN KEY (idCargos) REFERENCES Cargos(idCargos); 
ALTER TABLE Empleado ADD FOREIGN KEY (idDireccion) REFERENCES Direccion(idDireccion); 
 --  llave foranea para cliente --
ALTER TABLE Cliente ADD FOREIGN KEY (idDireccion) REFERENCES Direccion(idDireccion);
 -- llave foranea para venta --
ALTER TABLE Venta ADD FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente);-- ya --
 -- llave foranea para venta --
ALTER TABLE Venta ADD FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente);-- ya --
                           -- llave foranea para distribuidor --
ALTER TABLE Distribuidor ADD FOREIGN KEY (idDireccion) REFERENCES Direccion(idDireccion);
  -- llave foranea para producto --
ALTER TABLE Producto ADD FOREIGN KEY (idDistribuidor) REFERENCES Distribuidor(idDistribuidor); -- f --
ALTER TABLE producto ADD FOREIGN KEY (idUnidadMedida) REFERENCES unidadmedida (idUnidadMedida);
ALTER TABLE producto ADD FOREIGN KEY (idBodega) REFERENCES bodega(idBodega); 
ALTER TABLE producto ADD FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria);
ALTER TABLE producto ADD FOREIGN KEY (idMarca) REFERENCES Marca(idMarca);
-- llave foranea  para pedidos --
ALTER TABLE Pedidos ADD FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado); -- f --
ALTER TABLE Pedidos ADD FOREIGN KEY (idDistribuidor) REFERENCES Distribuidor(idDistribuidor);
-- llave foranea para detalleVenta --
ALTER TABLE DetalleVenta ADD FOREIGN KEY (idVenta) REFERENCES venta(idVenta); 
ALTER TABLE DetalleVenta ADD FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
-- llave foranea para  factura compra  ya--
ALTER TABLE FacturaCompra ADD FOREIGN KEY (idFormaPago) REFERENCES FormaPago(idFormaPago);
ALTER TABLE FacturaCompra ADD FOREIGN KEY (idFormaPago) REFERENCES DetallePedido(idDetallePedido);

           -- llaveforanea para detallepedido --
ALTER TABLE DetallePedido ADD FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
ALTER TABLE DetallePedido ADD FOREIGN KEY (idPedidos) REFERENCES Pedidos(idPedidos); -- f --
ALTER TABLE DetallePedido ADD FOREIGN KEY (idFacturaCompra) REFERENCES FacturaCompra (idFacturaCompra);
  -- llave foranea facturaventa ya --
ALTER TABLE FacturaVenta ADD FOREIGN KEY (idDetalleVenta) REFERENCES DetalleVenta (idDetalleVenta);
ALTER TABLE FacturaVenta ADD FOREIGN KEY (idFormaPago) REFERENCES FormaPago(idFormaPago);


      

                 
 
 
