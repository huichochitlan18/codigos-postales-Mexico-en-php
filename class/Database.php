<?php
// ini_set ('date.timezone','America/Mexico_City');

class Database extends PDO {
  private $tipo_de_base = 'mysql';
  // private $host = 'localhost';
  private $host = 'localhost';
  private $nombre_de_base = 'cp2';
  // private $nombre_de_base = 'cddagust_test';
  private $usuario = 'root';
  // private $usuario = 'cddagust_test';
  private $contrasena = '';
  // private $contrasena = 'F47WY4ZncebbGwa';  
  public function __construct() {
    //Sobreescribo el método constructor de la clase PDO.

    try{
      parent::__construct(
        "{$this->tipo_de_base}:dbname={$this->nombre_de_base};host={$this->host};charset=utf8", $this->usuario, $this->contrasena
      );
      // $this->conexion = new Database;
    }catch(PDOException $e){
      echo 'Ha surgido un error y no se puede conectar a la base de datos. Detalle: ' . $e->getMessage();
      exit;
    }    
    
  }
  public static function conexion(){
    $conexion = new Database();
    return $conexion;
  }
  public static function filas($query){
    // retorna una tabla de valores
    $resultado = Database::conexion()->query($query);
    return $resultado->fetchAll(PDO::FETCH_OBJ);
  }
  public static function fila($query){
    // retorna solo una fila
    $resultado = Database::conexion()->query($query);
    return $resultado->fetch(PDO::FETCH_OBJ);
  }
  
}

?>
