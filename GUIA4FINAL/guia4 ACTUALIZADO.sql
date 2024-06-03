 create database supermercado;
 create database supermercado;


create database supermercado;

-- 1 --
create table  cliente( -- ya
idCliente int  primary key auto_increment,
nombreCliente  varchar(150) not null,
apellidoCliente varchar(150) not null,
DUICliente  varchar(10),
correoCliente varchar(150) not null,
FechaNacimientoCliente  date  not null,
telefonoCliente  int not null,
idDireccion int not null
);
-- 2 --
create table direccion( -- ya estuvo--
idDireccion int primary key,
linea1 varchar(150) not null,
linea2 varchar(150) not null,
codigoPostal   int not null,
idDistrito  int not null
);

-- 3 --
create table   Distrito(  -- ya
idDistrito int primary key  auto_increment,
distrito varchar(50) not null,
idMunicipio int not null
);
-- 4 --
create   table Municipio( -- ya estuvo
idMunicipio int  primary key auto_increment,
Municipio varchar(50) not null,
idDepartamento int  not null
);
-- 5 -- 
create table Departamento(  -- ya --
idDepartamento int primary key auto_increment,
Departamento varchar (25)not null,
pais varchar (25) not null
);
-- 6 --
create table Cargos ( -- ya
idCargos int primary key auto_increment,
Cargo varchar(100) not null,
descripcionCargos longtext not null

);
-- 7 --
create  table Empleado( -- ya
idEmpleado int primary key auto_increment,
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
create table  Venta( -- ya
idVenta int primary key auto_increment,
FechaVenta  date not null,
total decimal(10,0) not null,
idEmpleado int not null,
idCliente int not null

);
-- 9 --
create table Distribuidor ( -- ya  
idDistribuidor int primary key auto_increment,
Distribuidor varchar(100) not null,
descripcionDistribuidor longtext not null,
idDireccion int not null 
);
-- 10 --
create  table Pedidos( -- yaa
idPedidos int primary Key auto_increment,
montoPedido varchar(45) not null,
unidadespedidos  varchar(45)  not null,
fechaPedido  date  not null,
idEmpleado int not null ,
idDistribuidor  int not null

);

-- 11 --
create table  Unidadmedida(  -- ya --
idUnidadMedida int  primary key auto_increment,
UnidadMedida varchar (30) not null
);

select*from producto;
-- 12 --
create table Producto( -- ya --
idProducto int primary key  auto_increment,
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
create  table   DetallePedido(--  ya
idDetallePedido int primary key auto_increment,
cantidadProductoPedido  int not null,
idProducto int not null,
idPedidos int not null,
idFacturaCompra int not null
);
-- 14 --
create  table DetalleVenta( -- ya
idDetalleVenta int primary key auto_increment,
cantidadProductoVenta int not null,
idProducto int not null,
idVenta int not null
);
-- 15 --
create  table Bodega( -- ya
idBodega int primary key  auto_increment,
nombreBodega varchar(100) not null,
descripcion longtext not null,
capacidad  int not null,
tipoAlmacenamiento  varchar (200) not null,
fechaEntrada date not null,
fechaSalida date not null
);
-- 16 --
create table Categoria (  -- ya--
idCategoria int  primary key auto_increment,
Categoria varchar (50) not  null,
descripcionCategoria longtext not null

);
-- 17 --
create table Marca( -- ya
idMarca int primary key auto_increment,
Marca varchar(50) not null,
descripcionMarca longtext not null
);
-- 18 --
create table FacturaCompra( -- ya
idFacturaCompra int primary key auto_increment,
numeroFacturaCompra varchar (45) not null,
montoFacturaCompra decimal  not null,
ivaFacturaCompra  decimal not null,
creditoFiscalFacturaCompra  varchar(20) not null,
idFormaPago int not null,
idDetallePedido int  not null

);
-- 19 --
create table FormaPago(  -- ya--
idFormaPago int primary key auto_increment,
FormaPago varchar (150)
);
-- 20 --
create table FacturaVenta( -- ya
idFacturaVenta int primary key auto_increment,
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


           -- llaveforanea para detallepedido --
ALTER TABLE DetallePedido ADD FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
ALTER TABLE DetallePedido ADD FOREIGN KEY (idPedidos) REFERENCES Pedidos(idPedidos); -- f --
ALTER TABLE DetallePedido ADD FOREIGN KEY (idFacturaCompra) REFERENCES FacturaCompra (idFacturaCompra);
  -- llave foranea facturaventa ya --
ALTER TABLE FacturaVenta ADD FOREIGN KEY (idDetalleVenta) REFERENCES DetalleVenta (idDetalleVenta);
ALTER TABLE FacturaVenta ADD FOREIGN KEY (idFormaPago) REFERENCES FormaPago(idFormaPago);
-- 1--
INSERT INTO Departamento (Departamento, pais)
VALUES 
('ahuachapan', 'el salvador oriente'),
('sonsonate ', ' el salvador centro'),
('la union ', ' el salvador occidente');

-- 2--
INSERT INTO Departamento (Departamento, pais)
VALUES ('morazan', '  el salvador surESte'),
       (' santa Ana ', ' el salvador SurOeste');
   -- 3--     
INSERT INTO Categoria (Categoria, descripcionCategoria)
VALUES 
('Electrónica', 'Esta categoría incluye productos electrónicos como teléfonos móviles, computadoras, televisores, etc.'),
('Ropa', 'Esta categoría incluye prendas de vestir como camisetas, pantalones, vestidos, etc.'),
('Hogar', 'Esta categoría incluye productos para el hogar como muebles, electrodomésticos, decoraciones, etc.'),
('Juguetes', 'Esta categoría incluye juguetes para niños y niñas de todas las edades.'),
('Cuidado Personal', 'Esta categoría incluye productos para el cuidado personal como champú, jabón, cremas, etc.')   ;
-- 4--
INSERT INTO Cargos (Cargo, descripcionCargos)
VALUES 
('Gerente', 'Responsable de la gestión y coordinación de todas las operaciones de la empresa.'),
('Contador', 'Encargado de llevar registros financieros precisos y elaborar informes contables.'),
('Cajero', 'Encargado de cobrar  y  brinda atencion  de cliente.'),
('Asistente de Ventas', 'Brinda apoyo administrativo y asistencia en el departamento de ventas.'),
('Display', ' Responsable de mantener  el ordenamiento de los productos  en los diferentes pasillos.');
-- 5--
INSERT INTO FormaPago (FormaPago)
VALUES 
('Efectivo'),
('Tarjeta de crédito'),
('Transferencia bancaria'),
('PayPal'),
('Cheque');
-- 6--
  insert into municipio(Municipio,idDepartamento)
  values('ahuachapan',1),
  ('nahuizalco',2),
  ('santaRosa de lima',3),
  ('SanFranciscoGotera',4),
  ('metapan',5);
  
-- 1 --
-- create table  cliente(
-- idCliente int  primary key auto_increment,
-- nombreCliente  varchar(150) not null,
-- apellidoCliente varchar(150) not null,
-- DUICliente  varchar(10),
-- correoCliente varchar(150) not null,
-- FechaNacimientoCliente  date  not null,
-- telefonoCliente  int not null,
-- idDireccion int not null
-- );
 
-- create table   Distrito(
-- idDistrito int primary key  auto_increment,
-- distrito varchar(50) not null,
-- idMunicipio int not null
-- );

 insert into distrito(distrito,idmunicipio)
 values
 ('Atiquizaya',1),
 ('Acajutla',2),
 ('Conchagua',3),
 ('perkin',4),
  ('chalchuapa',5);

  -- create table direccion(
-- idDireccion int primary key,
-- linea1 varchar(150) not null,
-- linea2 varchar(150) not null,
-- codigoPostal   int not null,
-- idDistrito  int not null
-- );


 insert into direccion( idDireccion,linea1,linea2,codigoPostal,idDistrito)
 values(1,'Avenida Independencia','colonia la libertad',02104,1),
  (2,'Calle El Progreso','Barrio EL Centro',02307,2),
  (3,'Boulevar Los Heroes','Residencia los Olivos',03114,3),
  (4,'Avenida las Mongolias','Colonia Escalon',03212,4),
  (5,'Calle San Antonio','Colonia Santa Lucia',02102,5);
  select*from producto;
  

