<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Acess-Control-Allow-Methods: POST");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers, Content-Type, Acess-Control-Allow-Methods, Authorization");

parse_str(file_get_contents("php://input"),$data);

print_r($data);

$payment_form = $data['paymentForm'];
$products = $data['cart'];

require_once "../../config/dbconfig.php";

$query = "INSERT INTO order_buy(payment_form) VALUES ('{$payment_form}');";

mysqli_query($conn,$query) or die("Insert ORDER query failed".mysqli_error($conn));

$id_order = mysqli_insert_id($conn);
if($id_order){
    $products = json_decode($products,true);

    foreach($products as $key => $product){ 
        $productId = $product['id'];
        $productAmount = $product['amount'];

        $query = "INSERT INTO order_products (id_product, id_order, amount) VALUES ({$productId}, {$id_order},{$productAmount})";

        mysqli_query($conn,$query) or die("Insert ORDER PRODUCT query failed");
    }

    echo json_encode(array("message" => "Success","status"=>true));
}else{
    echo json_encode(array("message" => "Failed Order Not Inserted","status"=>false));
}

?>