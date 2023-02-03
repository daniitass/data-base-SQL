create table if not exists pedido_venta(
ID_pedidoV int primary key auto_increment,
ID_cliente int,
foreign key (ID_cliente) references cliente (ID_cliente),
ID_producto int,
foreign key (ID_producto) references producto (ID_producto),
ID_vendedor int,
foreign key (ID_vendedor) references vendedor(ID_vendedor),
fecha_inicio DATE NOT NULL,
fecha_entrega DATE NOT NULL
);

create table if not exists pedido_compra(
ID_pedidoc int primary key auto_increment,
ID_proveedor int,
foreign key (ID_proveedor) references proveedor (ID_proveedor),
fecha_inicio DATE NOT NULL,
fecha_entrega DATE NOT NULL
);

create table if not exists factura_emitida(
ID_factura_emitida int primary key auto_increment,
ID_cliente int,
foreign key (ID_cliente) references cliente (ID_cliente),
ID_vendedor int,
foreign key (ID_vendedor) references vendedor(ID_vendedor),
ID_pedidoC int,
foreign key (ID_pedidoC) references pedido_compra (ID_pedidoC),
fecha date not null,
numero_factura int not null,
monto float not null 
);

create table if not exists factura_recibida(
ID_factura_recibida int primary key auto_increment,
ID_proveedor int,
foreign key (ID_proveedor) references proveedor (ID_proveedor),
ID_pedidoV int,
foreign key (ID_pedidoV) references pedido_venta (ID_pedidoV),
fecha date not null,
numero_factura int not null,
monto float not null 
);