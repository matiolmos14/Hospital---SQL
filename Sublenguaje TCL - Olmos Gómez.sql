-- Implementación sentencias del subleguaje TCL

-- Seleccionamos la función autocommit para desabilitarla 
SELECT @@autocommit;
SET autocommit = 0;
SELECT @@autocommit;

-- Commit y Rollback tabla médico
USE hospital;

INSERT INTO médico (id_médico, nombre, apellido, dni, dirección, barrio, teléfono, especialidad) 
	VALUES 	(15, 'Lucas', 'González Rodríguez','57.219.863', 'Av. Colón', 'B° Centro', '+549 11-777-777', 'Oncología'),
			(16, 'Marcela', 'Gómez López','93.507.128', 'Rioja', 'B° Observatorio', '+549 11-888-888', 'Psiquiatría'),
			(17, 'Matías', 'Pérez Fernández','23.876.549', 'La Rioja', 'B° Nueva Córdoba', '+549 11-555-555', 'Ginecología'),
			(18, 'Julieta', 'Hernández González','60.481.297', 'Av. Vélez Sarsfield', 'B° Alberdi', '+549 11-000-000', 'Cardiología'),
			(19, 'Martín', 'Díaz Gómez', 'Arturo M. Bas','81.753.902', 'B° Villa Belgrano', '+549 11-111-111', 'Neurología');

-- Inicio de la transacción
START TRANSACTION;

DELETE FROM médico WHERE id_médico BETWEEN 15 AND 19;

-- Verificación de los registros eliminados antes del rollback
SELECT * FROM médico WHERE id_médico BETWEEN 15 AND 19;

ROLLBACK;

-- Verificación de los registros insertados luego del rollback
SELECT * FROM médico WHERE id_médico BETWEEN 15 AND 19;

-- Eliminación de registros
DELETE FROM médico WHERE id_médico > 14;

COMMIT;

-- Savepoint tabla paciente
USE hospital;
-- Inicio de la transacción, inserción de registros y creación de savepoint
START TRANSACTION;
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento)
	VALUES (22,'Luciana Soledad','García González','67.890.123',STR_TO_DATE('10-Sep-1985', '%d-%M-%Y'));
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 	
	VALUES (23,'Pablo Ariel','Hernández Ortiz','78.901.234',STR_TO_DATE('20-Nov-1970', '%d-%M-%Y'));
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 
	VALUES (24,'Carolina Fernanda','Gómez Torres','89.012.345',STR_TO_DATE('30-Dec-1995', '%d-%M-%Y'));
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 
	VALUES (25,'Juan Carlos','Martínez Rodríguez','90.123.456',STR_TO_DATE('11-Jan-2000', '%d-%M-%Y'));
SAVEPOINT SP1;
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 
	VALUES (26,'Ana Belén','López García','12.345.678',STR_TO_DATE('22-Feb-1978', '%d-%M-%Y'));
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 
	VALUES (27,'Roberto Luis','Sánchez Pérez','43.210.987',STR_TO_DATE('03-Mar-1983', '%d-%M-%Y'));        
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 
	VALUES (28,'Marcela Andrea','González Hernández','56.789.012',STR_TO_DATE('14-Apr-1965', '%d-%M-%Y'));        
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento) 
	VALUES (29,'Gustavo Adolfo','Ruíz Gómez','98.765.432',STR_TO_DATE('25-May-1991', '%d-%M-%Y'));
SAVEPOINT SP2;

-- Verificación de los registros insertados
SELECT * FROM paciente WHERE id_paciente BETWEEN 22 AND 29;

-- Deshacer los cambios después del savepoint lote_1
ROLLBACK TO SP1; 

-- Verificación de los registros insertados después del rollback
SELECT * FROM paciente WHERE id_paciente BETWEEN 22 AND 29;

-- Eliminación de los savepoint
RELEASE SAVEPOINT SP1;
RELEASE SAVEPOINT SP2;

-- Eliminación de los registros insertados 
DELETE FROM paciente WHERE id_paciente > 21;

COMMIT;