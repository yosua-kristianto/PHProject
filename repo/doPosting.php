<?php
    session_start();
    $user = $_SESSION['user_id'];
    
    require "../util/connection.php";

    $capt = $_REQUEST['captionTextarea'];
    $file = $_FILES['fileBox'];
    $location = "../storage/";
    $save = $location.$file['name'];
    $loc = "storage/".$file['name'];

    
    if(strpos($file['name'], ".jpg") === false && strpos($file['name'], ".png") === false && strpos($file['name'], ".jpeg") === false)
    {
        header('Location: ../index.php?err=The File must jpg, png, or jpeg!!!');
    }else
    {
        $query = "INSERT INTO `feeds`(`user_id`, `caption`, `url_path`) VALUES ('$user', '$capt', '$loc')";
        mysqli_query($con, $query);
        move_uploaded_file($file['tmp_name'], $save);
        header('Location: ../dashboard.php');
        
    }