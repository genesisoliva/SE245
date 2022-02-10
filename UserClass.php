<?php 
    include('db.php');

    class Menu_Item{
        
        private string $user_id;
        private string $student_id;
        private string $dorm_num;
        private string $first_name;
        private string $middle_name;
        private string $last_name;
        private string $phone;
        private string $phone2;
        private string $email;
        private string $email2;
        private string $password;

        function __construct(string $_user_id, Section $_student_id, string $_dorm_num, string $_first_name, string $_middle_name, string $_last_name,
                             string $_phone, string $_phone2, string $_email, string $_email2, string, $_password)
        {
            $this->user_id = $_user_id;
            $this->student_id = $_student_id;
            $this->dorm_num = $_dorm;
            $this->first_name = $_first_name;
            $this->middle_name = $_middle_name;
            $this->last_name = $_last_name;
            $this->phone = $_phone;
            $this->phone2 = $_phone2;
            $this->email = $_email;
            $this->email2 = $_email2;
            $this->password = $_password;
        }
        
        static function getMenuItemByID(string $_user_id)
        {
            global $db;
            $stmt = $db->prepare("SELECT * FROM users WHERE user_id = :user_id");
            $binds = Array(":user_id" => $_user_id);

            if($stmt->execute($binds))
            {
                $response = $stmt->fetchAll(PDO::FETCH_ASSOC)[0];
                return new Menu_Item($_user_id,
                                     $response['dorm_num'],
                                     $response['first_name'],
                                     $response['middle_name'],
                                     $response['last_name'],
                                     $response['phone'],
                                     $response['phone2'],
                                     $response['email'],
                                     $response['email2'],
                                    );
            }
            else{
                echo 'ERROR FINDING MENU_ITEM WITH ID: ' . $_user_id;
            }
        }
      
        static function deleteMenuItemByID(string $_user_id)
        {
            global $db;
            $stmt = $db->prepare("DELETE FROM users WHERE user_id = :user_id");
            $binds = Array(":user_id" => user_id);
            if($stmt->execute($binds)){
                return $stmt->rowCount();
            }
            else{
                return 0;
            }
        }
      
        static function getMenuItems()
        {
            global $db;
            $menuItemArray = Array();
            $stmt = $db->prepare("SELECT * FROM users");
            if($stmt->execute()){
                foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row){
                    array_push($menuItemArray,  new Menu_Item($row["user_id"],                                                                // menu_item_id
                                                              $row['student_id'],                                          // section
                                                              $row['first_name'],                                                        // item_name
                                                              $row['middle_name'],                                                 // item_description
                                                              $row['last_name'],                                             // item_price
                                                              $row['phone'],
                                                              $row['phone2'],
                                                              $row['email'],
                                                              $row['email2']
                                                             ));
                }
                return($menuItemArray);
            }
            else{
                echo 'ERROR FINDING MENU ITEMS';
            }
        }
      
        function populateIngredientsById()
        {
            $this->itemIngredients = Ingredient::getIngredientsByMenuItemId($this->menu_item_id);
        }
      
        function addIngredient(Ingredient $ingredient)
        {
            array_push($this->itemIngredients, $ingredient);
        }
      
        function addToDB()
        {
            global $db;
            $stmt = $db->prepare("INSERT INTO menu_items (section_id, item_name, item_description, item_price, item_img) VALUES (:section_id, :item_name, :item_description, :item_price, :item_img)");
            $binds = array(
                ":section_id" => $this->getSection()->getSectionId(),
                ":item_name" => $this->getItemName(),
                ":item_description" => $this->getItemDescription(),
                ":item_price" => $this->getItemPrice(),
                ":item_img" => $this->getItemImg()
            );

            if($stmt->execute($binds)){
                $this->menu_item_id = $db->lastInsertId();
                foreach($this->getIngredients() as $ingredient){
                    $ingredient->addToDB($this->getMenuItemId());
                }
            }
        }
      
        function updateMenuItem(){
            global $db;
            if($this->getMenuItemId() != '-1'){
                $stmt = $db->prepare("Update menu_items SET section_id = :section_id, item_name = :item_name, item_description = :item_description, item_price = :item_price, item_img = :item_img WHERE menu_item_id = :menu_item_id;");
                $binds = array(
                    ":section_id" => $this->getSection()->getSectionId(),
                    ":item_name" => $this->getItemName(),
                    ":item_description" => $this->getItemDescription(),
                    ":item_price" => $this->getItemPrice(),
                    ":item_img" => $this->getItemImg(),
                    ":menu_item_id" => $this->getMenuItemId()
                );
                 
                var_dump($this);
                if($stmt->execute($binds)){
                    
                    foreach($this->getIngredients() as $ingredient){
                        var_dump($ingredient);
                        $ingredient->updateIngredient($this->getMenuItemId());
                    }
                }
                else{
                    return(false);
                }
                
            }
        }

        //GETTERS

        function getMenuItemId(){
            return $this->menu_item_id;
        }
        function getSection(){
            return $this->section;
        }
        function getItemName(){
            return $this->item_name;
        }
        function getItemDescription(){
            return $this->item_description;
        }
        function getItemPrice(){
            return $this->item_price;
        }
        function getItemImg(){
            return $this->item_img;
        }
        function getIngredients(){
            return $this->itemIngredients;
        }
    }
    class Section {
        private $section_id;
        private $section_name;
        function __construct($_section_id, $_section_name){
            $this->section_id = $_section_id;
            $this->section_name = $_section_name;
        }  

        static function getSectionById($_section_id){
            global $db;
            
            $stmt = $db->prepare("SELECT section_name FROM sections WHERE section_id = :section_id");
            $binds = Array(":section_id" => $_section_id);

            if($stmt->execute($binds)){
                $response = $stmt->fetchAll(PDO::FETCH_ASSOC)[0];
                return new Section($_section_id, $response['section_name']);
            }
            else{
                echo 'ERROR FINDING SECTION WITH ID: ' . $_section_id;
            }
        }
        
        static function getSections(){
            global $db;

            $stmt = $db->prepare("SELECT * FROM sections");
            $sections = Array();
            if($stmt->execute()){
                foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row){
                    array_push($sections, new Section($row["section_id"], $row["section_name"]));
                }
            }
            return $sections;
        }
        
        //GETTERS

        function getSectionId(){
            return $this->section_id;
        }
        function getSectionName(){
            return $this->section_name;
        }
    }
    class Ingredient{
        private string $ingredient_id;
        private string $ingredient_name;
        private float $ingredient_price;
        private bool $is_default;

        function __construct(string $_ingredient_id, string $_ingredient_name, float $_ingredient_price, bool $_is_default){
            $this->ingredient_id = $_ingredient_id;
            $this->ingredient_name = $_ingredient_name;
            $this->ingredient_price = $_ingredient_price;
            $this->is_default = $_is_default;

            
        }
        static function getIngredientById(string $_ingredient_id){
            global $db;

            $stmt = $db->prepare("SELECT * FROM ingredients WHERE ingredient_id = :ingredient_id");
            $binds = Array(":ingredient_id" => $_ingredient_id);

            if($stmt->execute($binds)){
                $response = $stmt->fetchAll(PDO::FETCH_ASSOC)[0];
                return new Ingredient($response['ingredient_id'], 
                                      $response['ingredient_name'], 
                                      floatval($response['ingredient_price']),
                                      ($response['is_default'] == '1') ? true : false);
            }
            else{
                echo 'ERROR FINDING INGREDIENT WITH ID: ' . $_ingredient_id;
            }
        }
        static function getIngredientsByMenuItemId(string $_menu_item_id){
            global $db;
            $stmt = $db->prepare("SELECT ingredient_id FROM menu_item_ingredients WHERE menu_item_id = :menu_item_id");
            $binds = Array(":menu_item_id" => $_menu_item_id);
            $ingredients = Array();
            if($stmt->execute($binds)){
                foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row){
                    array_push($ingredients, Ingredient::getIngredientById($row['ingredient_id']));
                }
            }
            else{
                array_push($ingredients, "wtf");
            }
            return $ingredients;
        }
        static function deleteIngredientById(string $ingredient_id, string $menu_item_id){
            global $db;
            $stmt = $db->prepare("DELETE FROM menu_item_ingredients WHERE ingredient_id = :ingredient_id AND menu_item_id = :menu_item_id");
            $binds = Array(":ingredient_id" => $ingredient_id,
                           ":menu_item_id" => $menu_item_id);
            if($stmt->execute($binds)){
                return $stmt->rowCount();
            }
            else{
                return 0;
            }
        }
        function addToDB($menu_item_id){
            global $db;
            $selectStmt = $db->prepare("SELECT ingredient_id FROM ingredients WHERE ingredient_name = :ingredient_name");
            $selectBinds = array(
                ":ingredient_name" => $this->getIngredientName()
            );

            if($selectStmt->execute($selectBinds)){
                if($selectStmt->rowCount() == 0){
                    $insertStmt = $db->prepare("INSERT INTO ingredients (ingredient_name, ingredient_price, is_default) VALUES (:ingredient_name, :ingredient_price, :is_default);");
                    
                    $insertBinds = array(
                        ":ingredient_name" => $this->getIngredientName(),
                        ":ingredient_price" => $this->getIngredientPrice(),
                        ":is_default" => $this->getIsDefault()
                    );

                    if($insertStmt->execute($insertBinds)){
                        $this->ingredient_id = $db->lastInsertId();
                    }
                    
                }
                else{
                    $this->ingredient_id = $selectStmt->fetchAll(PDO::FETCH_ASSOC)[0]['ingredient_id'];
                    $this->updateIngredient($menu_item_id);
                }
                $insertStmt = $db->prepare("INSERT INTO menu_item_ingredients (ingredient_id, menu_item_id) VALUES (:ingredient_id, :menu_item_id);");
                $insertBinds = array(
                    ":ingredient_id" => $this->getIngredientId(),
                    ":menu_item_id" => $menu_item_id
                );
                $insertStmt->execute($insertBinds);
            }
        }
        function updateIngredient($menu_item_id){
            global $db;

            if($this->getIngredientId() != '-1'){
                
                $stmt = $db->prepare("Update ingredients SET ingredient_name = :ingredient_name, ingredient_price = :ingredient_price, is_default = :is_default WHERE ingredient_id = :ingredient_id;");
                
                $binds = array(
                    ":ingredient_id" => $this->getIngredientId(),
                    ":ingredient_name" => $this->getIngredientName(),
                    ":ingredient_price" => $this->getIngredientPrice(),
                    ":is_default" => $this->getIsDefault()
                );
                $stmt->execute($binds); 
                if($stmt->rowCount() > 0){
                    return(true);
                }
                else{
                    return(false);
                }
            }
            else{
                $this->addToDB($menu_item_id);
            }
        }
        
        //GETTERS

        function getIngredientId(){
            return $this->ingredient_id;
        }
        function getIngredientName(){
            return $this->ingredient_name;
        }
        function getIngredientPrice(){
            return $this->ingredient_price;
        }
        function getIsDefault(){
            return $this->is_default;
        }
    }
    
?>
