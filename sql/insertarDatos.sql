USE campana_politica;

-- =============================================================================
-- NIVEL 1: INSERCION EN TABLAS INDEPENDIENTES Y CATALOGOS MAESTROS
-- =============================================================================

-- 1. PARTIDO_POLITICO (12 registros: IDs 1 al 12)
INSERT INTO partido_politico (nit_partido, nombre_partido, sigla, personeria_juridica_cne, representante_legal) VALUES
('800111222-1', 'Partido Liberal Colombiano', 'PLC', 'RES-CNE-001-1991', 'Cesar Gaviria Trujillo'),
('800222333-2', 'Partido Conservador Colombiano', 'PCC', 'RES-CNE-002-1991', 'Efrain Cepeda Sarabia'),
('800333444-3', 'Partido Alianza Verde', 'PAV', 'RES-CNE-045-2009', 'Rodrigo Romero Hernandez'),
('800444555-4', 'Partido Centro Democratico', 'CD', 'RES-CNE-305-2014', 'Gabriel Jaime Vallejo'),
('800555666-5', 'Movimiento Colombia Humana', 'CH', 'RES-CNE-112-2021', 'Eduardo Noriega De La Hoz'),
('800666777-6', 'Partido Cambio Radical', 'PCR', 'RES-CNE-088-1998', 'German Cordoba Ordonez'),
('800777888-7', 'Partido de la Union por la Gente', 'LA U', 'RES-CNE-210-2005', 'Alexander Vega Rocha'),
('800888999-8', 'Polo Democratico Alternativo', 'PDA', 'RES-CNE-154-2006', 'Alexander Lopez Maya'),
('800999000-9', 'Partido Nuevo Liberalismo', 'NL', 'RES-CNE-412-2021', 'Juan Manuel Galan Pachon'),
('801000111-0', 'Partido Mira', 'MIRA', 'RES-CNE-077-2000', 'Manuel Virguez Piraquive'),
('801111222-1', 'Partido Dignidad y Compromiso', 'DYC', 'RES-CNE-520-2023', 'Sergio Fajardo Valderrama'),
('801222333-2', 'Movimiento Salvacion Nacional', 'MSN', 'RES-CNE-489-2021', 'Enrique Gomez Martinez');

-- 2. CORPORACION (10 registros: IDs 1 al 10)
INSERT INTO corporacion (nombre_corporacion, modalidad_eleccion, tipo_circunscripcion) VALUES
('Presidencia de la Republica', 'Formula', 'Nacional'),
('Senado de la Republica - Ordinaria', 'Lista Abierta', 'Nacional'),
('Senado de la Republica - Cerrada', 'Lista Cerrada', 'Nacional'),
('Camara de Representantes - Bogota', 'Lista Abierta', 'Departamental'),
('Camara de Representantes - Antioquia', 'Lista Cerrada', 'Departamental'),
('Gobernacion Departamental', 'Uninominal', 'Departamental'),
('Alcaldia Mayor / Distrital', 'Uninominal', 'Municipal'),
('Alcaldia Municipal', 'Uninominal', 'Municipal'),
('Asamblea Departamental', 'Lista Abierta', 'Departamental'),
('Concejo Distrital / Municipal', 'Lista Abierta', 'Municipal');

-- 3. CANDIDATO (16 registros: IDs 1 al 16)
INSERT INTO candidato (documento_candidato, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo_electronico, telefono, profesion) VALUES
('1010123456', 'Carlos', 'Fernando', 'Mendoza', 'Rojas', 'carlos.mendoza@campana.co', '3102345678', 'Economista'),
('1010234567', 'Claudia', 'Patricia', 'Lozano', 'Duarte', 'claudia.lozano@campana.co', '3113456789', 'Abogada Constitucionalista'),
('1010345678', 'Alejandro', 'Jose', 'Gaviria', 'Restrepo', 'alejandro.gaviria@campana.co', '3124567890', 'Ingeniero Civil'),
('1010456789', 'Maria', 'Fernanda', 'Cabal', 'Molina', 'maria.cabal@campana.co', '3135678901', 'Politologa'),
('1010567890', 'Gustavo', 'Adolfo', 'Bolivar', 'Moreno', 'gustavo.bolivar@campana.co', '3146789012', 'Comunicador Social'),
('1010678901', 'Humberto', 'De La Calle', 'Lombana', 'Gomez', 'humberto.delacalle@campana.co', '3157890123', 'Abogado'),
('1010789012', 'Paloma', 'Susana', 'Valencia', 'Laserna', 'paloma.valencia@campana.co', '3168901234', 'Filosofa y Abogada'),
('1010890123', 'Catherine', 'Juvinao', 'Clavijo', 'Perez', 'catherine.juvinao@campana.co', '3179012345', 'Periodista'),
('1010901234', 'David', 'Andres', 'Racero', 'Mayorca', 'david.racero@campana.co', '3180123456', 'Filosofo'),
('1011012345', 'Juan', 'Daniel', 'Oviedo', 'Arango', 'juan.oviedo@campana.co', '3191234567', 'Economista Estadistico'),
('1011123456', 'Federico', 'Andres', 'Gutierrez', 'Zuluaga', 'federico.gutierrez@campana.co', '3002345678', 'Ingeniero Civil'),
('1011234567', 'Alejandro', 'Eder', 'Garces', 'Lloreda', 'alejandro.eder@campana.co', '3013456789', 'Internacionalista'),
('1011345678', 'Jaime', 'Andres', 'Beltran', 'Martinez', 'jaime.beltran@campana.co', '3024567890', 'Comunicador Social'),
('1011456789', 'Angie', 'Natalia', 'Rodriguez', 'Fajardo', 'angie.rodriguez@campana.co', '3035678901', 'Administradora Publica'),
('1011567890', 'Rodrigo', 'Lara', 'Restrepo', 'Bonilla', 'rodrigo.lara@campana.co', '3046789012', 'Abogado Especialista'),
('1011678901', 'Sandra', 'Liliana', 'Ortiz', 'Nova', 'sandra.ortiz@campana.co', '3057890123', 'Sociologa');

-- 4. ZONA (12 registros: IDs 1 al 12)
INSERT INTO zona (codigo_dane, nombre_municipio, departamento, censo_electoral) VALUES
('11001', 'Bogota D.C.', 'Bogota D.C.', 6015230),
('05001', 'Medellin', 'Antioquia', 1812450),
('76001', 'Cali', 'Valle del Cauca', 1425800),
('08001', 'Barranquilla', 'Atlantico', 985400),
('68001', 'Bucaramanga', 'Santander', 462100),
('13001', 'Cartagena de Indias', 'Bolivar', 798300),
('66001', 'Pereira', 'Risaralda', 385200),
('17001', 'Manizales', 'Caldas', 342900),
('54001', 'Cucuta', 'Norte de Santander', 540800),
('73001', 'Ibague', 'Tolima', 415600),
('52001', 'Pasto', 'Narino', 312400),
('15001', 'Tunja', 'Boyaca', 145800);

-- 5. DONANTE (12 registros: IDs 1 al 12)
INSERT INTO donante (documento_o_nit, nombre_o_razon_social, tipo_persona, telefono, correo_electronico, direccion, barrio, municipio, complemento) VALUES
('900123456-1', 'Inversiones del Norte S.A.S.', 'Persona Juridica', '6013456789', 'contabilidad@invnorte.co', 'Calle 72 # 10-34', 'El Nogal', 'Bogota D.C.', 'Oficina 802'),
('79456123', 'Roberto Carlos Sarmiento Vega', 'Persona Natural', '3109876543', 'rsarmiento@gmail.com', 'Carrera 7 # 115-60', 'Santa Barbara', 'Bogota D.C.', 'Apartamento 501'),
('900234567-2', 'Constructora Horizonte Andino S.A.', 'Persona Juridica', '6042345678', 'aportes@horizonteandino.co', 'Carrera 43A # 1-50', 'El Poblado', 'Medellin', 'Torre Empresarial Piso 12'),
('52345678', 'Elena Maria Echavarria Olano', 'Persona Natural', '3118765432', 'elena.echavarria@outlook.com', 'Transversal 5 # 45-12', 'Patio Bonito', 'Medellin', 'Casa 4'),
('900345678-3', 'Agroindustrias del Valle Ltda.', 'Persona Juridica', '6024567890', 'gerencia@agrovalle.com.co', 'Avenida 6N # 28-10', 'Santa Monica', 'Cali', 'Bodega Central'),
('80123987', 'Fernando Jose Londono Hoyos', 'Persona Natural', '3127654321', 'flondono@yahoo.com', 'Calle 93B # 15-40', 'Chico Norte', 'Bogota D.C.', 'Oficina 304'),
('900456789-4', 'Logistica Caribe Internacional S.A.S.', 'Persona Juridica', '6053456789', 'finanzas@logisticacaribe.co', 'Carrera 54 # 74-80', 'Alto Prado', 'Barranquilla', 'Local 2'),
('41987654', 'Clara Ines Restrepo de Mora', 'Persona Natural', '3156543210', 'clara.restrepo@gmail.com', 'Calle 10 # 32-15', 'Ciudad Jardin', 'Cali', 'Conjunto Los Robles'),
('900567890-5', 'Tecnologia y Sistemas Colombia S.A.S.', 'Persona Juridica', '6017654321', 'tesoreria@tecsistemas.co', 'Avenida El Dorado # 68B-85', 'Salitre', 'Bogota D.C.', 'Torre B Piso 6'),
('71654321', 'Mauricio Andres Tobon Jaramillo', 'Persona Natural', '3165432109', 'mtobon@une.net.co', 'Circular 4 # 70-22', 'Laureles', 'Medellin', 'Apartamento 301'),
('900678901-6', 'Comercializadora Santandereana S.A.', 'Persona Juridica', '6076543210', 'info@comersantander.co', 'Carrera 33 # 48-20', 'Cabecera del Llano', 'Bucaramanga', 'Piso 3'),
('63456789', 'Martha Lucia Ramirez Blanco', 'Persona Natural', '3174321098', 'martha.ramirez@hotmail.com', 'Calle 36 # 29-18', 'La Aurora', 'Bucaramanga', 'Edificio Mirador Apto 902');

-- 6. TIPO_APORTE (10 registros: IDs 1 al 10)
INSERT INTO tipo_aporte (nombre_tipo_aporte) VALUES
('Donacion en Dinero Persona Natural'),
('Donacion en Dinero Persona Juridica'),
('Aporte en Especie - Publicidad'),
('Aporte en Especie - Transporte'),
('Aporte en Especie - Sede y Logistica'),
('Recursos Propios del Candidato'),
('Recursos de Familiares Hasta 4to Grado'),
('Credito Bancario con Garantia Reposicion'),
('Anticipo Estatal Financiacion Previa'),
('Aporte Directo del Partido Politico');

-- 7. MEDIO_PAGO (10 registros: IDs 1 al 10)
INSERT INTO medio_pago (nombre_medio_pago) VALUES
('Transferencia Electronica ACH'),
('Transferencia Interbancaria PSE'),
('Consignacion en Cuenta Unica CNE'),
('Cheque de Gerencia Cruzado'),
('Cheque Girado a Cuenta de Campana'),
('Giro Bancario Nacional'),
('Debito Automatico Corporativo'),
('Acta de Entrega Valorada en Especie'),
('Desembolso de Credito Fiducia Electoral'),
('Giro Tesoral Ministerio de Hacienda');

-- 8. VOLUNTARIO (15 registros: IDs 1 al 15)
INSERT INTO voluntario (documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, fecha_nacimiento, telefono, correo, ocupacion) VALUES
('1020111222', 'Santiago', 'Andres', 'Soto', 'Cartagena', '2003-04-15', '3201112233', 'santiago.soto@voluntarios.co', 'Estudiante de Ingenieria'),
('1020222333', 'Mariana', 'Sofia', 'Pineda', 'Melo', '2004-08-22', '3202223344', 'mariana.pineda@voluntarios.co', 'Analista de Datos'),
('1020333444', 'Martin', 'Santiago', 'Pena', 'Gutierrez', '2003-11-03', '3203334455', 'martin.pena@voluntarios.co', 'Desarrollador de Software'),
('1020444555', 'Nicolas', 'Felipe', 'Barreto', 'Arroyo', '2003-06-19', '3204445566', 'nicolas.barreto@voluntarios.co', 'Coordinador de Redes'),
('1020555666', 'Maria', 'Angelica', 'Caiza', 'Lopez', '2004-01-28', '3205556677', 'maria.caiza@voluntarios.co', 'Disenadora Grafica'),
('1020666777', 'Laura', 'Valentina', 'Castellanos', 'Ruiz', '1998-09-10', '3206667788', 'laura.castellanos@voluntarios.co', 'Politologa'),
('1020777888', 'Camilo', 'Ernesto', 'Vargas', 'Suarez', '1995-12-05', '3207778899', 'camilo.vargas@voluntarios.co', 'Abogado Litigante'),
('1020888999', 'Diana', 'Carolina', 'Ospina', 'Bedoya', '2000-03-17', '3208889900', 'diana.ospina@voluntarios.co', 'Trabajadora Social'),
('1020999000', 'Andres', 'Mauricio', 'Quintero', 'Pardo', '1992-07-24', '3211112233', 'andres.quintero@voluntarios.co', 'Administrador de Empresas'),
('1021000111', 'Paula', 'Andrea', 'Moreno', 'Salazar', '2001-05-30', '3212223344', 'paula.moreno@voluntarios.co', 'Comunicadora Audiovisual'),
('1021111222', 'Jorge', 'Eliecer', 'Rincon', 'Martinez', '1989-10-12', '3213334455', 'jorge.rincon@voluntarios.co', 'Lider Comunitario'),
('1021222333', 'Natalia', 'Ximena', 'Cortes', 'Avila', '1999-02-14', '3214445566', 'natalia.cortes@voluntarios.co', 'Psicologa Social'),
('1021333444', 'Sebastian', 'David', 'Herrera', 'Montoya', '2002-08-08', '3215556677', 'sebastian.herrera@voluntarios.co', 'Estudiante de Derecho'),
('1021444555', 'Valeria', 'Alejandra', 'Mejia', 'Giraldo', '2000-11-21', '3216667788', 'valeria.mejia@voluntarios.co', 'Publicista'),
('1021555666', 'Oscar', 'Ivan', 'Delgado', 'Pinto', '1994-04-02', '3217778899', 'oscar.delgado@voluntarios.co', 'Tecnico en Logistica');

-- 9. PROVEEDOR (12 registros: IDs 1 al 12)
INSERT INTO proveedor (documento_o_nit, razon_social, tipo_servicio, telefono, correo, direccion, barrio, municipio, complemento) VALUES
('901111222-1', 'Litografia e Impresores Nacionales S.A.S.', 'Impresion Publicitaria', '6012345678', 'facturacion@litonacional.co', 'Calle 13 # 38-45', 'Puente Aranda', 'Bogota D.C.', 'Bodega 12'),
('901222333-2', 'Sonido y Tarimas ProEventos Colombia Ltda.', 'Produccion de Eventos', '6013451122', 'comercial@proeventos.co', 'Carrera 30 # 63-20', 'Campin', 'Bogota D.C.', 'Local 101'),
('901333444-3', 'Agencia Digital Estrategia 360 S.A.S.', 'Marketing Digital y Pauta', '6044567890', 'cuentas@estrategia360.co', 'Calle 10A # 40-15', 'El Poblado', 'Medellin', 'Oficina 405'),
('901444555-4', 'Transportes Especiales El Condor S.A.', 'Transporte Terrestre', '6025678901', 'operaciones@transcondor.co', 'Calle 25 # 8N-30', 'San Vicente', 'Cali', 'Patio Operativo 2'),
('901555666-5', 'Catering y Logistica Gourmet Express S.A.S.', 'Alimentacion y Refrigerios', '6016789012', 'pedidos@gourmetexpress.co', 'Carrera 15 # 85-30', 'Virrey', 'Bogota D.C.', 'Planta 2'),
('901666777-6', 'Vallas y Medios Exteriores Visual S.A.', 'Publicidad Exterior Visual', '6057890123', 'ventas@visualexterior.co', 'Via 40 # 73-290', 'Las Flores', 'Barranquilla', 'Complejo Industrial'),
('901777888-7', 'Centro de Convenciones Plaza Mayor S.A.', 'Alquiler de Salones', '6042617200', 'eventos@plazamayor.com.co', 'Calle 41 # 55-80', 'La Alpujarra', 'Medellin', 'Pabellon Amarillo'),
('901888999-8', 'Encuestas y Opinion Publica DatosCol S.A.S.', 'Estudios Electorales', '6018901234', 'direccion@datoscol.co', 'Carrera 11 # 93-46', 'Chico', 'Bogota D.C.', 'Oficina 601'),
('901999000-9', 'Seguridad Privada Centinela Ltda.', 'Seguridad y Logistica', '6076345678', 'contratos@seguridadcentinela.co', 'Calle 52 # 31-40', 'Antiguo Campestre', 'Bucaramanga', 'Sede Principal'),
('902000111-0', 'Radiodifusora Cadena Nacional S.A.', 'Pauta Radial y Television', '6013147070', 'pauta@cadenanacional.co', 'Avenida Americas # 65-82', 'Marsella', 'Bogota D.C.', 'Torre de Medios'),
('902111222-1', 'Dotaciones y Textil Publicitario S.A.S.', 'Material POP y Camisetas', '6063214567', 'ventas@textilpop.co', 'Carrera 8 # 21-15', 'Centro', 'Pereira', 'Bodega 4'),
('902222333-2', 'Inmobiliaria Corporativa Capital S.A.S.', 'Arrendamiento de Sedes', '6014567899', 'arriendos@inmocapital.co', 'Carrera 7 # 32-84', 'San Martin', 'Bogota D.C.', 'Piso 10');

-- 10. CATEGORIA_GASTO (10 registros: IDs 1 al 10)
INSERT INTO categoria_gasto (nombre_categoria) VALUES
('Propaganda Electoral y Medios de Comunicacion'),
('Actos Publicos y Logistica de Eventos'),
('Servicio de Transporte y Correo'),
('Gastos de Administracion y Arriendo de Sedes'),
('Investigacion Politica y Encuestas Electorales'),
('Inversion en Materiales y Publicaciones Impresas'),
('Costos Financieros y Comisiones Bancarias'),
('Capacitacion de Testigos y Voluntariado Electoral'),
('Pauta Digital y Redes Sociales'),
('Gastos Judiciales y de Rendicion de Cuentas');

-- 11. SOPORTE (15 registros: IDs 1 al 15)
INSERT INTO soporte (numero_radicado_cne, tipo_comprobante, fecha_radicado, url_archivo_soporte) VALUES
('RAD-CNE-2026-00101', 'Factura Electronica DIAN', '2026-02-12', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00101.pdf'),
('RAD-CNE-2026-00102', 'Comprobante de Egreso', '2026-02-15', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00102.pdf'),
('RAD-CNE-2026-00103', 'Factura Electronica DIAN', '2026-02-20', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00103.pdf'),
('RAD-CNE-2026-00104', 'Contrato y Acta de Recibo', '2026-02-25', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00104.pdf'),
('RAD-CNE-2026-00105', 'Factura Electronica DIAN', '2026-03-02', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00105.pdf'),
('RAD-CNE-2026-00106', 'Documento Soporte No Obligados', '2026-03-04', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00106.pdf'),
('RAD-CNE-2026-00107', 'Factura Electronica DIAN', '2026-03-05', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00107.pdf'),
('RAD-CNE-2026-00108', 'Comprobante de Egreso', '2026-03-06', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00108.pdf'),
('RAD-CNE-2026-00109', 'Factura Electronica DIAN', '2026-03-07', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00109.pdf'),
('RAD-CNE-2026-00110', 'Factura Electronica DIAN', '2026-03-21', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00110.pdf'),
('RAD-CNE-2026-00111', 'Factura Electronica DIAN', '2026-03-26', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00111.pdf'),
('RAD-CNE-2026-00112', 'Extracto y Certificacion Fiducia', '2026-04-03', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00112.pdf'),
('RAD-CNE-2026-00113', 'Factura Electronica DIAN', '2026-04-08', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00113.pdf'),
('RAD-CNE-2026-00114', 'Cuenta de Cobro y Acta Logistica', '2026-04-14', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00114.pdf'),
('RAD-CNE-2026-00115', 'Factura Electronica DIAN', '2026-04-25', 'https://cuentasclaras.cne.gov.co/soportes/2026/rad_00115.pdf');

-- =============================================================================
-- NIVEL 2: INSERCION EN ENTIDAD CENTRAL (CAMPANIA)
-- =============================================================================

-- 12. CAMPANIA (12 registros: IDs 1 al 12)
INSERT INTO campania (codigo_cne, nombre_campania, id_corporacion, fecha_inicio, fecha_fin, tope_gasto_global, estado_campania, id_partido) VALUES
('CNE-2026-PRES-001', 'Campana Presidencial Colombia Avanza 2026', 1, '2026-01-15', '2026-05-31', 28500000000.00, 'En Ejecucion', 1),
('CNE-2026-PRES-002', 'Campana Presidencial Futuro Verde 2026', 1, '2026-01-15', '2026-05-31', 28500000000.00, 'En Ejecucion', 3),
('CNE-2026-SEN-003', 'Lista Senado Liberal por las Regiones 2026', 2, '2025-12-08', '2026-03-08', 112000000000.00, 'Liquidada', 1),
('CNE-2026-SEN-004', 'Lista Cerrada Senado Pacto Historico 2026', 3, '2025-12-08', '2026-03-08', 112000000000.00, 'Liquidada', 5),
('CNE-2026-CAM-005', 'Lista Camara Bogota Nuevo Liberalismo 2026', 4, '2025-12-08', '2026-03-08', 18500000000.00, 'Liquidada', 9),
('CNE-2026-CAM-006', 'Lista Camara Antioquia Centro Democratico', 5, '2025-12-08', '2026-03-08', 16200000000.00, 'Liquidada', 4),
('CNE-2026-ALC-007', 'Campana Alcaldia Mayor de Bogota Con Todo', 7, '2026-02-01', '2026-10-25', 5400000000.00, 'En Ejecucion', 11),
('CNE-2026-ALC-008', 'Campana Alcaldia de Medellin Creemos', 8, '2026-02-01', '2026-10-25', 2950000000.00, 'En Ejecucion', 2),
('CNE-2026-ALC-009', 'Campana Alcaldia de Cali Revive', 8, '2026-02-01', '2026-10-25', 2800000000.00, 'En Ejecucion', 7),
('CNE-2026-GOB-010', 'Campana Gobernacion de Santander Segura', 6, '2026-02-01', '2026-10-25', 4100000000.00, 'En Ejecucion', 6),
('CNE-2026-CON-011', 'Lista Concejo de Bogota Alianza Verde', 10, '2026-02-01', '2026-10-25', 9800000000.00, 'En Ejecucion', 3),
('CNE-2026-ASA-012', 'Lista Asamblea de Antioquia Conservadora', 9, '2026-02-01', '2026-10-25', 7500000000.00, 'Planificada', 2);

-- =============================================================================
-- NIVEL 3: INSERCION EN TABLAS DEPENDIENTES DE CAMPANIA
-- =============================================================================

-- 13. CANDIDATURA (16 registros: IDs 1 al 16)
-- Nota de negocio: Las campanas 'En Ejecucion' tienen voto_individual = 0 porque la eleccion
-- aun no se ha celebrado; las 'Liquidada' de Lista Abierta tienen votos individuales escrutados,
-- y las de Lista Cerrada tienen 0 en voto individual porque el voto es al logo del partido.
INSERT INTO candidatura (id_campania, id_candidato, rol_en_campania, numero_tarjeton, tope_gasto_individual, fecha_inscripcion, fecha_retiro, estado_postulacion, voto_individual) VALUES
(1, 1, 'Candidato Presidencial', 1, 20000000000.00, '2026-01-15', NULL, 'Vigente', 0),
(1, 2, 'Formula Vicepresidencial', 1, 8500000000.00, '2026-01-15', '2026-03-01', 'Renuncio', 0),
(1, 14, 'Formula Vicepresidencial', 1, 8500000000.00, '2026-03-02', NULL, 'Vigente', 0),
(2, 3, 'Candidato Presidencial', 2, 20000000000.00, '2026-01-15', NULL, 'Vigente', 0),
(2, 16, 'Formula Vicepresidencial', 2, 8500000000.00, '2026-01-15', NULL, 'Vigente', 0),
(3, 6, 'Cabeza de Lista', 1, 1120000000.00, '2025-12-08', NULL, 'Electo', 185400),
(3, 15, 'Integrante de Lista', 2, 1120000000.00, '2025-12-08', NULL, 'Electo', 94320),
(4, 5, 'Cabeza de Lista', 1, 1120000000.00, '2025-12-08', NULL, 'Electo', 0),
(4, 9, 'Integrante de Lista', 2, 1120000000.00, '2025-12-08', NULL, 'Electo', 0),
(5, 8, 'Cabeza de Lista', 101, 650000000.00, '2025-12-08', NULL, 'Electo', 68900),
(6, 4, 'Cabeza de Lista', 1, 600000000.00, '2025-12-08', NULL, 'Electo', 0),
(6, 7, 'Integrante de Lista', 2, 600000000.00, '2025-12-08', NULL, 'No Electo', 0),
(7, 10, 'Titular Unico', 1, 5400000000.00, '2026-02-01', NULL, 'Vigente', 0),
(8, 11, 'Titular Unico', 1, 2950000000.00, '2026-02-01', NULL, 'Vigente', 0),
(9, 12, 'Titular Unico', 1, 2800000000.00, '2026-02-01', NULL, 'Vigente', 0),
(10, 13, 'Titular Unico', 1, 4100000000.00, '2026-02-01', NULL, 'Vigente', 0);

SELECT * FROM candidatura;

-- 14. CAMPANIA_ZONA (16 registros)
INSERT INTO campania_zona (id_campania, id_zona, fecha_apertura, estado_cobertura) VALUES
(1, 1, '2026-01-16', 'Activa Prioritaria'),
(1, 2, '2026-01-18', 'Activa Prioritaria'),
(1, 3, '2026-01-20', 'Activa'),
(1, 4, '2026-01-22', 'Activa'),
(2, 1, '2026-01-17', 'Activa Prioritaria'),
(2, 3, '2026-01-19', 'Activa Prioritaria'),
(2, 6, '2026-01-25', 'En Despliegue'),
(3, 1, '2025-12-10', 'Cerrada'),
(3, 7, '2025-12-12', 'Cerrada'),
(4, 1, '2025-12-10', 'Cerrada'),
(5, 1, '2025-12-11', 'Cerrada'),
(6, 2, '2025-12-11', 'Cerrada'),
(7, 1, '2026-02-02', 'Activa Prioritaria'),
(8, 2, '2026-02-02', 'Activa Prioritaria'),
(9, 3, '2026-02-03', 'Activa Prioritaria'),
(10, 5, '2026-02-03', 'Activa Prioritaria');
SELECT * FROM campania_zona;

-- 15. DONACION (15 registros: IDs 1 al 15)
INSERT INTO donacion (fecha_donacion, monto, id_tipo_aporte, id_medio_pago, numero_recibo_oficial, id_donante, id_campania) VALUES
('2026-01-20', 250000000.00, 2, 1, 'REC-CNE-2026-0001', 1, 1),
('2026-01-25', 85000000.00, 1, 2, 'REC-CNE-2026-0002', 2, 1),
('2026-01-28', 180000000.00, 2, 1, 'REC-CNE-2026-0003', 3, 2),
('2026-02-02', 45000000.00, 1, 3, 'REC-CNE-2026-0004', 4, 2),
('2026-01-10', 120000000.00, 2, 4, 'REC-CNE-2026-0005', 5, 3),
('2026-01-14', 60000000.00, 1, 1, 'REC-CNE-2026-0006', 6, 4),
('2026-01-18', 95000000.00, 3, 8, 'REC-CNE-2026-0007', 7, 5),
('2026-01-22', 110000000.00, 2, 1, 'REC-CNE-2026-0008', 3, 6),
('2026-02-10', 300000000.00, 2, 9, 'REC-CNE-2026-0009', 9, 7),
('2026-02-14', 75000000.00, 1, 2, 'REC-CNE-2026-0010', 2, 7),
('2026-02-18', 210000000.00, 2, 1, 'REC-CNE-2026-0011', 3, 8),
('2026-02-22', 55000000.00, 1, 5, 'REC-CNE-2026-0012', 10, 8),
('2026-02-25', 140000000.00, 2, 1, 'REC-CNE-2026-0013', 5, 9),
('2026-03-01', 68000000.00, 1, 2, 'REC-CNE-2026-0014', 8, 9),
('2026-03-05', 160000000.00, 2, 10, 'REC-CNE-2026-0015', 11, 10);
SELECT * FROM donacion;


-- 16. EQUIPO_CAMPANIA (32 registros: IDs 1..10 Jefes Comunicacion, 11..20 Auditores, 21..32 Coordinadores Territoriales)
INSERT INTO equipo_campania (documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo, telefono, fecha_vinculacion, id_campania) VALUES
-- IDs 1 al 10: Jefes de Comunicacion
('79100001', 'Daniel', 'Felipe', 'Samper', 'Ospina', 'daniel.samper@equipo.co', '3101000001', '2026-01-15', 1),
('79100002', 'Catalina', 'Maria', 'Gomez', 'Sanchez', 'catalina.gomez@equipo.co', '3101000002', '2026-01-15', 2),
('79100003', 'Ricardo', 'Jorge', 'Silva', 'Romero', 'ricardo.silva@equipo.co', '3101000003', '2025-12-08', 3),
('79100004', 'Marcela', 'Patricia', 'Alarcon', 'Vega', 'marcela.alarcon@equipo.co', '3101000004', '2025-12-08', 4),
('79100005', 'Esteban', 'Jose', 'Piedrahita', 'Uribe', 'esteban.piedrahita@equipo.co', '3101000005', '2025-12-08', 5),
('79100006', 'Juliana', 'Andrea', 'Correa', 'Botero', 'juliana.correa@equipo.co', '3101000006', '2025-12-08', 6),
('79100007', 'Felipe', 'Andres', 'Zuleta', 'Lleras', 'felipe.zuleta@equipo.co', '3101000007', '2026-02-01', 7),
('79100008', 'Veronica', 'Lucia', 'Orozco', 'Aristizabal', 'veronica.orozco@equipo.co', '3101000008', '2026-02-01', 8),
('79100009', 'Hernan', 'Dario', 'Pelaez', 'Restrepo', 'hernan.pelaez@equipo.co', '3101000009', '2026-02-01', 9),
('79100010', 'Silvia', 'Fernanda', 'Galvis', 'Serrano', 'silvia.galvis@equipo.co', '3101000010', '2026-02-01', 10),
-- IDs 11 al 20: Auditores Financieros 
('79200011', 'Hector', 'Julio', 'Pinzon', 'Monroy', 'hector.pinzon@auditoria.co', '3112000011', '2026-01-15', 1),
('79200012', 'Gloria', 'Amparo', 'Cardenas', 'Nieto', 'gloria.cardenas@auditoria.co', '3112000012', '2026-01-15', 2),
('79200013', 'Alvaro', 'Enrique', 'Becerra', 'Cruz', 'alvaro.becerra@auditoria.co', '3112000013', '2025-12-08', 3),
('79200014', 'Luz', 'Marina', 'Forero', 'Beltran', 'luz.forero@auditoria.co', '3112000014', '2025-12-08', 4),
('79200015', 'Edgar', 'Augusto', 'Villamizar', 'Roa', 'edgar.villamizar@auditoria.co', '3112000015', '2025-12-08', 5),
('79200016', 'Olga', 'Lucia', 'Tamayo', 'Zea', 'olga.tamayo@auditoria.co', '3112000016', '2025-12-08', 6),
('79200017', 'German', 'Eduardo', 'Pachon', 'Diaz', 'german.pachon@auditoria.co', '3112000017', '2026-02-01', 7),
('79200018', 'Beatriz', 'Elena', 'Arango', 'Mesa', 'beatriz.arango@auditoria.co', '3112000018', '2026-02-01', 8),
('79200019', 'Jaime', 'Alberto', 'Caicedo', 'Lourido', 'jaime.caicedo@auditoria.co', '3112000019', '2026-02-01', 9),
('79200020', 'Sonia', 'Esperanza', 'Rueda', 'Mantilla', 'sonia.rueda@auditoria.co', '3112000020', '2026-02-01', 10),
-- IDs 21 al 32: Coordinadores Territoriales
('79300021', 'Javier', 'Orlando', 'Triana', 'Camacho', 'javier.triana@territorio.co', '3123000021', '2026-01-16', 1),
('79300022', 'Monica', 'Alejandra', 'Betancur', 'Hincapie', 'monica.betancur@territorio.co', '3123000022', '2026-01-18', 1),
('79300023', 'Carlos', 'Humberto', 'Sinisterra', 'Mina', 'carlos.sinisterra@territorio.co', '3123000023', '2026-01-17', 2),
('79300024', 'Rafael', 'Antonio', 'Char', 'Abudinen', 'rafael.char@territorio.co', '3123000024', '2026-01-19', 2),
('79300025', 'Nelson', 'Enrique', 'Arenas', 'Prada', 'nelson.arenas@territorio.co', '3123000025', '2025-12-10', 3),
('79300026', 'Yolanda', 'Del Carmen', 'Perez', 'Cabarcas', 'yolanda.perez@territorio.co', '3123000026', '2025-12-10', 4),
('79300027', 'Diego', 'Fernando', 'Laserna', 'Arias', 'diego.laserna@territorio.co', '3123000027', '2025-12-11', 5),
('79300028', 'Juan', 'Camilo', 'Restrepo', 'Agudelo', 'juanc.restrepo@territorio.co', '3123000028', '2025-12-11', 6),
('79300029', 'Lina', 'Marcela', 'Giron', 'Zamorano', 'lina.giron@territorio.co', '3123000029', '2026-02-02', 7),
('79300030', 'William', 'Rene', 'Carvajal', 'Jaimes', 'william.carvajal@territorio.co', '3123000030', '2026-02-02', 8),
('79300031', 'Adriana', 'Lucia', 'Vallecilla', 'Hurtado', 'adriana.vallecilla@territorio.co', '3123000031', '2026-02-03', 9),
('79300032', 'Gustavo', 'Adolfo', 'Serrano', 'Pinilla', 'gustavo.serrano@territorio.co', '3123000032', '2026-02-03', 10);
SELECT * FROM equipo_campania;

-- =============================================================================
-- NIVEL 4: INSERCION EN SUBCLASES DE EQUIPO_CAMPANIA
-- =============================================================================

-- 17. JEFE_COMUNICACION (10 registros: IDs 1 al 10)
SELECT * FROM jefe_comunicacion;
INSERT INTO jefe_comunicacion (id_miembro, enfoque_principal, plataforma_gestion) VALUES
(1, 'Debates televisivos y relacionamiento con prensa nacional', 'Hootsuite Enterprise y Sala de Prensa CNE'),
(2, 'Movilizacion juvenil y narrativa ambiental en video corto', 'Meta Business Suite y TikTok Ads Manager'),
(3, 'Comunicacion regional en radio comunitaria y prensa escrita', 'HubSpot Marketing y Megafono Regional'),
(4, 'Activismo digital de base y transmisiones en vivo', 'StreamYard Pro y X Analytics'),
(5, 'Pauta programatica segmentada por localidades de Bogota', 'Google Ads 360 y Meta Business'),
(6, 'Voceria politica y foros empresariales departamentales', 'Sprout Social y CRM Electoral'),
(7, 'Pedagogia con datos abiertos y propuestas de movilidad urbana', 'Tableau Public y Meta Ads Manager'),
(8, 'Seguridad ciudadana y cercania barrial en comunas', 'WhatsApp Business API y Metricool'),
(9, 'Reconciliacion civica y cultura ciudadana calena', 'Buffer Pro y YouTube Studio'),
(10, 'Desarrollo empresarial y competitividad santandereana', 'LinkedIn Campaign Manager y Meta Suite');

-- 18. AUDITOR_FINANCIERO (10 registros: IDs 11 al 20)
SELECT * FROM auditor_financiero;
INSERT INTO auditor_financiero (id_miembro, tarjeta_profesional, registro_junta_central, fecha_resolucion_cne) VALUES
(11, 'TP-45101-T', 'JCC-REG-2018-0101', '2026-01-14'),
(12, 'TP-45102-T', 'JCC-REG-2019-0102', '2026-01-14'),
(13, 'TP-45103-T', 'JCC-REG-2017-0103', '2025-12-05'),
(14, 'TP-45104-T', 'JCC-REG-2020-0104', '2025-12-05'),
(15, 'TP-45105-T', 'JCC-REG-2021-0105', '2025-12-06'),
(16, 'TP-45106-T', 'JCC-REG-2016-0106', '2025-12-06'),
(17, 'TP-45107-T', 'JCC-REG-2022-0107', '2026-01-30'),
(18, 'TP-45108-T', 'JCC-REG-2019-0108', '2026-01-30'),
(19, 'TP-45109-T', 'JCC-REG-2018-0109', '2026-01-31'),
(20, 'TP-45110-T', 'JCC-REG-2023-0110', '2026-01-31');

-- 19. COORDINADOR_TERRITORIAL (12 registros: IDs 21 al 32, coincidiendo 1:1 con zona y campana)
SELECT * FROM coordinador_territorial;
INSERT INTO coordinador_territorial (id_miembro, id_zona, linea_emergencia, presupuesto_caja_menor) VALUES
(21, 1, '3159000021', 15000000.00),
(22, 2, '3159000022', 12000000.00),
(23, 1, '3159000023', 14000000.00),
(24, 3, '3159000024', 10000000.00),
(25, 7, '3159000025', 8000000.00),
(26, 1, '3159000026', 9500000.00),
(27, 1, '3159000027', 9000000.00),
(28, 2, '3159000028', 11000000.00),
(29, 1, '3159000029', 14000000.00),
(30, 2, '3159000030', 11500000.00),
(31, 3, '3159000031', 10500000.00),
(32, 5, '3159000032', 9000000.00);

-- =============================================================================
-- NIVEL 5: INSERCION EN TABLA EVENTO
-- =============================================================================

-- 20. EVENTO (15 registros: IDs 1 al 15; cada coordinador pertenece a la misma campana y zona del evento)
SELECT * FROM evento;
INSERT INTO evento (nombre_evento, tipo_evento, fecha_evento, hora_evento, lugar_evento, aforo_estimado, id_campania, id_zona, id_coordinador_territorial) VALUES
('Gran Lanzamiento Presidencial Plaza de Bolivar', 'Mitin Masivo', '2026-02-10', '16:00:00', 'Plaza de Bolivar Carrera 7 # 11-10', 12000, 1, 1, 21),
('Encuentro Ciudadano por la Industria Antioquena', 'Foro Programatico', '2026-02-18', '18:00:00', 'Centro de Convenciones Plaza Mayor', 3500, 1, 2, 22),
('Cumbre Ambiental y de Juventudes Bogota', 'Conversatorio', '2026-02-22', '10:00:00', 'Parque de los Novios Calle 63', 2800, 2, 1, 23),
('Caravana por el Pacifico y Empleo Joven', 'Recorrido Territorial', '2026-02-26', '14:00:00', 'Bulevar del Rio Cali', 4200, 2, 3, 24),
('Cierre de Campana Senado Liberal Eje Cafetero', 'Acto Politico', '2026-03-01', '17:00:00', 'Plaza de Bolivar de Pereira', 5000, 3, 7, 25),
('Asamblea Popular de Movimientos Sociales', 'Cabildo Abierto', '2026-03-01', '15:00:00', 'Plazoleta de San Francisco Bogota', 6000, 4, 1, 26),
('Foro Transparencia y Control Politico en el Congreso', 'Debate Academico', '2026-02-28', '09:00:00', 'Auditorio Chapinero Central Bogota', 850, 5, 1, 27),
('Encuentro de Seguridad y Gremios de Antioquia', 'Desayuno Empresarial', '2026-03-01', '08:00:00', 'Hotel Intercontinental Medellin', 600, 6, 2, 28),
('Dialogo Ciudadano por la Movilidad de Suba y Usaquen', 'Reunion Comunitaria', '2026-03-14', '11:00:00', 'Parque Fundacional de Suba', 1900, 7, 1, 29),
('Jornada de Escucha Ciudadana Kennedy y Bosa', 'Recorrido Barrial', '2026-03-21', '09:30:00', 'Plazoleta Las Americas Bogota', 2400, 7, 1, 29),
('Gran Encuentro por la Seguridad de Medellin', 'Mitin Urbano', '2026-03-28', '16:30:00', 'Parque de las Luces La Alpujarra', 7500, 8, 2, 30),
('Foro de Recuperacion Economica y Empleo para Cali', 'Foro Ciudadano', '2026-04-04', '17:00:00', 'Centro de Eventos Valle del Pacifico', 3200, 9, 3, 31),
('Encuentro Empresarial del Oriente Colombiano', 'Cumbre Regional', '2026-04-11', '18:00:00', 'Centro de Ferias Cenfer Bucaramanga', 2600, 10, 5, 32),
('Encuentro Cultural y Deportivo por Cali', 'Actividad Pedagogica', '2026-04-18', '08:30:00', 'Unidad Deportiva Panamericana Cali', 1500, 9, 3, 31),
('Capacitacion General de Testigos Electorales Bogota', 'Jornada de Formacion', '2026-04-22', '09:00:00', 'Centro de Convenciones Agora Bogota', 1200, 1, 1, 21);

-- =============================================================================
-- NIVEL 6: INSERCION EN PARTICIPACION, CONTRATO Y GASTO
-- =============================================================================

-- 21. PARTICIPACION (15 registros: IDs 1 al 15)
SELECT * FROM participacion;
INSERT INTO participacion (id_voluntario, id_evento, rol_asignado, hora_aportada, estado_asistencia) VALUES
(1, 1, 'Coordinador de Logistica de Acceso', 8.50, 'Asistio'),
(2, 1, 'Registro Digital de Asistentes', 6.00, 'Asistio'),
(3, 2, 'Soporte Tecnico y Transmision Streaming', 7.50, 'Asistio'),
(4, 3, 'Manejo de Redes Sociales en Vivo', 5.00, 'Asistio'),
(5, 3, 'Fotografia y Cubrimiento Visual', 6.50, 'Asistio'),
(6, 4, 'Relatora de Mesas Programaticas', 8.00, 'Asistio'),
(7, 5, 'Verificacion Juridica de Publicidad', 4.50, 'Asistio'),
(8, 6, 'Atencion a Delegaciones Comunitarias', 9.00, 'Asistio'),
(9, 7, 'Moderacion de Preguntas del Publico', 4.00, 'Asistio'),
(10, 9, 'Produccion Audiovisual de Terreno', 7.00, 'Asistio'),
(11, 10, 'Avanzada Barrial y Perifoneo', 8.00, 'Asistio'),
(12, 11, 'Acompanamiento a Voluntariado Juvenil', 6.50, 'Asistio'),
(13, 12, 'Logistica de Tarima y Protocolo', 7.00, 'Asistio'),
(14, 13, 'Entrega de Material Pedagogico', 5.50, 'Justificado'),
(15, 15, 'Capacitador de Formulario E-14', 8.00, 'Asistio');

-- 22. CONTRATO (15 registros)
SELECT * FROM contrato;
INSERT INTO contrato (id_evento, id_proveedor, fecha_contrato, descripcion_servicio, costo_pactado, estado_contrato, hora_instalacion) VALUES
(1, 2, '2026-02-01', 'Alquiler de tarima principal, sonido line array y pantallas LED', 68000000.00, 'Ejecutado', '06:00:00'),
(1, 9, '2026-02-02', 'Esquema de logistica, vallas de contencion y personal de filtro', 22000000.00, 'Ejecutado', '07:00:00'),
(2, 7, '2026-02-08', 'Alquiler de Gran Salon Plaza Mayor con ayudas audiovisuales', 35000000.00, 'Ejecutado', '12:00:00'),
(3, 5, '2026-02-14', 'Suministro de 2800 puntos de hidratacion y refrigerios', 18500000.00, 'Ejecutado', '08:00:00'),
(4, 4, '2026-02-18', 'Servicio de 18 buses especiales para movilizacion de comitivas', 29000000.00, 'Ejecutado', '11:00:00'),
(5, 1, '2026-02-20', 'Impresion de 50000 volantes programaticos y pendones de cierre', 16400000.00, 'Ejecutado', '09:00:00'),
(6, 2, '2026-02-22', 'Montaje de sonido profesional y generador electrico en plazoleta', 31000000.00, 'Ejecutado', '07:30:00'),
(7, 5, '2026-02-21', 'Estacion de cafe y refrigerios para foro academico', 8200000.00, 'Ejecutado', '07:30:00'),
(8, 3, '2026-02-23', 'Transmision multicamara y pauta digital del encuentro gremial', 14500000.00, 'Ejecutado', '06:30:00'),
(9, 11, '2026-03-05', 'Dotacion de 800 camisetas, gorras y rompetraficos para voluntarios', 19800000.00, 'Ejecutado', '08:00:00'),
(10, 4, '2026-03-12', 'Transporte logistico de equipos y brigadas por localidades', 12600000.00, 'Ejecutado', '07:00:00'),
(11, 7, '2026-03-18', 'Produccion integral de mitin urbano en La Alpujarra', 48000000.00, 'Ejecutado', '08:00:00'),
(12, 6, '2026-03-25', 'Instalacion de 12 vallas exteriores de convocatoria en Cali', 42000000.00, 'Ejecutado', '06:00:00'),
(13, 9, '2026-04-01', 'Dispositivo de control de acceso y logistica en Cenfer', 15400000.00, 'Ejecutado', '13:00:00'),
(15, 1, '2026-04-15', 'Impresion de 1500 cartillas de capacitacion para testigos electorales', 11200000.00, 'Ejecutado', '07:30:00');

-- 23. GASTO (15 registros: IDs 1 al 15; conciliados 1:1 con contratos, vigencias de campana y auditores de su misma campana)
SELECT * FROM gasto;
INSERT INTO gasto (numero_factura, fecha_gasto, id_categoria_gasto, monto, descripcion, id_proveedor, id_campania, id_candidatura, id_evento, id_auditor) VALUES
('FE-PRO-2026-001', '2026-02-11', 2, 68000000.00, 'Pago de produccion de tarima y sonido para lanzamiento presidencial en Bogota', 2, 1, 1, 1, 11),
('FE-SEG-2026-002', '2026-02-14', 2, 22000000.00, 'Servicio de logistica y filtro de seguridad evento Plaza de Bolivar', 9, 1, 1, 1, 11),
('FE-PLM-2026-003', '2026-02-19', 2, 35000000.00, 'Alquiler de auditorio y pantallas en Plaza Mayor Medellin', 7, 1, 2, 2, 11),
('FE-GOU-2026-004', '2026-02-23', 2, 18500000.00, 'Hidratacion y refrigerios para cumbre ambiental en Bogota', 5, 2, 4, 3, 12),
('FE-CON-2026-005', '2026-02-27', 3, 29000000.00, 'Transporte terrestre de delegaciones en recorrido por el Valle', 4, 2, 5, 4, 12),
('FE-LIT-2026-006', '2026-03-02', 6, 16400000.00, 'Impresion de plegables y pendones para cierre de campana al Senado', 1, 3, 6, 5, 13),
('FE-PRO-2026-007', '2026-03-02', 2, 31000000.00, 'Sonido y planta electrica para cabildo abierto en Bogota', 2, 4, 8, 6, 14),
('FE-GOU-2026-008', '2026-03-01', 2, 8200000.00, 'Estacion de cafe y refrigerios para foro academico en Chapinero', 5, 5, 10, 7, 15),
('FE-EST-2026-009', '2026-03-02', 9, 14500000.00, 'Transmision multicamara y pauta digital del encuentro gremial en Medellin', 3, 6, 11, 8, 16),
('FE-TEX-2026-010', '2026-03-16', 6, 19800000.00, 'Dotacion de camisetas, gorras y rompetraficos para dialogo en Suba', 11, 7, 13, 9, 17),
('FE-CON-2026-011', '2026-03-23', 3, 12600000.00, 'Transporte logistico de equipos y brigadas por localidades de Bogota', 4, 7, 13, 10, 17),
('FE-PLM-2026-012', '2026-03-30', 2, 48000000.00, 'Montaje integral de evento masivo en Parque de las Luces Medellin', 7, 8, 14, 11, 18),
('FE-VIS-2026-013', '2026-04-06', 1, 42000000.00, 'Instalacion de 12 vallas exteriores de convocatoria para foro en Cali', 6, 9, 15, 12, 19),
('FE-SEG-2026-014', '2026-04-12', 2, 15400000.00, 'Dispositivo de control de acceso y logistica en Cenfer Bucaramanga', 9, 10, 16, 13, 20),
('FE-LIT-2026-015', '2026-04-23', 8, 11200000.00, 'Impresion de 1500 cartillas de capacitacion para testigos electorales', 1, 1, 3, 15, 11);

-- =============================================================================
-- NIVEL 7: INSERCION EN SOPORTE_CONTABLE
-- =============================================================================

-- 24. SOPORTE_CONTABLE (15 registros: respaldando el 100% de cada factura de gasto)
SELECT * FROM soporte_contable;
INSERT INTO soporte_contable (id_gasto, id_soporte, valor_respaldado) VALUES
(1, 1, 68000000.00),
(2, 2, 22000000.00),
(3, 3, 35000000.00),
(4, 4, 18500000.00),
(5, 5, 29000000.00),
(6, 6, 16400000.00),
(7, 7, 31000000.00),
(8, 8, 8200000.00),
(9, 9, 14500000.00),
(10, 10, 19800000.00),
(11, 11, 12600000.00),
(12, 12, 48000000.00),
(13, 13, 42000000.00),
(14, 14, 15400000.00),
(15, 15, 11200000.00);

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE gasto;
TRUNCATE TABLE soporte_contable;
SET FOREIGN_KEY_CHECKS = 1;




