-- Utilización del esquema hospital
USE hospital;

-- Creación de vistas

-- Vista edad de pacientes ordernados por longevidad
CREATE VIEW Edad_Pacientes AS
	SELECT id_paciente AS Identificador_Paciente,
           CONCAT(p.nombre,' ', p.apellido) AS Paciente, 
           dni AS DNI,
           TIMESTAMPDIFF(YEAR,p.fecha_nacimiento , CURDATE()) AS Edad
	FROM paciente AS p
	ORDER BY Edad DESC;
    
-- Vista cantidad de consultas por médico, especialidad y observación
CREATE VIEW Consultas_Médico_Especialidad_Observación AS
	SELECT	 
		CONCAT(m.nombre,' ', m.apellido) AS Médico,
		m.especialidad AS Especialidad,
		COUNT(v.id_visita) AS Cantidad_Consultas,
		v.observación AS Observación
	FROM médico AS m
	INNER JOIN visita_médica  AS v
	ON v.id_médico = m.id_médico
	GROUP BY Médico, m.especialidad, v.observación
    ORDER BY v.observación ASC;	
   
   -- Vista diagnóstico y campo especialidad en pacientes menores de 40 años
CREATE VIEW Diagnóstico_Pacientes_Menores40 AS	
    SELECT 
		v.id_visita AS Identificador_Visita,
        concat(p.nombre,' ', p.apellido) AS Paciente, 
        TIMESTAMPDIFF(YEAR,p.fecha_nacimiento , CURDATE()) AS Edad,
        v.diagnóstico_enfermedad AS Diagnóstico,
        MONTHNAME(v.fecha_visita) AS Mes_Ingreso,
        YEAR(v.fecha_visita) AS Año_Ingreso, 
        v.observación AS Observación,
		concat(m.nombre,' ', m.apellido) AS Médico,
        m.especialidad AS Especialidad
	FROM paciente as p
    INNER JOIN visita_médica AS v
    ON v.id_paciente = p.id_paciente
    INNER JOIN médico AS m
    ON p.id_paciente = m.id_médico
    HAVING Edad < 40
    ORDER BY Edad DESC;
	
 -- Vista tiempo permanencia pacientes (días)
CREATE VIEW Días_Permanencia_Pacientes AS	
    SELECT 
		p.id_paciente AS Identificación_Paciente, 
		p.nombre AS Nombre,
        p.apellido AS Apellido,
        v.diagnóstico_enfermedad AS Diagnóstico,
        m.especialidad AS Campo_Especialidad,
        TIMESTAMPDIFF(DAY,h.fecha_entrada,h.fecha_alta) AS Días_de_Permanencia  
	FROM paciente AS p
	INNER JOIN visita_médica AS v
	ON v.id_paciente = p.id_paciente
    INNER JOIN médico AS m ON m.id_médico = v.id_médico
    INNER JOIN historial_entrada AS h
    ON h.id_visita = v.id_visita
    ORDER BY Días_de_Permanencia DESC;
 
 -- Vista cantidad de pacientes por especialista, tiempo promedio internación y especialidad médica
CREATE VIEW Especialista_Tiempo_Espera_Sala_Internación AS
     SELECT 
		m.id_médico AS Identificador_Médico,
        CONCAT(m.nombre,' ', m.apellido) AS Médico,
        COUNT(h.id_historia) AS Cantidad_Pacientes,
		m.especialidad AS Especialidad,
        ROUND(AVG(TIMESTAMPDIFF(DAY,h.fecha_entrada,h.fecha_alta)),1) AS Días_Internación_Promedio_Paciente,
        WEEK(h.fecha_entrada, 2) - WEEK(DATE_SUB(h.fecha_entrada, INTERVAL DAYOFMONTH(h.fecha_entrada)-1 DAY), 2) + 1 AS Semana_Mes,
        MONTHNAME(h.fecha_entrada) AS Mes_Ingreso,
        YEAR (h.fecha_entrada) AS Año_Ingreso
	FROM médico AS m
    INNER JOIN historial_entrada AS h
    ON h.id_médico = m.id_médico
		GROUP BY m.id_médico, m.especialidad, Año_Ingreso, Mes_Ingreso, Semana_Mes
        ORDER BY Días_Internación_Promedio_Paciente DESC;
 
 -- Vista porcentaje ocupación salas por mes
CREATE VIEW Porcentaje_Ocupación_Salas_Por_Mes AS
	SELECT 
		COUNT(c.id_paciente_cama) AS Cantidad_Pacientes,
		ROUND(COUNT(c.id_paciente_cama) * 100 / s.capacidad,2) AS Porcentaje_Ocupación,
        WEEK(h.fecha_entrada, 2) - WEEK(DATE_SUB(h.fecha_entrada, INTERVAL DAYOFMONTH(h.fecha_entrada)-1 DAY), 2) + 1 AS Semana_Mes,
		MONTHNAME(pc.fecha_asignación) AS Mes_Ocupación,
        YEAR(pc.fecha_asignación) AS Año,
		s.nombre AS Sala
	FROM cama AS c
	INNER JOIN paciente_cama AS pc
	ON c.id_paciente_cama = pc.id_paciente_cama
    INNER JOIN historial_entrada AS h ON h.id_historia = pc.id_historia
	INNER JOIN sala AS s
	ON c.id_sala = s.id_sala
	GROUP BY MONTHNAME(pc.fecha_asignación),Semana_Mes,YEAR(pc.fecha_asignación),s.nombre,s.capacidad
    ORDER BY Porcentaje_Ocupación DESC;
    