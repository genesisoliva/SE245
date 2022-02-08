<?php include "config/config.php"; ?>
<?php

class  Database {
  
  public $pdo;

  // Construct Class
  public function __construct() {

    if (!isset($this->pdo)) {
      
      try {
        $link = new PDO(  'mysql:host='.DB_SERVER.
                          ';dbname='.DB_NAME, 
                          DB_USERNAME, 
                          DB_PASSWORD
                       );
        
        $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $link->exec("SET CHARACTER SET utf8");
        
        $this->pdo  =  $link;
      } 
      
      catch (PDOException $e) {
        die("Connection error...".$e->getMessage());
      }

    }


  }








}
