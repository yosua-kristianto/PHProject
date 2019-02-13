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
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Register</title>
    <link rel="stylesheet" href="styles/global.css" type="text/css" />

    <style>
        .registerBox{ border: 1px solid black; }
    </style>
</head>
<body>
    <h1>Register</h1>

    <div class="registerBox">
        <form action="repo/doRegister.php" method="POST">
        <span>Username:</span> <input type="text" name="usernameTextbox" placeholder="Username" autofocus /> <br />
        <span>Password:</span> <input type="password" name="passwordTextbox" /> <br />
        <span>Confirm Password:</span> <input type="password" name="confirmTextbox" /> <br />
        <input type="submit" value="Register" />
        </form>
        <div style="color: red">
        <?= isset($_GET['err']) ? $_GET['err'] : ''?>
        </div>
    </div>
</body>
</html>