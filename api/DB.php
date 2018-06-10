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
        $this->db->prepare($sql);
        $result = $this->db->query($sql);
        if ($result->num_rows == 1) {     
            $data = $result->fetch_assoc();
        }elseif ($result->num_rows > 1){
            $data = $result->fetch_all(MYSQLI_ASSOC);
        }
        return !empty($data) ? $data: false;
    }

    public function exec($sql){// ejecuta una consulta que no devuelve resultado
        
        $result["success"] = $this->db->query($sql);
        return $result["success"] ? $result : $this->db->error;

    }

    function utf8_string_array_encode(&$array){
            $func = function(&$value,&$key){
                if(is_string($value)){
                    $value = utf8_encode($value);
                } 
                if(is_string($key)){
                    $key = utf8_encode($key);
                }
                if(is_array($value)){
                    $this->utf8_string_array_encode($value);
                }
            };
            array_walk($array,$func);
            return $array;
       }
    }
?>