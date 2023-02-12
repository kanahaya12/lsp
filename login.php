<?php
include_once("class/User.php");
include_once("class/login.php");
session_start();

if(isset($_SESSION["id"])){
    $data_user = new User;
    $data_user = $data_user->find($_SESSION["id"]);
    if($data_user["role"] == "admin"){
        header("Location: admin/index.php");
    }elseif($data_user["role"] == "user"){
        header("Location: user/index.php");
    }
}

$login = new Login;

if(isset($_POST["submit"])){
    $login->authLogin([
        "username" => $_POST["username"],
        "password" => $_POST["password"],
    ]);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>


<div class="container">
    <div class="card" style="width:20rem;">
        <div class="col-4"></div>
        <div class="col-4">
            <center>
                <form action="" method="POST">
                    <h1>Login</h1>
                    <label for="username">
                        username 
                        <input type="text" name="username" placeholder="username">
                    </label>
                    <br>
                    <label for="password">
                        <label for="">Password</label>
                        <input type="password" name="password" placeholder="password">
                    </label>
                    <br>
                    <input type="submit" name="submit">
                </from>
            </center>
        </div>
        <div class="col-4"></div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>