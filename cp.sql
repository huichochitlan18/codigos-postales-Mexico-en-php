-- CREATE TABLE estado (
--     idEstado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     estado VARCHAR(254) COLLATE utf8_spanish_ci
-- ) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

-- CREATE TABLE municipio (
--     idMunicipio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     municipio VARCHAR(254) COLLATE utf8_spanish_ci
-- ) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

-- CREATE TABLE catalogoLocalidadZona (
--     idZona INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     zona VARCHAR(254) COLLATE utf8_spanish_ci
-- ) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

-- CREATE TABLE catalogoLocalidadAsentamiento (
--     idAsentamiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     Asentamiento VARCHAR(254) COLLATE utf8_spanish_ci
-- ) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

-- CREATE TABLE localidad (
--     idLocalidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEstado int,
--     idMunicipio int,
--     idAsentamiento int,
--     idZona int,
--     localidad VARCHAR(254) COLLATE utf8_spanish_ci,
--     cp int,
--     FOREIGN KEY (idEstado) REFERENCES estado(idEstado),
--     FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio),
--     FOREIGN KEY (idAsentamiento) REFERENCES catalogoLocalidadAsentamiento(idAsentamiento),
--     FOREIGN KEY (idZona) REFERENCES catalogoLocalidadZona(idZona)
-- ) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;