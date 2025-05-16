/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí

/* Crear tabla usuarios */

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

/* Insertar datos en usuarios: */

INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);

-- PASO 2
-- Tu código aquí

/* Crear tabla roles */

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

/* Insertar datos en roles: */

INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');

-- PASO 3
-- Tu código aquí

/* Agregar la columna: */

ALTER TABLE usuarios ADD COLUMN id_rol INT; 

/* Asignar valores de roles a los usuarios (ejemplo de asignación aleatoria o según criterio): */

UPDATE usuarios SET id_rol = 1 WHERE id_usuario IN (1, 5, 9, 13, 17); -- Bronce
UPDATE usuarios SET id_rol = 2 WHERE id_usuario IN (2, 6, 10, 14, 18); -- Plata
UPDATE usuarios SET id_rol = 3 WHERE id_usuario IN (3, 7, 11, 15, 19); -- Oro
UPDATE usuarios SET id_rol = 4 WHERE id_usuario IN (4, 8, 12, 16, 20); -- Platino

/* Crear la clave foránea: */

ALTER TABLE usuarios
ADD CONSTRAINT fk_roles FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

-- PASO 4
-- Tu código aquí

/* JOIN para ver información combinada */

SELECT 
    usuarios.id_usuario,
    usuarios.nombre,
    usuarios.apellido,
    usuarios.email,
    usuarios.edad,
    roles.nombre_rol
FROM 
    usuarios
JOIN 
    roles ON usuarios.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí

/* Crear tabla categorias: */

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

/* Insertar datos: */

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

-- PASO 2
-- Tu código aquí

/* Agregar columna id_categoria a usuarios: */

ALTER TABLE usuarios ADD COLUMN id_categoria INT;

-- PASO 3
-- Tu código aquí

/* Asignar categorías a usuarios: */

UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2, 6, 10, 14, 18);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (3, 7, 11, 15, 19);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (4, 8, 12, 16, 20);


-- PASO 4
-- Tu código aquí

SELECT usuarios.id_usuario,
usuarios.nombre,
usuarios. apellido,
usuarios.email,
usuarios.edad,
roles.nombre_rol,
categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí

CREATE TABLE usuarios_categorias (
	id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT
);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);

-- PASO 2
-- Tu código aquí

INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

-- PASO 3
-- Tu código aquí

SELECT usuarios.id_usuario,
usuarios.nombre,
usuarios.apellido,
usuarios.email,
usuarios.edad,
roles.nombre_rol,
categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria
JOIN usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario;

-- Con abreviaturas para cada tabla:

SELECT 
    u.id_usuario, u.nombre, u.apellido, u.email, u.edad,
    r.nombre_rol, c.nombre_categoria
FROM 
    usuarios u
JOIN 
    roles r ON u.id_rol = r.id_rol
JOIN 
    usuarios_categorias uc ON u.id_usuario = uc.id_usuario
JOIN 
    categorias c ON uc.id_categoria = c.id_categoria;