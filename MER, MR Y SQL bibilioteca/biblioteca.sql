-- Crear base de datos para una biblioteca.
CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    nacionalidad VARCHAR(150)
);

CREATE TABLE libro (
    isbn VARCHAR(30) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    editorial VARCHAR(150) NOT NULL,
    año_publicacion INT
);

CREATE TABLE autor_escribe_libro (
    id_autor INT AUTO_INCREMENT,
    isbn VARCHAR(30),
    PRIMARY KEY (id_autor, isbn),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
    FOREIGN KEY (isbn) REFERENCES libro(isbn)
);

CREATE TABLE ejemplar (
    codigo_barras VARCHAR(30) PRIMARY KEY,
    estado_conservacion VARCHAR(50) NOT NULL,
    isbn VARCHAR(30),
    FOREIGN KEY (isbn) REFERENCES libro(isbn)
);

CREATE TABLE usuario (
    numero_carnet INT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    direccion VARCHAR(150),
    telefono INT
);

CREATE TABLE prestamo (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    numero_carnet INT,
    FOREIGN KEY (numero_carnet) REFERENCES usuario(numero_carnet)
);

CREATE TABLE ejemplar_se_presta (
    id_prestamo INT AUTO_INCREMENT,
    codigo_barras VARCHAR(30),
    PRIMARY KEY (id_prestamo, codigo_barras),
    FOREIGN KEY (id_prestamo) REFERENCES prestamo(id_prestamo),
    FOREIGN KEY (codigo_barras) REFERENCES ejemplar(codigo_barras)
);

CREATE TABLE sancion (
    id_sancion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo VARCHAR(250),
    numero_carnet INT,
    FOREIGN KEY(numero_carnet) REFERENCES usuario(numero_carnet)
);