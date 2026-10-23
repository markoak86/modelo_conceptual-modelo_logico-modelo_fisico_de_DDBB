/* 1.Crear la base de datos "provedores y piezas" */
CREATE DATABASE IF NOT EXISTS provedores_y_piezas;

/* 2.Usamos la base de datos creada para poder crear relaciones dentro */
USE provedores_y_piezas;

/* 3.Ahora empezamos a crear cada relacion dentro de la base de datos */
CREATE TABLE provedores (
    codigo INT NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(250),
    ciudad VARCHAR(100),
    PRIMARY KEY (codigo)
);

CREATE TABLE categorias (
    codigo INT NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE piezas (
    codigo INT NOT NULL UNIQUE,
    precio DECIMAL(6,2),
    nombre VARCHAR(50) NOT NULL,
    codigo_categoria INT NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_categoria FOREIGN KEY(codigo_categoria) REFERENCES categorias(codigo)
);


CREATE TABLE suministran (
    codigo_provedor INT NOT NULL,
    codigo_pieza INT NOT NULL,
    fecha DATE,
    cantidad INT,
    PRIMARY KEY (codigo_provedor,codigo_pieza),
    CONSTRAINT fk_prov FOREIGN KEY(codigo_provedor) REFERENCES provedores(codigo),
    CONSTRAINT fk_pieza FOREIGN KEY(codigo_pieza) REFERENCES piezas(codigo)
);