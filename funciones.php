<?php
spl_autoload_register('autoload');

function autoload($clase)
{
    include "class/" . $clase . ".php";
}

function utf8_fopen_read($fileName)
{
    $fc = iconv('windows-1250', 'utf-8', file_get_contents($fileName));
    $handle = fopen("php://memory", "rw");
    fwrite($handle, $fc);
    fseek($handle, 0);

    return $handle;
}

function generarArreglo($archivo)
{

    $datoss = array();

    while (!feof($archivo)) {
        $result = fgets($archivo);
        $dato = explode('|', $result);
        $datoss[] = $dato;
    }

    return $datoss;
}

function insertar($datos)
{
    $query = "";
    $insetar = "";
    $insert = "INSERT INTO `asentamientos` VALUES ";
    $inicioParentesis = "(";
    $finalParentesis = ")";
    $coma = ",";

    $i = 5000;    

    foreach ($datos as $index => $dato) {        
        if (!empty($dato[0])&& $index>2) {
            
            $dato[0] = trim($dato[0]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[0]);
            $dato[1] = trim($dato[1]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[1]);
            $dato[2] = trim($dato[2]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[2]);
            $dato[3] = trim($dato[3]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[3]);
            $dato[4] = trim($dato[4]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[4]);
            $dato[5] = trim($dato[5]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[5]);
            $dato[6] = trim($dato[6]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[6]);
            $dato[7] = trim($dato[7]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[7]);
            $dato[8] = trim($dato[8]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[8]);
            $dato[9] = trim($dato[9]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[9]);
            $dato[10] = trim($dato[10]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[10]);
            $dato[11] = trim($dato[11]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[11]);
            $dato[12] = trim($dato[12]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[12]);
            $dato[13] = trim($dato[13]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[13]);
            $dato[14] = trim($dato[14]) == "" ? 0 : preg_replace("/[\r\n|\n|\r]+/", " ", $dato[14]);

            $insetar = "$dato[0],'$dato[1]','$dato[2]','$dato[3]','$dato[4]','$dato[5]',$dato[6],$dato[7],$dato[8],'$dato[9]',$dato[10],$dato[11],$dato[12],'$dato[13]',$dato[14]";

            $query .= $inicioParentesis . $insetar . $finalParentesis . $coma;

            if ($index == $i) {
                $insert .= trim($query, ",");
                echo 'Memoria final: ' . memory_get_usage() . '' . "-" . (strlen($insert) . "<br>");
                Database::conexion()->query($insert);
                $query = "";
                $insert = "INSERT INTO `asentamientos` VALUES ";
                $i = $i + 5000;
            }

            if ($index === count($datos)-2) {                
                $insert .= trim($query, ",");                
                Database::conexion()->query($insert);
            }
        }
    }
}
