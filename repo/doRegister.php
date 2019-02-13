<?php
    require "../util/connection.php";
    $username = $_REQUEST['usernameTextbox'];
    $password = $_REQUEST['passwordTextbox'];

    if($_REQUEST['confirmTextbox'] == $password)
    {
        $password = md5($password);
        
        $query = $con->prepare('INSERT INTO `user`(name, password) VALUES (?, ?)');

        $query->bind_param('ss', $username, $password);

        $query->execute();
        session_start();
        $_SESSION['user'] = $username;
        $x = $_SESSION['user_id'] = mysqli_insert_id($con);
        
        header("Locaton: ../index.php");
    }else
    {
        header("Location: ../register.php?err=Password Doesn't Match!");
    }

