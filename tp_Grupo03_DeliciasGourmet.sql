
-- tables
-- Table: cliente
CREATE TABLE cliente (
    ClienteId int  NOT NULL IDENTITY,
    dni varchar(10)  NOT NULL,
    nombre varchar(20)  NOT NULL,
    apellido varchar(20)  NOT NULL,
    direccion varchar(40)  NOT NULL,
    telefono varchar(9)  NOT NULL,
    correo varchar(30)  NOT NULL,
    contrasenia varchar(50)  NOT NULL,
    detalles varchar(100)  NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY  (ClienteId)
);

-- Table: evento
CREATE TABLE evento (
    EventoId int  NOT NULL IDENTITY,
    fecha date  NOT NULL,
    ubicacion varchar(40)  NOT NULL,
    tipo_evento varchar(20)  NOT NULL,
    invitados int  NOT NULL,
    especificaciones varchar(50)  NOT NULL,
    cliente_id int  NOT NULL,
    CONSTRAINT evento_pk PRIMARY KEY  (EventoId)
);

-- Table: factura
CREATE TABLE factura (
    FacturaId int  NOT NULL IDENTITY,
    total float(2)  NOT NULL,
    metodo varchar(20)  NOT NULL,
    fecha_emision date  NOT NULL,
    evento_id int  NOT NULL,
    CONSTRAINT factura_pk PRIMARY KEY  (FacturaId)
);

-- Table: menu
CREATE TABLE menu (
    MenuId int  NOT NULL IDENTITY,
    platos varchar(200)  NOT NULL,
    bebidas varchar(200)  NOT NULL,
    postres varchar(200)  NOT NULL,
    restricciones varchar(200)  NOT NULL,
    evento_id int  NOT NULL,
    CONSTRAINT menu_pk PRIMARY KEY  (MenuId)
);

-- Table: recurso
CREATE TABLE recurso (
    RecursosId int  NOT NULL IDENTITY,
    tipo_recurso varchar(20)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    cantidad int  NOT NULL,
    evento_id int  NOT NULL,
    CONSTRAINT recurso_pk PRIMARY KEY  (RecursosId)
);

-- Table: tipo_de_pago
CREATE TABLE tipo_de_pago (
    TipoDePagoId int  NOT NULL IDENTITY,
    tipo_de_pago varchar(20)  NOT NULL,
    CONSTRAINT tipo_de_pago_pk PRIMARY KEY  (TipoDePagoId)
);

-- Table: tipo_de_pago_por_factura
CREATE TABLE tipo_de_pago_por_factura (
    TipoPagoporFactura int  NOT NULL IDENTITY,
    monto float(2)  NOT NULL,
    fecha_pago date  NOT NULL,
    factura_id int  NOT NULL,
    tipo_de_pago_id int  NOT NULL,
    CONSTRAINT tipo_de_pago_por_factura_pk PRIMARY KEY  (TipoPagoporFactura)
);

-- Table: usuario
CREATE TABLE usuario (
    UsuarioId int  NOT NULL IDENTITY,
    nombre_usuario varchar(20)  NOT NULL,
    contrasena varchar(30)  NOT NULL,
    rol varchar(20)  NOT NULL,
    CONSTRAINT usuario_pk PRIMARY KEY  (UsuarioId)
);

-- Table: usuarios_por_evento
CREATE TABLE usuarios_por_evento (
    evento_id int  NOT NULL,
    usuario_id int  NOT NULL,
    confirmacion bit  NOT NULL,
    CONSTRAINT usuarios_por_evento_pk PRIMARY KEY  (evento_id,usuario_id)
);

-- foreign keys
-- Reference: evento_cliente (table: evento)
ALTER TABLE evento ADD CONSTRAINT evento_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (ClienteId);

-- Reference: factura_evento (table: factura)
ALTER TABLE factura ADD CONSTRAINT factura_evento
    FOREIGN KEY (evento_id)
    REFERENCES evento (EventoId);

-- Reference: menu_evento (table: menu)
ALTER TABLE menu ADD CONSTRAINT menu_evento
    FOREIGN KEY (evento_id)
    REFERENCES evento (EventoId);

-- Reference: pago_factura (table: tipo_de_pago_por_factura)
ALTER TABLE tipo_de_pago_por_factura ADD CONSTRAINT pago_factura
    FOREIGN KEY (factura_id)
    REFERENCES factura (FacturaId);

-- Reference: recurso_evento (table: recurso)
ALTER TABLE recurso ADD CONSTRAINT recurso_evento
    FOREIGN KEY (evento_id)
    REFERENCES evento (EventoId);

-- Reference: tipo_de_pago_por_factura_tipo_de_pago (table: tipo_de_pago_por_factura)
ALTER TABLE tipo_de_pago_por_factura ADD CONSTRAINT tipo_de_pago_por_factura_tipo_de_pago
    FOREIGN KEY (tipo_de_pago_id)
    REFERENCES tipo_de_pago (TipoDePagoId);

-- Reference: usuarios_por_evento_evento (table: usuarios_por_evento)
ALTER TABLE usuarios_por_evento ADD CONSTRAINT usuarios_por_evento_evento
    FOREIGN KEY (evento_id)
    REFERENCES evento (EventoId);

-- Reference: usuarios_por_evento_usuario (table: usuarios_por_evento)
ALTER TABLE usuarios_por_evento ADD CONSTRAINT usuarios_por_evento_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (UsuarioId);
