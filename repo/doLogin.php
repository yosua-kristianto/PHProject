<?php 
 	require '../util/connection.php';

 	$username = $_REQUEST['username'];
 	$password = $_REQUEST['password'];
	$username = mysqli_escape_string($con, $username);
	$password = md5($password);
 	$query = "SELECT * FROM user WHERE name = '$username' AND password = '$password'";

 	$user = mysqli_query($con, $query);

 	if($row = mysqli_fetch_assoc($user)){
		session_start();
		$_SESSION['user'] = $row['name'];
        $_SESSION['user_id'] = $row['id'];
 		header('Location: ../index.php');
	}else
	{
    	header('Location:../login.php?err=gagal login');
	}
