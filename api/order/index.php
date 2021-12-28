<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once "../../config/dbconfig.php";

$query = "SELECT * FROM order_buy";

$result = mysqli_query($conn,$query) or die("Select query failed");

$orders = mysqli_fetch_all($result,MYSQLI_ASSOC);
$countOrders = count($orders);

for($i = 0; $i < $countOrders;$i++){
    $query = "  SELECT *
                FROM order_products AS op
                    INNER JOIN products AS p
                        ON p.id = op.id_product
                WHERE op.id_order = {$orders[$i]['id']}";

    $result = mysqli_query($conn,$query) or die("Select query failed");

    $orders[$i]['products'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
}

if(count($orders) > 0){
    echo json_encode($orders);
}else{
    echo json_encode(array("message"=> "No order found","status" => false));
}

?>