<?php
/**
 * Created by PhpStorm.
 * User: liu
 * Date: 2016/3/14
 * Time: 22:07
 */
header('content-type:text/html;charset=utf-8');
require_once 'connect.php';

$getUser_name = htmlspecialchars($_POST['user_name']);
$getPassword = htmlspecialchars($_POST['password']);

$xueyuan=base64_encode('xueyuan12345a');
$postUserName=base64_encode($getUser_name);
if($getUser_name){
    $sql = "SELECT user_id FROM user WHERE user_name='$getUser_name' AND user_password='$getPassword'";
    $rs = $mysqli->query($sql);
    if($rs->num_rows){
        $html=<<<EOT
       <html>
           <head>
              <meta http-equiv="refresh" content="1;url=yuyue.php?$xueyuan=$postUserName">
           </head>
           <body>
           <h1><p>正在登录............</p></h1>

           </body>
        </html>
EOT;
        echo $html;
        exit;
    }else{
        $html=<<<EOT
       <html>
           <head>
              <meta http-equiv="refresh" content="2;url=login.html">
           </head>
           <body>
           <h1><p>您输入的用户名或密码错误，请重新输入</p></h1>
           正在重新登录.......
           </body>
        </html>
EOT;
        echo $html;
        exit;
    }
}else{
    $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="1;url=login.html">
           </head>
           <body>
           <h1><p>您输入的用户名为空，请您重新登录</p></h1>
           正在重新登录.......
           </body>
        </html>
EOT;
    echo $html;
    exit;
}
$mysqli->close();
