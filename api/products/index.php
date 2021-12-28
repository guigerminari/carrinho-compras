<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$id = $_GET['id'];
$where = '';

if(isset($id)){
    $where = ' WHERE id = ' . $id;
}

require_once "../../config/dbconfig.php";

$query = "SELECT * FROM products".$where;

$result = mysqli_query($conn,$query) or die("Select query failed");

if(mysqli_num_rows($result) > 0){
    $row = mysqli_fetch_all($result,MYSQLI_ASSOC);
    if(isset($id)){
        echo json_encode($row[0]);
    }else{
        echo json_encode($row);
    }
}else{
    echo json_encode(array("message"=> "No products found","status" => false));
}

?>