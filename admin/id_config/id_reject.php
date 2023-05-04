<?php

include '../../includes/connection.php';

$pass_id = $_GET['pass_id'];

$now = new DateTime();
$now->setTimezone(new DateTimeZone('Asia/Manila'));
$timestamp = $now->format('Y-m-d H:i:s');

// Prepared Statement & Binding (Avoid SQL Injections)
$stmnt = $connection->prepare("UPDATE passengers SET pass_id_rejected = 1 WHERE pass_id='$pass_id'");
$stmnt->execute();
$stmnt->close();
$connection->close();

$_SESSION['bg'] =  "danger";
$_SESSION['message'] = "ID has been rejected!";
header('Location: ' . $home . '/admin/id_config/id_module.php');
