<?php
	session_start();
	if(!isset($_SESSION['user'])) 
	{
		header("Location: login.php"); die();
	}else ob_start();
?>

<!DOCTYPE html>
<html>
<head>
	<title><!--TITLE--></title>
	<link rel="stylesheet" href="styles/global.css" type="text/css" />
	<style>
		#Upload_Form{ border: 1px solid rgba(0,0,0,1); }
		.imageBox{ height: 150px; width: 150px; }
		#capt { resize: none; }
	</style>
	<script src="script/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="script/textareaTrigger.js" type="text/javascript"></script>
</head>
<body>
	
	<a href="repo/doLogout.php"><button>Logout</button></a>
	<h1>In-Gram</h1>
	<form action="repo/doPosting.php" method="POST" id="Upload_Form" enctype="multipart/form-data">
		<img class="imageBox" src="storage/alt/src.png" /> <br />
		<input type="file" id="foto" name="fileBox" /><br />
		<textarea name="captionTextarea" id="capt" rows="4" cols="50" onkeyup="countChar(this)"></textarea> 
		<div id="charCount" style="color: red;"></div>
		<br />
		<input type="submit" value="Upload" id="Uploadbtn"/>
		<div style="color: red">
        <?= isset($_GET['err']) ? $_GET['err'] : ''?>
    	</div>
	</form><br />

	
	
	<script src="script/main.js" type="text/javascript"></script>
</body>
</html>

<?php
	$pageContents = ob_get_contents (); 
	ob_end_clean (); 
	$user = $_SESSION['user'];
	echo str_replace ('<!--TITLE-->', "Welcome $user!", $pageContents);
?>