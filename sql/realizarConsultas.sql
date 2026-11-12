
USE campana_politica;

-- =============================================================================
-- SECCION 12: CONSULTAS SQL PARA EL ANALISIS Y TOMA DE DECISIONES
-- Estructura progresiva de menor a mayor dificultad (Niveles 1 al 5), cubriendo
-- todas las instrucciones exigidas en la guia (SELECT, WHERE, ORDER BY, JOIN,
-- GROUP BY) y todas las consultas criticas de operacion real de eventos y
-- auditoria electoral (CNE).
-- =============================================================================


-- =============================================================================
-- NIVEL 1 (BASICO): CONSULTAS CON SELECT Y WHERE (FILTRADO SIMPLE POR TABLA)
-- =============================================================================

-- Consulta 1.1 [Tabla: campania]
-- Objetivo: Consultar las campanas electorales que se encuentran actualmente 'En Ejecucion'.
SELECT
    id_campania,
    codigo_cne,
    nombre_campania,
    fecha_inicio,
    fecha_fin,
    tope_gasto_global,
    estado_campania
FROM campania
WHERE estado_campania = 'En Ejecucion';

-- Consulta 1.2 [Tabla: donante]
-- Objetivo: Listar los donantes registrados como 'Persona Juridica' domiciliados en 'Bogota D.C.'.
SELECT
    id_donante,
    documento_o_nit,
    nombre_o_razon_social,
    tipo_persona,
    telefono,
    correo_electronico,
    direccion,
    barrio
FROM donante
WHERE tipo_persona = 'Persona Juridica'
  AND municipio = 'Bogota D.C.';

-- Consulta 1.3 [Tabla: candidatura]
-- Objetivo: Identificar las postulaciones de candidatos que renunciaron durante la campana
--           (verificando trazabilidad historica con fecha_retiro no nula).
SELECT
    id_candidatura,
    id_campania,
    id_candidato,
    rol_en_campania,
    fecha_inscripcion,
    fecha_retiro,
    estado_postulacion
FROM candidatura
WHERE fecha_retiro IS NOT NULL
   OR estado_postulacion = 'Renuncio';

-- Consulta 1.4 [Tabla: voluntario]
-- Objetivo: Consultar los voluntarios nacidos a partir del ano 2000 y calcular su edad
--           (atributo derivado en el MER que se calcula dinamicamente en SQL).
SELECT
    id_voluntario,
    documento,
    CONCAT(primer_nombre, ' ', primer_apellido) AS nombre_voluntario,
    fecha_nacimiento,
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad_calculada,
    ocupacion,
    correo
FROM voluntario
WHERE fecha_nacimiento >= '2000-01-01';


-- =============================================================================
-- NIVEL 2 (INTERMEDIO): CONSULTAS CON SELECT + WHERE + ORDER BY
-- =============================================================================

-- Consulta 2.1 [Tabla: zona]
-- Objetivo: Ordenar las zonas electorales de mayor a menor potencial de votantes (censo_electoral)
--           para aquellas zonas que superen los 400.000 ciudadanos habilitados.
SELECT
    id_zona,
    codigo_dane,
    nombre_municipio,
    departamento,
    censo_electoral
FROM zona
WHERE censo_electoral > 400000
ORDER BY censo_electoral DESC;

-- Consulta 2.2 [Tabla: evento]
-- Objetivo: Listar el cronograma de eventos masivos o foros con un aforo estimado de al menos
--           2.000 personas, ordenados cronologicamente por fecha y hora de inicio.
SELECT
    id_evento,
    nombre_evento,
    tipo_evento,
    fecha_evento,
    hora_evento,
    lugar_evento,
    aforo_estimado
FROM evento
WHERE aforo_estimado >= 2000
ORDER BY fecha_evento ASC, hora_evento ASC;

-- Consulta 2.3 [Tabla: contrato]
-- Objetivo: Consultar los contratos de servicios logisticos cuyo costo pactado sea igual o
--           superior a $20.000.000, ordenados del mas costoso al menos costoso.
SELECT
    id_evento,
    id_proveedor,
    fecha_contrato,
    descripcion_servicio,
    costo_pactado,
    estado_contrato,
    hora_instalacion
FROM contrato
WHERE costo_pactado >= 20000000.00
ORDER BY costo_pactado DESC;


-- =============================================================================
-- NIVEL 3 (INTERMEDIO - AVANZADO): CONSULTAS MULTITABLA CON JOIN + WHERE + ORDER BY
-- =============================================================================

-- Consulta 3.1 [Tablas: campania + partido_politico + corporacion]
-- Objetivo: Mostrar la ficha institucional completa de cada campana junto con el partido politico
--           que otorga el aval y la corporacion/modalidad de eleccion definida en 3FN.
SELECT
    c.codigo_cne,
    c.nombre_campania,
    p.nombre_partido,
    p.sigla AS sigla_partido,
    co.nombre_corporacion,
    co.modalidad_eleccion,
    co.tipo_circunscripcion,
    c.tope_gasto_global,
    c.estado_campania
FROM campania c
INNER JOIN partido_politico p ON c.id_partido = p.id_partido
INNER JOIN corporacion co ON c.id_corporacion = co.id_corporacion
ORDER BY c.tope_gasto_global DESC;

-- Consulta 3.2 [Tablas: candidatura + candidato + campania + corporacion]
-- Objetivo: Consultar el detalle de todos los candidatos inscritos en cada campana (incluyendo
--           formulas presidenciales, listas de Congreso y titulares uninominales), su numero
--           en el tarjeton, su cupo individual de gasto y votos obtenidos.
SELECT
    ca.nombre_campania,
    co.modalidad_eleccion,
    CONCAT(cd.primer_nombre, ' ', cd.primer_apellido, ' ', cd.segundo_apellido) AS nombre_candidato,
    cd.profesion,
    ct.rol_en_campania,
    ct.numero_tarjeton,
    ct.tope_gasto_individual,
    ct.estado_postulacion,
    ct.voto_individual
FROM candidatura ct
INNER JOIN candidato cd ON ct.id_candidato = cd.id_candidato
INNER JOIN campania ca ON ct.id_campania = ca.id_campania
INNER JOIN corporacion co ON ca.id_corporacion = co.id_corporacion
ORDER BY ca.id_campania ASC, ct.numero_tarjeton ASC;

-- Consulta 3.4 [Tablas: donacion + donante + campania + tipo_aporte + medio_pago]
-- Objetivo: Generar el libro oficial de ingresos y donaciones con la identificacion del donante,
--           la campana beneficiaria, la modalidad del aporte y el medio de pago utilizado.
SELECT
    d.numero_recibo_oficial,
    d.fecha_donacion,
    dn.documento_o_nit,
    dn.nombre_o_razon_social AS donante,
    dn.tipo_persona,
    c.nombre_campania,
    ta.nombre_tipo_aporte,
    mp.nombre_medio_pago,
    d.monto
FROM donacion d
INNER JOIN donante dn ON d.id_donante = dn.id_donante
INNER JOIN campania c ON d.id_campania = c.id_campania
INNER JOIN tipo_aporte ta ON d.id_tipo_aporte = ta.id_tipo_aporte
INNER JOIN medio_pago mp ON d.id_medio_pago = mp.id_medio_pago
ORDER BY d.monto DESC;

-- =============================================================================
-- NIVEL 4 (AVANZADO): CONSULTAS ANALITICAS CON GROUP BY, FUNCIONES DE AGREGACION,
--                     HAVING, JOIN Y ORDER BY (APOYO A TOMA DE DECISIONES)
-- =============================================================================

-- Consulta 4.1.A [Calculo del Atributo Derivado total_recaudado en campania]
-- Objetivo: Obtener el valor total recaudado por cada campana sumando sus donaciones.
SELECT 
    c.id_campania,
    c.codigo_cne,
    c.nombre_campania,
    c.tope_gasto_global,
    COUNT(d.id_donacion) AS cantidad_donaciones,
    SUM(d.monto) AS total_recaudado
FROM campania c
INNER JOIN donacion d ON c.id_campania = d.id_campania
GROUP BY 
    c.id_campania, 
    c.codigo_cne, 
    c.nombre_campania, 
    c.tope_gasto_global
ORDER BY total_recaudado DESC;

-- Consulta 4.1.B [Calculo del Atributo Derivado total_gastado en campania]
-- Objetivo: Obtener el valor total gastado por cada campana sumando sus gastos.
SELECT 
    c.id_campania,
    c.codigo_cne,
    c.nombre_campania,
    c.tope_gasto_global,
    COUNT(g.id_gasto) AS cantidad_facturas,
    SUM(g.monto) AS total_gastado
FROM campania c
INNER JOIN gasto g ON c.id_campania = g.id_campania
GROUP BY 
    c.id_campania, 
    c.codigo_cne, 
    c.nombre_campania, 
    c.tope_gasto_global
ORDER BY total_gastado DESC;


-- Consulta 4.2 [Analisis de Gastos por Categoria Oficial del CNE]
-- Objetivo: Agrupar los gastos por categoria (rubro del CNE) para conocer cuantos gastos se han
--           realizado en cada rubro, el monto total ejecutado y el gasto promedio por factura.
SELECT
    cg.id_categoria_gasto,
    cg.nombre_categoria,
    COUNT(g.id_gasto) AS cantidad_facturas,
    SUM(g.monto) AS total_ejecutado_rubro,
    ROUND(AVG(g.monto), 2) AS promedio_por_factura,
    MAX(g.monto) AS factura_mas_alta
FROM categoria_gasto cg
INNER JOIN gasto g ON cg.id_categoria_gasto = g.id_categoria_gasto
GROUP BY cg.id_categoria_gasto, cg.nombre_categoria
ORDER BY total_ejecutado_rubro DESC;



-- Consulta 4.5 [Volumen de Contratacion por Proveedor con filtro HAVING]
-- Objetivo: Identificar los proveedores estrategicos con mayor volumen de contratacion
--           cuyo monto total acumulado supere o iguale los $30.000.000 (demostrando HAVING).
SELECT
    pr.id_proveedor,
    pr.documento_o_nit,
    pr.razon_social,
    pr.tipo_servicio,
    COUNT(co.id_evento) AS eventos_contratados,
    SUM(co.costo_pactado) AS total_contratado_eventos
FROM proveedor pr
INNER JOIN contrato co ON pr.id_proveedor = co.id_proveedor
GROUP BY pr.id_proveedor, pr.documento_o_nit, pr.razon_social, pr.tipo_servicio
HAVING total_contratado_eventos >= 30000000.00
ORDER BY total_contratado_eventos DESC;


-- =============================================================================
-- NIVEL 5 (CASOS CRITICOS DE LA VIDA REAL): OPERACION 360 DE EVENTOS Y AUDITORIA
-- =============================================================================

-- Consulta 5.3 [Cronograma Minuto a Minuto de Montaje Logistico para el Dia del Evento]
-- Objetivo: Herramienta operativa para el coordinador territorial el dia del evento: muestra
--           cada proveedor contratado, su telefono de emergencia, a que hora instala, a que
--           hora inicia el evento y cuantas horas de margen hay entre el montaje y el inicio.
SELECT
    e.fecha_evento,
    e.nombre_evento,
    e.lugar_evento,
    co.hora_instalacion,
    e.hora_evento AS hora_inicio_evento,
    TIMEDIFF(e.hora_evento, co.hora_instalacion) AS margen_montaje_previo,
    pr.razon_social AS proveedor_logistico,
    pr.tipo_servicio,
    pr.telefono AS telefono_proveedor,
    co.descripcion_servicio,
    co.estado_contrato
FROM contrato co
INNER JOIN evento e ON co.id_evento = e.id_evento
INNER JOIN proveedor pr ON co.id_proveedor = pr.id_proveedor
ORDER BY e.fecha_evento ASC, co.hora_instalacion ASC;


-- Consulta 5.5 [Auditoria de Conformidad Temporal CNE: Gastos vs. Vigencia de Campana y Retiro de Candidatos]
-- Objetivo: Verificar en una auditoria real que ningun gasto de evento o campana se haya
--           realizado fuera de las fechas legales de la campana (fecha_inicio a fecha_fin)
--           ni despues de la fecha_retiro de un candidato que haya renunciado.
SELECT
    g.id_gasto,
    g.numero_factura,
    g.fecha_gasto,
    ca.nombre_campania,
    ca.fecha_inicio AS inicio_legal_campana,
    ca.fecha_fin AS fin_legal_campana,
    CONCAT(cd.primer_nombre, ' ', cd.primer_apellido) AS candidato_imputado,
    ct.estado_postulacion,
    ct.fecha_retiro,
    g.monto,
    CASE
        WHEN g.fecha_gasto < ca.fecha_inicio OR g.fecha_gasto > ca.fecha_fin THEN 'ALERTA: FUERA DE PERIODO DE CAMPANA'
        WHEN ct.fecha_retiro IS NOT NULL AND g.fecha_gasto > ct.fecha_retiro THEN 'ALERTA: GASTO POSTERIOR A RENUNCIA'
        ELSE 'CONFORME NORMATIVA CNE'
    END AS dictamen_auditoria_temporal
FROM gasto g
INNER JOIN campania ca ON g.id_campania = ca.id_campania
LEFT JOIN candidatura ct ON g.id_candidatura = ct.id_candidatura
LEFT JOIN candidato cd ON ct.id_candidato = cd.id_candidato
ORDER BY g.fecha_gasto ASC;

