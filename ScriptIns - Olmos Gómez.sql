-- Creación del esquema hospital
CREATE DATABASE IF NOT EXISTS Hospital;
 USE Hospital;
 
-- Creación de tablas

-- Tabla médico
CREATE TABLE IF NOT EXISTS Médico (
	id_médico INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(50) NOT NULL,
    dirección VARCHAR(200) NOT NULL,
    barrio VARCHAR(200) NOT NULL,
    teléfono VARCHAR(50) NOT NULL,
    especialidad VARCHAR(200) NOT NULL,
    CONSTRAINT PK_Médico PRIMARY KEY (id_médico) 
)ENGINE=InnoDB;

-- Tabla paciente
CREATE TABLE IF NOT EXISTS Paciente (
	id_paciente INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT PK_Paciente PRIMARY KEY (id_paciente)
)ENGINE=InnoDB;

-- Tabla visita médica
CREATE TABLE IF NOT EXISTS Visita_Médica (
	id_visita INT NOT NULL,
    fecha_visita DATE NOT NULL,
    diagnóstico_enfermedad VARCHAR(300) NOT NULL,
    observación VARCHAR(200) NOT NULL,
    id_médico INT NOT NULL,
    id_paciente INT NOT NULL,
    PRIMARY KEY (id_visita),
    CONSTRAINT FK_Médico_Visita FOREIGN KEY (id_médico) REFERENCES Médico (id_médico),
    CONSTRAINT FK_Paciente_Visita FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente) 
)ENGINE=InnoDB;

-- Tabla historial de entrada internación
CREATE TABLE IF NOT EXISTS Historial_Entrada (
	id_historia INT NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_alta DATE NOT NULL,
    id_médico INT NOT NULL,
    id_paciente INT NOT NULL,
    id_visita INT NOT NULL,
    PRIMARY KEY (id_historia),
    CONSTRAINT FK_Historial_Médico FOREIGN KEY (id_médico) REFERENCES Médico (id_médico),
    CONSTRAINT FK_Historial_Paciente FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente),
    CONSTRAINT FK_Historial_Visita FOREIGN KEY (id_visita) REFERENCES visita_médica (id_visita)
)ENGINE=InnoDB;

-- Tabla paciente cama
CREATE TABLE IF NOT EXISTS Paciente_Cama (
	id_paciente_cama INT NOT NULL,
    fecha_asignación DATE NOT NULL,
    id_cama INT NOT NULL,
    id_historia INT NOT NULL,
    PRIMARY KEY (id_paciente_cama),
    CONSTRAINT FK_Paciente_Cama_Historia FOREIGN KEY (id_historia) REFERENCES Historial_Entrada(id_historia)
)ENGINE=InnoDB;

-- Tabla sala
CREATE TABLE IF NOT EXISTS Sala (
	id_sala INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    PRIMARY KEY (id_sala)
)ENGINE=InnoDB;

-- Tabla cama
CREATE TABLE IF NOT EXISTS Cama (
	id_cama INT NOT NULL,
    id_paciente_cama INT NOT NULL,
    id_historia INT NOT NULL,
    id_sala INT NOT NULL,
    id_médico INT NOT NULL,
    PRIMARY KEY (id_cama),
    CONSTRAINT FK_Cama_Paciente_Cama FOREIGN KEY (id_paciente_cama) REFERENCES Paciente_Cama (id_paciente_cama),
    CONSTRAINT FK_Cama_Historia FOREIGN KEY (id_historia) REFERENCES Historial_Entrada (id_historia),
    CONSTRAINT FK_Cama_Sala FOREIGN KEY (id_sala) REFERENCES Sala (id_sala),
    CONSTRAINT FK_Cama_Médico FOREIGN KEY (id_médico) REFERENCES médico (id_médico)
)ENGINE=InnoDB;

-- Inserción datos tabla médico
INSERT INTO médico(id_médico,nombre,apellido,dni,dirección,barrio,teléfono,especialidad)
	VALUES
		(1,'Ana María','Lopez Alonso','José María Bedoya','10.203.405','B° Alta Córdoba','+ 549 11-4444-4444','Cardiología'), 
        (2,'José Rodríguez','Álvarez','Deán Funes','67.890.123','B° Alto Alberdi','+ 549 11-5555-5555','Oftalmología'), 
        (3,'María Lourdes','Da Costa Pérez','21.430.865','Gral. Román Deheza','B° Gral Paz','+ 549 11-3333-3333','Endocrinología'), 
		(4,'Juan Carlos','Soler Martínez','98.127.546','Gabriela Mistral','B° Parque','+549 11-2222-2222','Traumatología'),
		(5,'Rocío','Gómez Bueno','Obispo Salguero','54.321.098','B° Nueva Córdoba','+ 549 11-1111-1111','Pediatría'),
	    (6,'Mario Alejandro','Muñoz Rodríguez','78.906.543','Félix Frías','B° Jardín','+ 549 11-9999-9999','Cardiología'),
        (7,'Daniela Elizabeth','Hernández Díaz','45.672.109','San Luis','B° Alto Alberdi','+ 549 11-7777-7777','Dermatología'), 
		(8,'Alejandro José','Martínez Sánchez','32.109.876','Juan B. Justo','B° Nueva Córdoba','+ 549 11-8888-8888','Oftalmología'), 
	    (9,'Sergio Eduardo','Moreno Ruíz','San Jerónimo','87.657.019','B° Nueva Córdoba','+ 549 11-0000-0000','Pediatría'),
	    (10,'Lucas Ariel','Fernández García','Pedro Goyena','56.789.103','B° Urca','+ 549 11-222-222','Oncología'),
        (11,'Melina','Rodríguez Pérez','Sucre','43.210.987','B° General Bustos','+ 549 11-6666-6666','Ginecología'), 
        (12,'Ignacio','López Sosa','Belgrano','76.543.210','B° Cofico','+ 549 11-999-999','Psicología');
				
-- Inserción datos tabla paciente
INSERT INTO paciente(id_paciente,nombre,apellido,dni,fecha_nacimiento)  
	VALUES
		(1,'Elena','González Durán','98.765.432',STR_TO_DATE('14-Mar-1979','%d-%M-%Y')), 
        (2,'Luis Alberto','Sánchez','12.345.678',STR_TO_DATE('23-Jul-1960','%d-%M-%Y')), 
        (3,'María Paz','Ruíz Hernández','87.654.321',STR_TO_DATE('25-Feb-1993','%d-%M-%Y')),
        (4,'Cristian Manuel','Díaz Ortiz','23.456.789',STR_TO_DATE('07-Sep-2002','%d-%M-%Y')),   
        (5,'Melina Daniela','López García','98.761.234',STR_TO_DATE('12-Nov-2014','%d-%M-%Y')), 
        (6,'Diego Fernando','Martín Morales','34.567.890',STR_TO_DATE('04-Aug-1986','%d-%M-%Y')), 
        (7,'Gabriela Valentina','Flores Vázquez','45.678.901',STR_TO_DATE('09-Jun-1975','%d-%M-%Y')), 
        (8,'Tomás Agustín','Aguilar Ortiz','78.901.234',STR_TO_DATE('19-May-1997','%d-%M-%Y')),
        (9,'Mónica Victoria','Torres Navarro','56.789.012',STR_TO_DATE('29-Jan-1968','%d-%M-%Y')),
	    (10,'Bruno Emiliano','Cruz Jiménez','90.123.456',STR_TO_DATE('16-Apr-2017','%d-%M-%Y')), 
        (11,'Sofía','García Pérez','67.890.123',STR_TO_DATE('03-Jul-2016','%d-%M-%Y')), 
        (12,'Juan Manuel','Rodríguez Torres','12.345.678',STR_TO_DATE('20-Sep-1988','%d-%M-%Y')),
        (13,'Carla Andrea','González Ortiz','56.789.012',STR_TO_DATE('15-Feb-1995','%d-%M-%Y')),
        (14,'Pedro Alejandro','Sánchez Álvarez','23.456.789',STR_TO_DATE('12-Oct-1993','%d-%M-%Y')),
        (15,'Marcela Alejandra','Martínez Fernández','78.901.234',STR_TO_DATE('30-Nov-1987','%d-%M-%Y')),
        (16,'Emilia Antonia','López Pérez','90.123.456',STR_TO_DATE('05-Mar-1990','%d-%M-%Y')), 
        (17,'Mario Alberto','Cruz García','98.761.234',STR_TO_DATE('08-Apr-1965','%d-%M-%Y')),
        (18,'Santiago Eduardo','Flores Ramírez','45.678.901',STR_TO_DATE('14-Jun-1992','%d-%M-%Y')), 
        (19,'Laura Valentina','Aguilar Torres','34.567.890',STR_TO_DATE('25-Jan-2003','%d-%M-%Y')), 
        (20,'Alicia Sofía','Ruíz Gutiérrez','87.654.321',STR_TO_DATE('18-Aug-1987','%d-%M-%Y'));
        
-- Inserción datos tabla visita médica
INSERT INTO Visita_Médica (id_visita,fecha_visita,diagnóstico_enfermedad,observación,id_médico,id_paciente)
    VALUES
        (1,STR_TO_DATE('15-Sep-2022', '%d-%M-%Y'),'Hipertensión Arterial','Leve',1,1),
        (2,STR_TO_DATE('4-Mar-2022', '%d-%M-%Y'),'Conjuntivitis','Leve',2,2), 
        (3,STR_TO_DATE('26-Oct-2022', '%d-%M-%Y'),'Síndrome del Ovario Poliquístico','Crítico',3,3),
        (4,STR_TO_DATE('02-Feb-2022', '%d-%M-%Y'),'Esguince Tobillo','Leve',4,4),
        (5,STR_TO_DATE('05-May-2022', '%d-%M-%Y'),'Gripe','Moderado',5,5),
        (6,STR_TO_DATE('19-Mar-2022', '%d-%M-%Y'),'Arritmias Leves','Leve',6,6),		
        (7,STR_TO_DATE('09-Jul-2022', '%d-%M-%Y'),'Síndrome de Stevens-Johnson','Crítico',7,7),
		(8,STR_TO_DATE('18-Nov-2022', '%d-%M-%Y'),'Glaucoma','Crítico',8,8),
		(9,STR_TO_DATE('10-Nov-2022', '%d-%M-%Y'),'Insuficiencia cardíaca','Crítico',1,9),
        (10,STR_TO_DATE('26-Aug-2022', '%d-%M-%Y'),'Otitis','Leve',9,10),
        (11,STR_TO_DATE('10-Jul-2022', '%d-%M-%Y'),'Esclerosis Múltiple Pediátrica','Crítico',5,11),
        (12,STR_TO_DATE('13-May-2022', '%d-%M-%Y'),'Linfoma','Crítico',10,12),
        (13,STR_TO_DATE('25-Nov-2022', '%d-%M-%Y'),'Aneurisma Aórtico','Crítico',6,13),
        (14,STR_TO_DATE('16-Nov-2022', '%d-%M-%Y'),'Hernia Discal L4-L5','Crítico',4,14),
        (15,STR_TO_DATE('09-Feb-2022', '%d-%M-%Y'),'Astigmatismo','Moderado',2,15), 
        (16,STR_TO_DATE('23-Jan-2022', '%d-%M-%Y'),'infección Vaginal','Moderado',11,16),	
        (17,STR_TO_DATE('16-Jan-2023', '%d-%M-%Y'),'Glaucoma','Crítico',8,17),
        (18,STR_TO_DATE('19-Jan-2023', '%d-%M-%Y'),'Hipertiroidismo Subclínico','Moderado',3,18),
        (19,STR_TO_DATE('16-Feb-2023', '%d-%M-%Y'),'Trastornos de Ansiedad Graves','Crítico',12,19),
        (20,STR_TO_DATE('03-Mar-2023', '%d-%M-%Y'),'Psoriasis Grave','Crítico',7,20),	
        (21,STR_TO_DATE('11-Oct-2022', '%d-%M-%Y'),'Infarto de Miocardio','Crítico',1,1),       
        (22,STR_TO_DATE('18-Oct-2022', '%d-%M-%Y'),'Desprendimiento de Retina','Crítico',2,2),
        (23,STR_TO_DATE('16-May-2022', '%d-%M-%Y'),'Hernia Discal L4-L5','Crítico',4,4),
        (24,STR_TO_DATE('19-May-2022', '%d-%M-%Y'),'Asma','Crítico',5,5),
        (25,STR_TO_DATE('08-Jan-2023', '%d-%M-%Y'),'Cáncer de Cuello Uterino','Crítico',11,16),
        (26,STR_TO_DATE('04-Jul-2022', '%d-%M-%Y'),'Tromboembolismo pulmonar','Crítico',6,6),
        (27,STR_TO_DATE('20-Oct-2022', '%d-%M-%Y'),'Desprendimiento de Retina','Crítico',2,15), 
        (28,STR_TO_DATE('04-Dec-2022', '%d-%M-%Y'),'Neumonía','Crítico',10,10),
        (29,STR_TO_DATE('07-Feb-2023', '%d-%M-%Y'),'Hipertiroidismo','Crítico',3,18);
        
-- Inserción datos tabla historial de entrada internación
INSERT INTO historial_entrada(id_historia,fecha_entrada,fecha_alta,id_médico,id_paciente,id_visita)
	VALUES
		(3,STR_TO_DATE('26-Oct-2022', '%d-%M-%Y'),STR_TO_DATE('30-Oct-2022', '%d-%M-%Y'),3,3,3),
        (7,STR_TO_DATE('09-Jul-2022', '%d-%M-%Y'),STR_TO_DATE('20-Jul-2022', '%d-%M-%Y'),7,7,7),
        (8,STR_TO_DATE('18-Nov-2022', '%d-%M-%Y'),STR_TO_DATE('26-Nov-2022', '%d-%M-%Y'),8,8,8),
        (9,STR_TO_DATE('10-Nov-2022', '%d-%M-%Y'),STR_TO_DATE('23-Nov-2022', '%d-%M-%Y'),1,9,9), 
        (11,STR_TO_DATE('10-Jul-2022', '%d-%M-%Y'),STR_TO_DATE('25-Jul-2022', '%d-%M-%Y'),5,11,11),
	    (12,STR_TO_DATE('13-May-2022', '%d-%M-%Y'),STR_TO_DATE('29-May-2022', '%d-%M-%Y'),10,12,12),
		(13,STR_TO_DATE('25-Nov-2022', '%d-%M-%Y'),STR_TO_DATE('03-Dec-2022', '%d-%M-%Y'),6,13,13),
        (14,STR_TO_DATE('16-Nov-2022', '%d-%M-%Y'),STR_TO_DATE('24-Nov-2022', '%d-%M-%Y'),4,14,14),
        (17,STR_TO_DATE('16-Jan-2023', '%d-%M-%Y'),STR_TO_DATE('23-Jan-2023', '%d-%M-%Y'),8,17,17),
        (19,STR_TO_DATE('16-Feb-2023', '%d-%M-%Y'),STR_TO_DATE('22-Feb-2023', '%d-%M-%Y'),12,19,19),
        (20,STR_TO_DATE('03-Mar-2023', '%d-%M-%Y'),STR_TO_DATE('09-Mar-2023', '%d-%M-%Y'),7,20,20),
        (21,STR_TO_DATE('11-Oct-2022', '%d-%M-%Y'),STR_TO_DATE('28-Oct-2022', '%d-%M-%Y'),1,1,21), 
        (22,STR_TO_DATE('18-Oct-2022', '%d-%M-%Y'),STR_TO_DATE('21-Oct-2022', '%d-%M-%Y'),2,2,22),
        (23,STR_TO_DATE('16-May-2022', '%d-%M-%Y'),STR_TO_DATE('27-May-2022', '%d-%M-%Y'),4,4,23),
        (24,STR_TO_DATE('19-May-2022', '%d-%M-%Y'),STR_TO_DATE('24-May-2022', '%d-%M-%Y'),5,5,24),
        (25,STR_TO_DATE('08-Jan-2023', '%d-%M-%Y'),STR_TO_DATE('21-Jan-2023', '%d-%M-%Y'),11,16,25),
        (26,STR_TO_DATE('04-Jul-2022', '%d-%M-%Y'),STR_TO_DATE('22-Jul-2022', '%d-%M-%Y'),6,6,26),
        (27,STR_TO_DATE('20-Oct-2022', '%d-%M-%Y'),STR_TO_DATE('24-Oct-2022', '%d-%M-%Y'),2,15,27),
        (28,STR_TO_DATE('04-Dec-2022', '%d-%M-%Y'),STR_TO_DATE('06-Dec-2022', '%d-%M-%Y'),10,10,28),
        (29,STR_TO_DATE('07-Feb-2023', '%d-%M-%Y'),STR_TO_DATE('19-Feb-2023', '%d-%M-%Y'),3,18,29);
        
-- Inserción datos tabla paciente cama
INSERT INTO paciente_cama(id_paciente_cama,fecha_asignación,id_cama,id_historia)
	VALUES
		(0003,STR_TO_DATE('26-Oct-2022', '%d-%M-%Y'),003,3),
        (0007,STR_TO_DATE('09-Jul-2022', '%d-%M-%Y'),007,7),
        (0008,STR_TO_DATE('18-Nov-2022', '%d-%M-%Y'),008,8),
        (0009,STR_TO_DATE('10-Nov-2022', '%d-%M-%Y'),009,9),   
        (0011,STR_TO_DATE('10-Jul-2022', '%d-%M-%Y'),011,11),
        (0012,STR_TO_DATE('13-May-2022', '%d-%M-%Y'),012,12),
	    (0013,STR_TO_DATE('25-Nov-2022', '%d-%M-%Y'),013,13), 
        (0014,STR_TO_DATE('16-Nov-2022', '%d-%M-%Y'),014,14), 
        (0017,STR_TO_DATE('16-Jan-2023', '%d-%M-%Y'),017,17),
        (0019,STR_TO_DATE('16-Feb-2023', '%d-%M-%Y'),019,19),  
		(0020,STR_TO_DATE('03-Mar-2023', '%d-%M-%Y'),020,20),
        (0021,STR_TO_DATE('11-Oct-2022', '%d-%M-%Y'),021,21),	
        (0022,STR_TO_DATE('18-Oct-2022', '%d-%M-%Y'),022,22),
        (0023,STR_TO_DATE('16-May-2022', '%d-%M-%Y'),023,23),
        (0024,STR_TO_DATE('19-May-2022', '%d-%M-%Y'),024,24),	
        (0025,STR_TO_DATE('08-Jan-2023', '%d-%M-%Y'),025,25),   
        (0026,STR_TO_DATE('04-Jul-2022', '%d-%M-%Y'),026,26), 
        (0027,STR_TO_DATE('20-Oct-2022', '%d-%M-%Y'),027,27),	
        (0028,STR_TO_DATE('04-Dec-2022', '%d-%M-%Y'),028,28),  
        (0029,STR_TO_DATE('07-Feb-2023', '%d-%M-%Y'),029,29);  
        
-- Inserción datos tabla sala
INSERT INTO sala(id_sala,nombre,capacidad)
	VALUES
		(1,'Salvador Mazza',5),
		(2,'Florencio Fiorini',5),
     	(3,'Federico Leloir',5);       
        
-- Inserción datos tabla cama
INSERT INTO cama(id_cama,id_paciente_cama,id_historia,id_sala,id_médico)
	VALUES
		(003,0003,3,1,3),
        (007,0007,7,2,7),
		(008,0008,8,2,8), 
		(009,0009,9,2,1), 
		(011,0011,11,2,5),
        (012,0012,12,1,10),
        (013,0013,13,1,6), 
		(014,0014,14,1,4),
        (017,0017,17,3,8),
     	(019,0019,19,3,12),
        (020,0020,20,3,7),
        (021,0021,21,1,1), 
        (022,0022,22,1,2),
        (023,0023,23,1,4),
        (024,0024,24,1,5), 
        (025,0025,25,3,11),
        (026,0026,26,2,6),
        (027,0027,27,1,2),
        (028,0028,28,2,10),
        (029,0029,29,3,3);
