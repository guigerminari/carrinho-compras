<?php

$DBhost = "127.0.0.1";
$DBuser = "root";
$DBpass = "";
$DBname = "carrinho_compras_bd";

$conn = mysqli_connect($DBhost, $DBuser, $DBpass, $DBname);

if(!$conn){
    die("Could not connect to database " . $DBname . mysqli_connect_error());
}

?>