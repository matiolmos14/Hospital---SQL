-- Implementación de sentencias para la creación de usuarios y permisos
USE mysql;

-- Creación del primer usuario
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'hospital1';

-- Verificación de la creación del primer usuario
SELECT * FROM USER;

-- Creación del permiso para la visualización de datos
GRANT SELECT ON Hospital.* TO 'usuario_lectura'@'localhost';

-- Eliminar permisos para el comando delete en la base de datos hospital
REVOKE DELETE ON Hospital.* FROM 'usuario_lectura'@'localhost';

-- Verificación del permiso de visualización 
SELECT * FROM USER WHERE HOST = 'localhost' AND USER = 'usuario_lectura'; 

-- Guardar cambios
FLUSH PRIVILEGES;

-- Creación del segundo usuario
CREATE USER 'usuario_actualizacion'@'localhost' IDENTIFIED BY 'hospital2';

-- Verificación de la creación del primer usuario
SELECT * FROM USER;

-- Creación del permiso para la visualización de datos
GRANT SELECT, INSERT, UPDATE ON Hospital.* TO 'usuario_actualizacion'@'localhost';

-- Eliminar permisos para el comando delete en la base de datos hospital
REVOKE DELETE ON Hospital.* FROM 'usuario_actualizacion'@'localhost';

-- Verificación del permiso de visualización, inserción y modificación
SELECT * FROM USER WHERE HOST = 'localhost' AND USER = 'usuario_actualizacion'; 
 
-- Guardar cambios
FLUSH PRIVILEGES;

-- Eliminación de usuario_lectura y usuario_actualizacion 
DROP USER 'usuario_lectura'@'localhost';
DROP USER 'usuario_actualizacion'@'localhost';
