CREATE DATABASE campana_politica;
USE campana_politica;

#Zona morada:
CREATE TABLE partido_politico(
id_partido INT PRIMARY KEY AUTO_INCREMENT,
nit_partido VARCHAR(50) NOT NULL UNIQUE,
nombre_partido VARCHAR(100) NOT NULL UNIQUE,
sigla VARCHAR(20) NOT NULL,
personeria_juridica_cne VARCHAR(50) NOT NULL UNIQUE, 
representante_legal VARCHAR(100) NOT NULL
);

CREATE TABLE campania(
id_campania INT PRIMARY KEY AUTO_INCREMENT,
codigo_cne VARCHAR(50) NOT NULL UNIQUE,
nombre_campania VARCHAR(120) NOT NULL,
corporacion_cargo VARCHAR(50) NOT NULL,
modalidad_eleccion VARCHAR(50) NOT NULL, 
circunscripcion VARCHAR(40) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
tope_gastos_global DECIMAL(15,2) NOT NULL, CHECK (tope_gastos_global>0),
estado_campania VARCHAR(40) NOT NULL, 
id_partido INT,
FOREIGN KEY (id_partido) REFERENCES partido_politico (id_partido)
);

CREATE TABLE candidato(
id_candidato INT PRIMARY KEY AUTO_INCREMENT,
documento VARCHAR(20) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
appelido VARCHAR(100) NOT NULL,
correo VARCHAR(100) NOT NULL UNIQUE,
telefono VARCHAR(20) NOT NULL,
profesion VARCHAR(80) NOT NULL
);

CREATE TABLE candidatura (
id_candidatura INT AUTO_INCREMENT PRIMARY KEY,
id_campania INT NOT NULL,
id_candidato INT NOT NULL,
rol_en_campania VARCHAR(45) NOT NULL,
numero_renglon INT,
tope_gasto_individual DECIMAL(15,2) NOT NULL,
fecha_inscripcion DATE NOT NULL,
fecha_retiro DATE,
estado_postulacion VARCHAR(30) NOT NULL,
votos_individuales INT DEFAULT 0,
UNIQUE (id_campania, id_candidato),
FOREIGN KEY (id_campania) REFERENCES CAMPANiA(id_campania),
FOREIGN KEY (id_candidato) REFERENCES CANDIDATO(id_candidato)
);


CREATE TABLE zona(
id_zona INT PRIMARY KEY AUTO_INCREMENT,
codigo_dane VARCHAR(20) NOT NULL UNIQUE,
nombre_municipio VARCHAR(80) NOT NULL,
departamento VARCHAR(80) NOT NULL,
censo_electoral INT NOT NULL CHECK(censo_electoral > 0)
);

CREATE TABLE campania_zona (
id_campania INT NOT NULL,
id_zona INT NOT NULL,    
fecha_asignacion DATE NOT NULL,
estado_cobertura VARCHAR(30) NOT NULL,
PRIMARY KEY (id_campania, id_zona),
FOREIGN KEY (id_campania) REFERENCES campania(id_campania),
FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
);


#Zona azul oscuro:
CREATE TABLE donante(
id_donante INT PRIMARY KEY AUTO_INCREMENT,
documento_o_nit VARCHAR(50) NOT NULL UNIQUE,
nombre_o_razon_social VARCHAR(120) NOT NULL,
tipo_persona VARCHAR(30) NOT NULL,
telefono VARCHAR(20) NOT NULL,
correo VARCHAR(100) NOT NULL,
direccion VARCHAR(150) NOT NULL
);

CREATE TABLE donacion(
id_donacion INT PRIMARY KEY AUTO_INCREMENT,
fecha_donacion DATE NOT NULL,
monto DECIMAL (15,2) NOT NULL CHECK(monto > 0),
tipo_aporte VARCHAR(30) NOT NULL,
medio_pago VARCHAR(40) NOT NULL,
numero_recibo_oficial VARCHAR(40) NOT NULL UNIQUE,
id_donante INT,
id_campania INT,
FOREIGN KEY (id_donante) REFERENCES donante (id_donante),
FOREIGN KEY (id_campania) REFERENCES campania (id_campania)
);


#Zona verde:
CREATE TABLE evento(
id_evento INT PRIMARY KEY AUTO_INCREMENT,
nombre_evento VARCHAR(80) NOT NULL,
tipo_evento VARCHAR(50) NOT NULL,
fecha_evento DATE NOT NULL,
hora_evento TIME NOT NULL,
lugar_evento VARCHAR(150) NOT NULL,
aforo_estimado INT NOT NULL CHECK(aforo_estimado >= 0),
id_campania INT NOT NULL,
id_zona INT NOT NULL,
id_coordinador_territorial INT NOT NULL,
FOREIGN KEY (id_campania) REFERENCES campania (id_campania),
FOREIGN KEY (id_zona) REFERENCES zona (id_zona),
FOREIGN KEY (id_coordinador_territorial) REFERENCES coordinador_territoral (id_miembro)
);

CREATE TABLE voluntario (
id_voluntario INT PRIMARY KEY AUTO_INCREMENT,
documento VARCHAR(20) NOT NULL UNIQUE,
nombre VARCHAR(80) NOT NULL,
apellido VARCHAR(80) NOT NULL,
fecha_nacimiento DATE NOT NULL,
telefono VARCHAR(20) NOT NULL,
correo VARCHAR(100) NOT NULL,
ocupacion VARCHAR(80) NOT NULL
);

CREATE TABLE participacion(
id_participacion INT PRIMARY KEY AUTO_INCREMENT,
id_voluntario INT NOT NULL,
id_evento INT NOT NULL,
rol_asignado VARCHAR(60) NOT NULL,
hora_aportada DECIMAL(5,2) NOT NULL CHECK (hora_aportada > 0),
estado_asistencia VARCHAR(25) NOT NULL,
UNIQUE (id_voluntario, id_evento),
FOREIGN KEY (id_voluntario) REFERENCES voluntario (id_voluntario),
FOREIGN KEY (id_evento) REFERENCES evento (id_evento)
);

#Zona naranja:
CREATE TABLE proveedor(
id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
documento_o_nit VARCHAR(20) NOT NULL UNIQUE,
razon_social VARCHAR(120) NOT NULL,
tipo_servicio VARCHAR(60) NOT NULL,
telefono VARCHAR(20) NOT NULL,
correo VARCHAR(100) NOT NULL,
direccion VARCHAR(150) NOT NULL
);

CREATE TABLE gasto(
id_gasto INT PRIMARY KEY AUTO_INCREMENT,
numero_factura VARCHAR(40) NOT NULL,
fecha_gasto DATE NOT NULL,
categoria_gasto VARCHAR(60) NOT NULL,
monto DECIMAL(15,2) NOT NULL CHECK(monto > 0),
descripcion TEXT NOT NULL,
id_proveedor INT,
id_campania INT,
id_candidatura INT,
id_evento INT,
id_auditor INT,
FOREIGN KEY (id_proveedor) REFERENCES  proveedor (id_proveedor),
FOREIGN KEY (id_campania) REFERENCES campania (id_campania),
FOREIGN KEY (id_candidatura) REFERENCES candidatura (id_candidatura),
FOREIGN KEY (id_evento) REFERENCES evento (id_evento)
);

#Zona roja
CREATE TABLE SOPORTE_CONTABLE (
id_gasto INT NOT NULL,
id_soporte INT NOT NULL,
numero_radicado_cne VARCHAR(50) NOT NULL UNIQUE,
tipo_comprobante VARCHAR(50) NOT NULL,
fecha_radicado DATE NOT NULL,
url_archivo_soporte VARCHAR(255) NOT NULL,
valor_respaldado DECIMAL(15,2) NOT NULL CHECK (valor_respaldado > 0),
PRIMARY KEY (id_gasto, id_soporte),
FOREIGN KEY (id_gasto) REFERENCES GASTO(id_gasto)
);

#Zona azul clarita
CREATE TABLE equipo_campania(
id_miembro INT PRIMARY KEY AUTO_INCREMENT,
documento VARCHAR(20) NOT NULL UNIQUE, 
nombre VARCHAR(80) NOT NULL,
apellido VARCHAR(80) NOT NULL,
correo VARCHAR(100) NOT NULL UNIQUE,
telefono VARCHAR(20) NOT NULL,
fecha_vinculacion DATE NOT NULL,
id_campania INT NOT NULL,
FOREIGN KEY (id_campania) REFERENCES campania (id_campania)
);

CREATE TABLE jefe_comunicaciones(
id_miembro INT PRIMARY KEY,
enfoque_principal TEXT NOT NULL,
plataforma_gestion TEXT NOT NULL,
FOREIGN KEY (id_miembro) REFERENCES equipo_campania(id_miembro)
);

CREATE TABLE auditor_financiero(
id_miembro INT PRIMARY KEY,
tarjeta_profesional VARCHAR(30) NOT NULL UNIQUE,
registro_junta_central VARCHAR(40) NOT NULL,
fecha_resolucion_cne DATE NOT NULL,
FOREIGN KEY (id_miembro) REFERENCES equipo_campania(id_miembro)
);

CREATE TABLE coordinador_territoral(
id_miembro INT PRIMARY KEY,
id_zona INT NOT NULL,
linea_emergencia VARCHAR(20) NOT NULL,
presupuesto_caja_menor DECIMAL(15,2) NOT NULL CHECK(presupuesto_caja_menor >= 0),
FOREIGN KEY (id_miembro) REFERENCES equipo_campania (id_miembro),
FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
);

CREATE TABLE contrato(
id_evento INT NOT NULL,
id_proveedor INT NOT NULL,
fecha_contrato DATE NOT NULL,
descripcion_servicio VARCHAR(100) NOT NULL,
costo_pactado DECIMAL(15,2) NOT NULL CHECK (costo_pactado > 0),
estado_contrato VARCHAR(25) NOT NULL,
hora_isntalacion TIME NOT NULL,
PRIMARY KEY(id_evento, id_proveedor),
FOREIGN KEY( id_evento) REFERENCES evento (id_evento),
FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor)
);

SHOW TABLES;
