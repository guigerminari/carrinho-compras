<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Acess-Control-Allow-Methods: POST");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers, Content-Type, Acess-Control-Allow-Methods, Authorization");

parse_str(file_get_contents("php://input"),$data);

$title = $data['title'];
$price = $data['price'];

require_once "../../config/dbconfig.php";

$query = "INSERT INTO products(title,price) VALUES ('{$title}', {$price})";

mysqli_query($conn,$query) or die("Insert query failed");

$id = mysqli_insert_id($conn);
if($id){
    $data['id'] = $id;
    echo json_encode($data);
}else{
    echo json_encode(array("message" => "Failed Product Not Inserted","status"=>false));
}

?>