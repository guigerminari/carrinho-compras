<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Acess-Control-Allow-Methods: PUT");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers, Content-Type, Acess-Control-Allow-Methods, Authorization");

parse_str(file_get_contents("php://input"),$data);

$title = $data['title'];
$price = $data['price'];
$id    = $data['id'];

require_once "../../config/dbconfig.php";

$query = "UPDATE products SET title='{$title}', price='{$price}' WHERE id={$id};";

if(mysqli_query($conn,$query) or die("Update query failed")){
    echo json_encode($data);
}else{
    echo json_encode(array("message" => "Failed Product Not Updated","status"=>false));
}

?>