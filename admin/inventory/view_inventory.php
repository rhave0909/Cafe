<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `inventory_list` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<div class="container-fluid">
    <p><strong>Name:</strong> <?php echo isset($name) ? $name : ''; ?></p>
    <p><strong>Quantity:</strong> <?php echo isset($quantity) ? $quantity : ''; ?></p>
    <p><strong>Date Range:</strong> <?php echo isset($date_range) ? $date_range : ''; ?></p>
    <p><strong>Date Created:</strong> <?php echo isset($date_created) ? date("Y-m-d H:i",strtotime($date_created)) : ''; ?></p>
</div>
