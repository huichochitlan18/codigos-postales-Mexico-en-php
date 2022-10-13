DROP DATABASE IF EXISTS cp;

CREATE DATABASE cp;

USE cp;

create table Asentamientos(
    d_codigo int,
    d_asenta varchar(255),
    d_tipo_asenta varchar(120),
    D_mnpio varchar(255),
    d_estado varchar(120),
    d_ciudad varchar(255),
    d_CP int,
    c_estado int,
    c_oficina int,
    c_CP varchar(16),
    c_tipo_asenta int,
    c_mnpio int,
    id_asenta_cpcons int,
    d_zona varchar(120),
    c_cve_ciudad int
) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

CREATE TABLE estado (
    idEstado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(254) COLLATE utf8_spanish_ci
) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

CREATE TABLE municipio (
    idMunicipio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numeroMpio int,
    idEstado int,
    municipio VARCHAR(254) COLLATE utf8_spanish_ci,
    FOREIGN KEY (idEstado) REFERENCES estado(idEstado)
) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

CREATE TABLE catalogoLocalidadZona (
    idZona INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    zona VARCHAR(254) COLLATE utf8_spanish_ci
) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

CREATE TABLE catalogoLocalidadAsentamiento (
    idAsentamiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Asentamiento VARCHAR(254) COLLATE utf8_spanish_ci
) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

CREATE TABLE localidad (
    idLocalidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idMunicipio int,
    idAsentamiento int,
    idZona int,
    localidad VARCHAR(254) COLLATE utf8_spanish_ci,
    cp int,
    FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio),
    FOREIGN KEY (idAsentamiento) REFERENCES catalogoLocalidadAsentamiento(idAsentamiento),
    FOREIGN KEY (idZona) REFERENCES catalogoLocalidadZona(idZona)
) ENGINE = INNODB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;


Insert into
    estado(estado)
select
    distinct d_estado
from
    asentamientos
order by
    d_estado


Insert into
    municipio(municipio, idEstado, numeroMpio)
SELECT
    distinct(D_mnpio),
    c_estado,
    c_mnpio
from
    asentamientos


INSERT INTO localidad(idMunicipio, localidad, cp)
SELECT
    municipios.idMunicipio,
    asentamiento.d_asenta,
    asentamiento.d_codigo
FROM
    asentamientos asentamiento
INNER JOIN municipio municipios ON
    asentamiento.c_mnpio = municipios.numeroMpio AND asentamiento.D_mnpio = municipios.municipio
ORDER BY
    municipios.idMunicipio,
    asentamiento.d_asenta;

    select * from municipio where idEstado = 21 and numeroMpio = 85
     select 
 localidad.`idLocalidad`,
 localidad.`localidad`,
 localidad.`cp`,
 localidad.`idMunicipio`,
 municipio.`municipio`,
 estado.`idEstado`,
 estado.`estado`
 from localidad 
 join municipio on localidad.idMunicipio = municipio.idMunicipio
 join estado on municipio.idEstado=estado.`idEstado`
 WHERE municipio.municipio LIKE '%zina%'
--  WHERE localidad.cp = '50010'