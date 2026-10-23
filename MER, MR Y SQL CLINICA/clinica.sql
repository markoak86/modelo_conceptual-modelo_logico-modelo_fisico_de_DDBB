-- Crear el diseño de la base de datos de la clinica en sql
CREATE DATABASE clinica;
USE clinica;

CREATE TABLE paciente (
    dni CHAR(9) PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    correo_electronico VARCHAR(150),
    fecha_nacimiento DATE,
    telefono INT NOT NULL UNIQUE

);

CREATE TABLE medico (
    numero_colegiado INT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    telefono_contacto INT,
    especialidad VARCHAR(150)
);

CREATE TABLE cita_medica (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    motivo VARCHAR(255),
    estado VARCHAR(150) NOT NULL,
    dni_paciente CHAR(9) NOT NULL,
    numero_colegiado INT NOT NULL,
    FOREIGN KEY (dni_paciente) REFERENCES paciente(dni),
    FOREIGN KEY (numero_colegiado) REFERENCES medico(numero_colegiado)
);

CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT AUTO_INCREMENT,
    FOREIGN KEY (id_cita) REFERENCES cita_medica(id_cita)
);

CREATE TABLE medicamento (
    codigo_interno INT PRIMARY KEY,
    nombre_comercial VARCHAR(150), NOT NULL,
    principio_activo VARCHAR(150),
    laboratorio VARCHAR(150) NOT NULL
);

CREATE TABLE diagnostico_con_medicamento (
    id_diagnostico INT AUTO_INCREMENT,
    codigo_interno_medicamento INT,
    dosis VARCHAR(10) NOT NULL,
    duracion_tratamiento INT NOT NULL,
    PRIMARY KEY(id_diagnostico, codigo_interno_medicamento),
    FOREIGN KEY(id_diagnostico) REFERENCES diagnostico(id_diagnostico),
    FOREIGN KEY(codigo_interno_medicamento) REFERENCES medicamento(codigo_interno)
);