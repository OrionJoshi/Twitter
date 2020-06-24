<?php
    class User {
        protected $pdo;

        //constructor
        function __construct($pdo) {
            $this->pdo = $pdo;
        }

        public function checkInput($var) {
            $var = htmlspecialchars($var);
            $var = trim($var);
            $var = stripcslashes($var);
            return $var;
        }

        public function login($email, $password) {
            $stmt = $this->pdo->prepare("SELECT `user_id` FROM `users` WHERE `email` = :email AND `password` = :pass");
            $stmt->bindParam(":email", $email);
            $stmt->bindParam(":pass", md5($password));
            $stmt->execute();

            $user = $stmt->fetch(PDO::FETCH_OBJ);
            $count = $stmt->rowCount();

            if($count > 0) {
                $_SESSION['user_id'] = $user->user_id;
                header('Location:home.php');
            } else {
                return false;
            }
        }
    }
?>