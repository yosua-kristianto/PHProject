<?php
	session_start();
	if(isset($_SESSION['user']))
	{
		header('Location: index.php');
		die();
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href="styles/global.css" type="text/css" />
</head>
<body>
	<h1>Login</h1>
	<form action="repo/doLogin.php" method="POST">
		<input type="text" name="username" placeholder="username" autofocus /><br />
		<input type="password" name="password" placeholder="password" /><br />
		<input type="submit" name="" value="Login" />
		


	</form>
	<div style="color: red">
        <?= isset($_GET['err']) ? $_GET['err'] : ''?>
    </div>
	<span>Not a member yet?&nbsp<a href="register.php">Register now!</a></span>
</body>
</html>