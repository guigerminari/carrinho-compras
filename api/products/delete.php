<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Acess-Control-Allow-Methods: DELETE");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers, Content-Type, Acess-Control-Allow-Methods, Authorization");

parse_str(file_get_contents("php://input"),$data);

$id    = $data['id'];

require_once "../../config/dbconfig.php";

$query = "DELETE FROM products WHERE id={$id};";

if(mysqli_query($conn,$query) or die("Delete query failed")){
    echo json_encode(array("message" => "Product deleted successfully","status"=>true));
}else{
    echo json_encode(array("message" => "Failed Product Not Deleted","status"=>false));
}

?>