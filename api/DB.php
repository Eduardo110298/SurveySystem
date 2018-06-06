<?php

class DB {
    // Database credentials
    static $dbHost     = 'localhost';
    //static $dbHost     = '172.19.18.13';
    static $dbUsername = 'root';
    static $dbPassword = '1234';
    static $dbName     = 'surveydb'; 
    public $db;

    public function __construct(){
        if(!isset($this->db)){
            try{
                $conn = new mysqli(self::$dbHost, self::$dbUsername, self::$dbPassword, self::$dbName);
                $this->db = $conn;
            }catch(Exception $e){
                die("Failed to connect with MySQL: " . $e->getMessage());
            }
        }
    }

    /*
    *Returns rows from any sql query
    *
    */
    public function query($sql){ //ejecuta una consulta que devuelve resultado de la bd. Los get.

        $result = $this->db->query($sql);
        if ($result->num_rows == 1) {     
            $data = $result->fetch_row();
        }elseif ($result->num_rows > 1){
            $data = $result->fetch_all(MYSQLI_ASSOC);
        }
        return $data;
        return !empty($data) ? $data : false;
    }

    public function exec($sql){// ejecuta una consulta que no devuelve resultado
        
        $result["success"] = $this->db->query($sql);
        return $result["success"] ? $result : $this->db->error;

    }   
}

?>