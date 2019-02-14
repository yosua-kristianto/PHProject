<?php
    session_start();
    if(!isset($_SESSION['user']))
    {
        header('Location: login.php'); die();
    }

    require "util/connection.php";
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles/Global.css" type="text/css" />
    <style> .PostBox{ border: 1px solid black; } /*.PostDet{ position: absolute; top: 5%; left: 30%; height: 150px; border: 1px solid black; }*/ </style>
</head>
<body>
    <span>Hi <?= $_SESSION['user'] ?></span>&nbsp
    <a href="repo/doLogout.php"><button>Logout</button></a><br />
    <a href="index.php"><button>Upload a Photo</button></a>
    <?php
        $query = "SELECT u.name, f.user_id, f.url_path, f.caption, f.created_at FROM user u JOIN feeds f ON f.user_id = u.id ";
        $dataset = $con->query($query);
        if($dataset !== null)
        {
            while($post = $dataset->fetch_assoc())
            {
    ?>
                <div class="PostBox">
                <span><?=$post['name']?></span><br /><hr />
                    <div><img style="height: 150px; width: 150px;" src="<?=$post['url_path']?>" /></div>
                        <div class="PostDet">
                            <span><?=$post['caption']?></span><br /><hr />
                            <span><?=$post['created_at']?></span><br /><hr />
                            <a href="repo/doLike.php"><button>Like</button></a>
                            <a href="repo/doComment.php"><button>Comment</button></a>
                        </div>
                </div>
    <?php
            }
        }
    ?>
</body>
</html>