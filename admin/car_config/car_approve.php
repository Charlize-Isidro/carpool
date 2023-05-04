<?php

include '../../includes/connection.php';

$car_id = $_GET['car_id'];
$user_id = $_GET['user_id'];

$now = new DateTime();
$now->setTimezone(new DateTimeZone('Asia/Manila'));
$timestamp = $now->format('Y-m-d H:i:s');

// Prepared Statement & Binding (Avoid SQL Injections)
$stmnt = $connection->prepare("UPDATE cars SET car_confirmed_at = '$timestamp' WHERE car_id='$car_id'");
$stmnt->execute();

$stmnt = $connection->prepare("UPDATE users SET user_type = 'Driver' WHERE user_id='$user_id'");
$stmnt->execute();
$stmnt->close();
$connection->close();

$_SESSION['bg'] =  "success";
$_SESSION['message'] = "Car has been successfully approved!";
header('Location: ' . $home . '/admin/car_config/car_module.php');
