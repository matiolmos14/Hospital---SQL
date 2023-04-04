-- Creación de triggers

-- Creación de la tabla log_hospital con los campos respectivos
USE hospital;
CREATE TABLE Log_Hospital (
Usuario VARCHAR(50),
Fecha_actualización DATE,
Hora_actualización TIME,
Operación CHAR(6),
Registros INT,
Tabla VARCHAR(50)
);

-- Creación del trigger para actualizar la tabla Log_Hospital cuando inserte un dato en cualquier tabla
USE hospital;

-- Creación del trigger insert médico
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_médico` 
AFTER INSERT ON médico
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'médico');
END$$

-- Creación del trigger insert paciente
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_paciente` 
AFTER INSERT ON paciente
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'paciente');
END$$

-- Creación del trigger insert visita médica
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_visita_médica` 
AFTER INSERT ON visita_médica
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'visita_médica');
END$$

-- Creación del trigger insert historial de entrada internación
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_historial_entrada` 
AFTER INSERT ON historial_entrada
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'historial_entrada');
END$$

-- Creación del trigger insert paciente cama
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_paciente_cama` 
AFTER INSERT ON paciente_cama
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'paciente_cama');
END$$

-- Creación del trigger insert sala
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_sala` 
AFTER INSERT ON sala
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'sala');
END$$

-- Creación del trigger insert cama
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_add_cama` 
AFTER INSERT ON cama
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 1, 'cama');
END;
$$

DELIMITER ;

-- Prueba piloto ingresado un dato en las distintas tablas

-- Médico
INSERT INTO `hospital`.`médico`
(`id_médico`,`nombre`,`apellido`,`dni`,`dirección`,`barrio`,`teléfono`,`especialidad`)
VALUES (14,'Sofía Alejandra', 'Pérez','26.628.934','Av Gral Paz','B° Centro','+ 549 11-333-333','Traumatología');

-- Paciente  
INSERT INTO `hospital`.`paciente`
(`id_paciente`,`nombre`,`apellido`,`dni`,`fecha_nacimiento`)
VALUES (21,'María Florencia','López Martínez','54.461.293',STR_TO_DATE('14-Sep-2002', '%d-%M-%Y'));

-- Visita médica
INSERT INTO `hospital`.`visita_médica`
(`id_visita`,`fecha_visita`,`diagnóstico_enfermedad`,`observación`,`id_médico`,`id_paciente`)
VALUES 
	(30,STR_TO_DATE('19-Nov-2022', '%d-%M-%Y'),'Esguince Tobillo','Leve',14,21);

  -- Verificación del historial de actualización en la tabla log_hospital (insert)
SELECT * FROM log_hospital;

-- Creación del trigger para actualizar la tabla Log_Hospital cuando modifique un dato en cualquier tabla
DELIMITER $$
  
-- Creación del trigger update médico
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_médico` 
AFTER UPDATE ON médico
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'médico');
END$$

-- Creación del trigger update paciente
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_paciente` 
AFTER UPDATE ON paciente
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'paciente');
END$$

-- Creación del trigger update visita médica
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_visita_médica` 
AFTER UPDATE ON visita_médica
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'visita_médica');
END$$

-- Creación del trigger update historial de entrada internación 
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_historial_entrada` 
AFTER UPDATE ON historial_entrada
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'historial_entrada');
END$$

-- Creación del trigger update paciente cama
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_paciente_cama` 
AFTER UPDATE ON paciente_cama
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'paciente_cama');
END$$

-- Creación del trigger update sala
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_sala` 
AFTER UPDATE ON sala
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'sala');
END$$

-- Creación del trigger update cama
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_upd_cama` 
AFTER UPDATE ON cama
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', 1, 'cama');
END;
$$

DELIMITER ;

-- Prueba piloto modificando un dato en las distintas tablas

-- Médico
UPDATE médico
SET especialidad = 'Cardiología'
WHERE id_médico = 14;

-- Paciente
UPDATE paciente
SET fecha_nacimiento = STR_TO_DATE('14-Sep-2001', '%d-%M-%Y')
WHERE id_paciente = 21; 

-- Visita médica
UPDATE visita_médica
SET diagnóstico_enfermedad = 'Arritmias Leves'
WHERE id_visita = 30;

-- Verificación del historial de actualización en la tabla log_hospital (update)
SELECT * FROM log_hospital;

-- Creación del trigger para actualizar la tabla Log_Hospital cuando elimine un dato en cualquier tabla
DELIMITER $$
  
-- Creación del trigger delete médico
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_médico` 
AFTER DELETE ON médico
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'médico');
END$$

-- Creación del trigger delete paciente
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_paciente` 
AFTER DELETE ON paciente
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'paciente');
END$$

-- Creación del trigger delete visita médica
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_visita_médica` 
AFTER DELETE ON visita_médica
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'visita_médica');
END$$

-- Creación del trigger delete historial de entrada internación
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_historial_entrada` 
AFTER DELETE ON historial_entrada
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'historial_entrada');
END$$

-- Creación del trigger delete paciente cama
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_paciente_cama` 
AFTER DELETE ON paciente_cama
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'paciente_cama');
END$$

-- Creación del trigger delete sala
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_sala` 
AFTER DELETE ON sala
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'sala');
END$$

-- Creación del trigger delete cama
  CREATE DEFINER=`root`@`localhost` TRIGGER `tr_del_cama` 
AFTER DELETE ON cama
FOR EACH ROW
BEGIN
  INSERT INTO Log_Hospital (Usuario, Fecha_actualización, Hora_actualización, Operación, Registros, Tabla) 
  VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', 1, 'cama');
END;
$$

DELIMITER ;

-- Prueba piloto elminando un dato en las distintas tablas

-- Visita médica
DELETE FROM `hospital`.`visita_médica` WHERE id_visita = 30;

-- Médico
DELETE FROM `hospital`.`médico` WHERE id_médico = 14; 

-- Paciente
DELETE FROM `hospital`.`paciente` WHERE id_paciente = 21;
 
-- Verificación del historial de actualización en la tabla log_hospital (delete)
SELECT * FROM log_hospital;
