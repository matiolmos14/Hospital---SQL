-- Creación de funciones

-- Función para mostrar la cantidad de pacientes ingresados a la sala de internación por mes y año
USE `hospital`;
DROP function IF EXISTS `cantidad_pacientes_mes_año`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_pacientes_mes_año`(mes INT, año INT ) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE cantidad_pacientes INT;
  SET cantidad_pacientes = (
    SELECT COUNT(*) FROM paciente_cama
    WHERE MONTH(fecha_asignación) = mes AND YEAR(fecha_asignación) = año);
  RETURN cantidad_pacientes;
END$$

DELIMITER ;

-- Ejemplo de función seleccionando el parámetro mes de mayo del año 2022
   SELECT cantidad_pacientes_mes_año(5,2022) AS Cantidad_Pacientes;
   
-- Función para mostrar la cantidad de médicos por tipo de especialidad y nombre de sala
USE `hospital`;
DROP function IF EXISTS `cantidad_de_médicos_por_tipo_de_especialidad_y_por_sala`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_de_médicos_por_tipo_de_especialidad_y_por_sala`(especialidad VARCHAR(250), nombre VARCHAR(200)) RETURNS INT
    DETERMINISTIC
BEGIN
	DECLARE cantidad_médicos INT;
    SET cantidad_médicos = (SELECT COUNT(*) FROM médico AS m
    INNER JOIN cama AS c ON c.id_médico = m.id_médico
    INNER JOIN sala AS s ON s.id_sala = c.id_sala
    WHERE m.especialidad = especialidad AND s.nombre = nombre);
RETURN cantidad_médicos;
END$$

DELIMITER ;

-- Ejemplo de función seleccionando el parámetro especialidad 'Cardiología' y la sala 'Salvador Mazza'
	SELECT cantidad_de_médicos_por_tipo_de_especialidad_y_por_sala('Cardiología','Salvador Mazza') AS Cantidad_Médicos;

-- Función que muestra el historial clínico de acuerdo al id del paciente ingresado
USE `hospital`;
DROP function IF EXISTS `historial_clínico`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `historial_clínico`(paciente_id INT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE historial TEXT;
SELECT CONCAT_WS('; ', 
       CONCAT('Nombre: ', p.nombre, ' - Apellido: ', p.apellido),
       CONCAT('Fecha de entrada: ', h.fecha_entrada),
       CONCAT('Diagnóstico: ', v.diagnóstico_enfermedad),
       CONCAT('Fecha de alta: ', h.fecha_alta)
    ) AS `Historial Clínico`
    INTO historial
    FROM historial_entrada AS h
    INNER JOIN paciente AS p ON h.id_paciente = p.id_paciente
    INNER JOIN visita_médica AS v ON v.id_paciente = p.id_paciente
    WHERE p.id_paciente = paciente_id;
  RETURN historial;
END$$

DELIMITER ;

-- Ejemplo de función selecccionando el parámetro id_paciente = 7
SELECT historial_clínico(7) AS Historia_Clínica;

-- Función que muestra la cantidad de camas disponibles por fecha y sala de internación
USE `hospital`;
DROP function IF EXISTS `calcular_camas`;

DELIMITER $$
CREATE FUNCTION calcular_camas(fecha_param DATE, sala_param INT) 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total_camas INT;
  DECLARE ocupadas INT;
  DECLARE disponibles INT;
  
  -- Obtener el total de camas
  SELECT s.capacidad INTO total_camas 
  FROM sala AS s
  WHERE s.id_sala = sala_param;
  
   -- Obtener la cantidad de camas ocupadas en la fecha especificada
  SELECT COUNT(*) INTO ocupadas 
  FROM cama AS c
  INNER JOIN paciente_cama AS pc ON pc.id_cama = c.id_cama
  INNER JOIN historial_entrada AS h ON h.id_historia = pc.id_historia
  WHERE c.id_sala = sala_param AND h.fecha_entrada <= fecha_param AND h.fecha_alta >= fecha_param;
  
   -- Obtener la cantidad de camas disponibles en la fecha especificada
  SET disponibles = total_camas - ocupadas;
  
   -- Devolver el resultado
  RETURN disponibles;
END;
$$
DELIMITER ;

-- Ejemplo de función seleccionando el parámetro fecha '2022-11-20' y el id_sala = 2 que corresponde a la sala Florencio Fiorini
SELECT calcular_camas('2022-11-20',2) AS Camas_Disponibles;