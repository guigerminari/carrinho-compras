<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

parse_str(file_get_contents("php://input"),$data);

$search = $data['search'];

require_once "../../config/dbconfig.php";

$query = "SELECT * FROM products WHERE title LIKE '%{$search}%'";

$result = mysqli_query($conn,$query) or die("Select query failed");

if(mysqli_num_rows($result) > 0){
    $row = mysqli_fetch_all($result,MYSQLI_ASSOC);
    
    echo json_encode($row);
}else{
    echo json_encode(array("message"=> "No products found","status" => false));
}

?>