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

-- Consulta 2.4 [Tabla: soporte]
-- Objetivo: Consultar las facturas electronicas DIAN radicadas ante Cuentas Claras del CNE
--           durante el primer trimestre de 2026, ordenadas por fecha de radicacion.
SELECT
    id_soporte,
    numero_radicado_cne,
    tipo_comprobante,
    fecha_radicado,
    url_archivo_soporte
FROM soporte
WHERE tipo_comprobante = 'Factura Electronica DIAN'
  AND fecha_radicado BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY fecha_radicado ASC;


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

-- Consulta 3.3 [Tablas: equipo_campania + Subclases (jefe_comunicacion, auditor_financiero, coordinador_territorial) + campania + zona]
-- Objetivo: Demostrar la Especializacion Disjunta y Total del personal de campana, mostrando
--           a cada miembro con su rol especializado y sus credenciales o zona asignada.
SELECT
    ec.id_miembro,
    CONCAT(ec.primer_nombre, ' ', ec.primer_apellido) AS integrante_equipo,
    c.nombre_campania,
    CASE
        WHEN jc.id_miembro IS NOT NULL THEN 'Jefe de Comunicacion'
        WHEN af.id_miembro IS NOT NULL THEN 'Auditor Financiero'
        WHEN ct.id_miembro IS NOT NULL THEN 'Coordinador Territorial'
    END AS rol_especializado,
    COALESCE(
        jc.plataforma_gestion,
        CONCAT('TP: ', af.tarjeta_profesional, ' / ', af.registro_junta_central),
        CONCAT('Zona: ', z.nombre_municipio, ' (Caja menor: $', FORMAT(ct.presupuesto_caja_menor, 0), ')')
    ) AS detalle_especializacion
FROM equipo_campania ec
INNER JOIN campania c ON ec.id_campania = c.id_campania
LEFT JOIN jefe_comunicacion jc ON ec.id_miembro = jc.id_miembro
LEFT JOIN auditor_financiero af ON ec.id_miembro = af.id_miembro
LEFT JOIN coordinador_territorial ct ON ec.id_miembro = ct.id_miembro
LEFT JOIN zona z ON ct.id_zona = z.id_zona
ORDER BY ec.id_miembro ASC;

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

-- Consulta 3.5 [Tablas: gasto + proveedor + categoria_gasto + soporte_contable + soporte + auditor_financiero + equipo_campania]
-- Objetivo: Materializar la Agregacion de Auditoria CNE: trazabilidad completa desde la factura
--           del proveedor y el gasto hasta el soporte contable radicado y el auditor que lo firmo.
SELECT
    g.numero_factura,
    g.fecha_gasto,
    pr.razon_social AS proveedor,
    cg.nombre_categoria AS rubro_cne,
    g.monto AS monto_gasto,
    sc.valor_respaldado,
    s.numero_radicado_cne,
    s.tipo_comprobante,
    CONCAT(ec.primer_nombre, ' ', ec.primer_apellido) AS auditor_responsable,
    af.tarjeta_profesional
FROM gasto g
INNER JOIN proveedor pr ON g.id_proveedor = pr.id_proveedor
INNER JOIN categoria_gasto cg ON g.id_categoria_gasto = cg.id_categoria_gasto
INNER JOIN soporte_contable sc ON g.id_gasto = sc.id_gasto
INNER JOIN soporte s ON sc.id_soporte = s.id_soporte
INNER JOIN auditor_financiero af ON g.id_auditor = af.id_miembro
INNER JOIN equipo_campania ec ON af.id_miembro = ec.id_miembro
ORDER BY g.fecha_gasto ASC;


-- =============================================================================
-- NIVEL 4 (AVANZADO): CONSULTAS ANALITICAS CON GROUP BY, FUNCIONES DE AGREGACION,
--                     HAVING, JOIN Y ORDER BY (APOYO A TOMA DE DECISIONES)
-- =============================================================================

-- Consulta 4.1 [Consolidado Financiero por Campana: Atributos Derivados total_recaudado y total_gastado]
-- Objetivo: Calcular para cada campana sus dos atributos derivados (total_recaudado y total_gastado),
--           el saldo disponible en cuenta unica y el porcentaje de ejecucion frente al tope legal CNE.
SELECT
    c.id_campania,
    c.codigo_cne,
    c.nombre_campania,
    c.tope_gasto_global,
    COALESCE(ing.total_recaudado, 0.00) AS total_recaudado_derivado,
    COALESCE(egr.total_gastado, 0.00) AS total_gastado_derivado,
    (COALESCE(ing.total_recaudado, 0.00) - COALESCE(egr.total_gastado, 0.00)) AS balance_neto_campana,
    ROUND((COALESCE(egr.total_gastado, 0.00) * 100.0) / c.tope_gasto_global, 4) AS porcentaje_tope_usado
FROM campania c
LEFT JOIN (
    SELECT id_campania, SUM(monto) AS total_recaudado
    FROM donacion
    GROUP BY id_campania
) ing ON c.id_campania = ing.id_campania
LEFT JOIN (
    SELECT id_campania, SUM(monto) AS total_gastado
    FROM gasto
    GROUP BY id_campania
) egr ON c.id_campania = egr.id_campania
ORDER BY total_recaudado_derivado DESC;

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

-- Consulta 4.3 [Control de Topes Individuales por Candidatura]
-- Objetivo: Evaluar cuanto dinero ha ejecutado cada candidato inscrito frente a su
--           tope_gasto_individual asignado y el cupo restante disponible.
SELECT
    ct.id_candidatura,
    CONCAT(cd.primer_nombre, ' ', cd.primer_apellido) AS candidato,
    ca.nombre_campania,
    ct.rol_en_campania,
    ct.tope_gasto_individual,
    COUNT(g.id_gasto) AS numero_gastos_imputados,
    COALESCE(SUM(g.monto), 0.00) AS total_gastado_candidato,
    (ct.tope_gasto_individual - COALESCE(SUM(g.monto), 0.00)) AS cupo_disponible
FROM candidatura ct
INNER JOIN candidato cd ON ct.id_candidato = cd.id_candidato
INNER JOIN campania ca ON ct.id_campania = ca.id_campania
LEFT JOIN gasto g ON ct.id_candidatura = g.id_candidatura
GROUP BY
    ct.id_candidatura,
    cd.primer_nombre,
    cd.primer_apellido,
    ca.nombre_campania,
    ct.rol_en_campania,
    ct.tope_gasto_individual
HAVING total_gastado_candidato > 0
ORDER BY total_gastado_candidato DESC;

-- Consulta 4.4 [Desempeno Territorial y Movilizacion de Voluntariado por Zona]
-- Objetivo: Medir de forma exacta por cada municipio cuantos eventos se han realizado,
--           el aforo total convocado (sin duplicar por multiples voluntarios), la cantidad
--           de participaciones registradas y el total de horas de voluntariado.
SELECT
    z.codigo_dane,
    z.nombre_municipio,
    z.departamento,
    ev_z.total_eventos_realizados,
    ev_z.aforo_total_convocado,
    COALESCE(vol_z.voluntariados_registrados, 0) AS voluntariados_registrados,
    COALESCE(vol_z.total_horas_voluntariado, 0.00) AS total_horas_voluntariado
FROM zona z
INNER JOIN (
    SELECT
        id_zona,
        COUNT(id_evento) AS total_eventos_realizados,
        SUM(aforo_estimado) AS aforo_total_convocado
    FROM evento
    GROUP BY id_zona
) ev_z ON z.id_zona = ev_z.id_zona
LEFT JOIN (
    SELECT
        e.id_zona,
        COUNT(p.id_participacion) AS voluntariados_registrados,
        SUM(p.hora_aportada) AS total_horas_voluntariado
    FROM evento e
    INNER JOIN participacion p ON e.id_evento = p.id_evento
    GROUP BY e.id_zona
) vol_z ON z.id_zona = vol_z.id_zona
ORDER BY total_horas_voluntariado DESC, aforo_total_convocado DESC;

-- Consulta 4.5 [Volumen de Contratacion por Proveedor]
-- Objetivo: Identificar los proveedores con mayor volumen de contratacion en eventos.
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
ORDER BY total_contratado_eventos DESC;

-- Consulta 4.6 [Carga de Trabajo y Responsabilidad Fiscal por Auditor Financiero]
-- Objetivo: Analizar cuantos gastos y que monto total ha auditado y validado cada contador
--           acreditado ante el CNE, verificando que el valor respaldado en soportes cubra el 100%.
SELECT
    af.id_miembro AS id_auditor,
    CONCAT(ec.primer_nombre, ' ', ec.primer_apellido) AS auditor_financiero,
    af.tarjeta_profesional,
    ca.nombre_campania,
    COUNT(g.id_gasto) AS gastos_auditados,
    SUM(g.monto) AS monto_total_auditado,
    SUM(sc.valor_respaldado) AS monto_total_respaldado_cne
FROM auditor_financiero af
INNER JOIN equipo_campania ec ON af.id_miembro = ec.id_miembro
INNER JOIN campania ca ON ec.id_campania = ca.id_campania
INNER JOIN gasto g ON af.id_miembro = g.id_auditor
INNER JOIN soporte_contable sc ON g.id_gasto = sc.id_gasto
GROUP BY
    af.id_miembro,
    ec.primer_nombre,
    ec.primer_apellido,
    af.tarjeta_profesional,
    ca.nombre_campania
ORDER BY monto_total_auditado DESC;


-- =============================================================================
-- NIVEL 5 (CASOS CRITICOS DE LA VIDA REAL): OPERACION 360 DE EVENTOS Y AUDITORIA
-- =============================================================================

-- Consulta 5.1 [Tablero Operativo 360 de un Evento de Campana en la Vida Real]
-- Objetivo: Consolidar para cada evento toda su informacion gerencial: campana, municipio,
--           coordinador territorial a cargo y su linea de emergencia, numero de proveedores
--           contratados, primera hora de instalacion, voluntarios efectivos, costo total
--           facturado y costo promedio por asistente convocado.
SELECT
    e.id_evento,
    e.nombre_evento,
    e.tipo_evento,
    e.fecha_evento,
    e.hora_evento,
    z.nombre_municipio AS ciudad,
    ca.nombre_campania,
    CONCAT(ec.primer_nombre, ' ', ec.primer_apellido) AS coordinador_responsable,
    ct.linea_emergencia,
    e.aforo_estimado,
    COALESCE(con.proveedores_contratados, 0) AS proveedores_contratados,
    con.primera_hora_montaje,
    COALESCE(vol.voluntarios_asistentes, 0) AS voluntarios_asistentes,
    COALESCE(vol.horas_voluntariado, 0.00) AS horas_voluntariado,
    COALESCE(gas.total_facturado_evento, 0.00) AS total_facturado_evento,
    ROUND((COALESCE(gas.total_facturado_evento, 0.00) * 1.0) / NULLIF(e.aforo_estimado, 0), 2) AS costo_por_asistente
FROM evento e
INNER JOIN zona z ON e.id_zona = z.id_zona
INNER JOIN campania ca ON e.id_campania = ca.id_campania
INNER JOIN coordinador_territorial ct ON e.id_coordinador_territorial = ct.id_miembro
INNER JOIN equipo_campania ec ON ct.id_miembro = ec.id_miembro
LEFT JOIN (
    SELECT
        id_evento,
        COUNT(id_proveedor) AS proveedores_contratados,
        MIN(hora_instalacion) AS primera_hora_montaje,
        SUM(costo_pactado) AS total_pactado
    FROM contrato
    GROUP BY id_evento
) con ON e.id_evento = con.id_evento
LEFT JOIN (
    SELECT
        id_evento,
        COUNT(id_participacion) AS voluntarios_asistentes,
        SUM(hora_aportada) AS horas_voluntariado
    FROM participacion
    WHERE estado_asistencia = 'Asistio'
    GROUP BY id_evento
) vol ON e.id_evento = vol.id_evento
LEFT JOIN (
    SELECT
        id_evento,
        SUM(monto) AS total_facturado_evento
    FROM gasto
    GROUP BY id_evento
) gas ON e.id_evento = gas.id_evento
ORDER BY e.fecha_evento ASC, e.hora_evento ASC;

-- Consulta 5.2 [Conciliacion Financiera por Evento: Contratado vs. Facturado vs. Soportado ante CNE]
-- Objetivo: En la vida real, un evento firma contratos previos (logistica/tarima) pero tambien
--           puede generar gastos de pauta, encuestas o transporte. Esta consulta compara el
--           valor contratado en 'contrato', el valor facturado en 'gasto' y el valor radicado
--           en 'soporte_contable' para verificar que no existan gastos de eventos sin respaldo CNE.
SELECT
    e.id_evento,
    e.nombre_evento,
    e.fecha_evento,
    COALESCE(c_sum.monto_contratado, 0.00) AS total_contratos_previos,
    COALESCE(g_sum.monto_facturado, 0.00) AS total_gastos_facturados,
    COALESCE(g_sum.monto_respaldado_cne, 0.00) AS total_soportado_cne,
    (COALESCE(g_sum.monto_facturado, 0.00) - COALESCE(g_sum.monto_respaldado_cne, 0.00)) AS saldo_sin_soporte_cne
FROM evento e
LEFT JOIN (
    SELECT id_evento, SUM(costo_pactado) AS monto_contratado
    FROM contrato
    GROUP BY id_evento
) c_sum ON e.id_evento = c_sum.id_evento
LEFT JOIN (
    SELECT
        g.id_evento,
        SUM(g.monto) AS monto_facturado,
        SUM(COALESCE(sc.valor_respaldado, 0.00)) AS monto_respaldado_cne
    FROM gasto g
    LEFT JOIN soporte_contable sc ON g.id_gasto = sc.id_gasto
    WHERE g.id_evento IS NOT NULL
    GROUP BY g.id_evento
) g_sum ON e.id_evento = g_sum.id_evento
ORDER BY total_gastos_facturados DESC;

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

-- Consulta 5.4 [Impacto de Movilizacion de Eventos frente al Censo Electoral y Cobertura Zonal]
-- Objetivo: Evaluar en cada zona donde una campana tiene cobertura abierta ('campania_zona')
--           cuantos eventos ha realizado esa campana, cuantas personas ha convocado y que
--           tasa de movilizacion representa por cada 10.000 votantes del censo electoral.
SELECT
    ca.nombre_campania,
    z.nombre_municipio,
    cz.estado_cobertura,
    cz.fecha_apertura,
    z.censo_electoral,
    COUNT(e.id_evento) AS eventos_en_la_zona,
    COALESCE(SUM(e.aforo_estimado), 0) AS personas_movilizadas,
    ROUND((COALESCE(SUM(e.aforo_estimado), 0) * 10000.0) / z.censo_electoral, 2) AS movilizados_por_cada_10mil_electores
FROM campania_zona cz
INNER JOIN campania ca ON cz.id_campania = ca.id_campania
INNER JOIN zona z ON cz.id_zona = z.id_zona
LEFT JOIN evento e ON cz.id_campania = e.id_campania AND cz.id_zona = e.id_zona
GROUP BY
    ca.id_campania,
    ca.nombre_campania,
    z.id_zona,
    z.nombre_municipio,
    cz.estado_cobertura,
    cz.fecha_apertura,
    z.censo_electoral
ORDER BY personas_movilizadas DESC;

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

-- Consulta 5.6 [Analisis de Concentracion de Financiacion Privada por Donante]
-- Objetivo: Identificar donantes recurrentes (personas naturales o juridicas que han realizado
--           multiples aportes o han financiado varias campanas), calculando su aporte total
--           acumulado y el promedio por donacion.
SELECT
    dn.id_donante,
    dn.documento_o_nit,
    dn.nombre_o_razon_social AS donante,
    dn.tipo_persona,
    dn.municipio,
    COUNT(d.id_donacion) AS cantidad_aportes_realizados,
    COUNT(DISTINCT d.id_campania) AS campanas_financiadas,
    SUM(d.monto) AS total_acumulado_donado,
    ROUND(AVG(d.monto), 2) AS promedio_por_aporte
FROM donante dn
INNER JOIN donacion d ON dn.id_donante = d.id_donante
GROUP BY
    dn.id_donante,
    dn.documento_o_nit,
    dn.nombre_o_razon_social,
    dn.tipo_persona,
    dn.municipio
ORDER BY total_acumulado_donado DESC;
