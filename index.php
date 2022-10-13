<?php

include 'funciones.php';

$datos = array();

$archivo = utf8_fopen_read("CPdescarga.txt", "r");

$datos = generarArreglo($archivo);

insertar($datos);

echo 'Memoria final: ' . memory_get_usage() . '';
