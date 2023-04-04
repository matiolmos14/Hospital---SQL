-- Creación de stored procedures:

-- Stored procedure para el ordenamiento de la tabla pacientes
USE `hospital`;
DROP procedure IF EXISTS `ordenar_pacientes_por_campo`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_pacientes_por_campo`(IN CampoIngresado VARCHAR(50), IN Orden VARCHAR(4))
BEGIN
    SET @Campo = CONCAT('SELECT * FROM paciente ORDER BY ', CampoIngresado, ' ', Orden);
    PREPARE stored1 from @Campo;
    EXECUTE stored1;
    DEALLOCATE PREPARE stored1;
END$$

DELIMITER ;

-- Utilización del stored procedure ingresando el campo 'fecha_nacimiento' y un orden determinado 'asc'
call ordenar_pacientes_por_campo('fecha_nacimiento','asc');
   
-- Stored procedure para la inserción o eliminación de los registros de una tabla   
USE `hospital`;
DROP procedure IF EXISTS `insertar_eliminar_medico`;

DELIMITER //
CREATE PROCEDURE insertar_eliminar_registro_tabla_médico(
    IN accion VARCHAR(10),
    IN medico_id INT,
    IN medico_nombre VARCHAR(100),
    IN medico_apellido VARCHAR(100),
    IN medico_direccion VARCHAR(250),
    IN medico_dni VARCHAR(200),
    IN medico_barrio VARCHAR(200),
    IN medico_telefono VARCHAR(200),
    IN medico_especialidad VARCHAR(250)
)
BEGIN
    IF accion = 'insertar' THEN
        INSERT INTO médico (id_médico, nombre, apellido, dni, dirección, barrio, teléfono, especialidad)
        VALUES (medico_id, medico_nombre, medico_apellido,medico_dni, medico_direccion, medico_barrio, medico_telefono, medico_especialidad);
    ELSEIF accion = 'eliminar' THEN
        DELETE FROM Médico WHERE id_médico = medico_id;
    END IF;
END //
DELIMITER ;

-- Utilización del Stored Procedure con la inserción de un nuevo registro
CALL insertar_eliminar_registro_tabla_médico('insertar',13,'Juan José', 'Martínez','28.429.673','Av Colón','B° Centro',
'+ 549 11-666-666','Traumatología');

-- Verificación del nuevo registro insertado
SELECT * FROM médico WHERE id_médico = 13;

-- Utilización del Stored Procedure con la eliminación del nuevo registro
CALL insertar_eliminar_registro_tabla_médico('eliminar',13,'','','','','','','');

-- Verificación del registro eliminado
SELECT * FROM médico WHERE id_médico = 13;

-- Stored Procedure para visualizar los pacientes que han permanecido más de 10 días internados
USE `hospital`;
DROP procedure IF EXISTS `pacientes_larga_hospitalización`;

DELIMITER $$
USE `hospital`$$
CREATE PROCEDURE pacientes_larga_hospitalización (IN especialidad_param VARCHAR(50))
BEGIN
 SELECT 
    p.id_paciente AS Identificador_Paciente,
    CONCAT(p.nombre, ' ', p.apellido) AS Paciente, 
    TIMESTAMPDIFF(DAY, h.fecha_entrada, h.fecha_alta) AS Tiempo_Internación_Días,
    CONCAT(m.nombre, ' ', m.apellido) AS Médico,
    v.diagnóstico_enfermedad AS Diagnóstico
FROM paciente AS p 
INNER JOIN historial_entrada AS h ON h.id_paciente = p.id_paciente 
INNER JOIN visita_médica AS v ON v.id_paciente = h.id_paciente 
INNER JOIN médico AS m ON m.id_médico = v.id_médico 
WHERE v.observación = 'Crítico' AND m.especialidad = especialidad_param
HAVING Tiempo_Internación_Días > 10
ORDER BY Tiempo_Internación_Días DESC;

END$$

DELIMITER ;

-- Utilización del stored procedure ingresando el campo especialidad 'Cardiología'
CALL pacientes_larga_hospitalizacion('Cardiología');