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
            $hashpass = md5($password);
            $stmt->bindParam(":pass", $hashpass);
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

        public function userData($user_id) {
            $stmt = $this->pdo->prepare("SELECT * FROM `users` WHERE `user_id` = :user_id");
            $stmt->bindParam(":user_id", $user_id, PDO::PARM_INT);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_OBJ);
        }
    }
?>