<?php

include '../includes/connection.php';

$user_id = $_SESSION['auth_id'];

$fname = $_POST['fname'];
$mname = $_POST['mname'];
$lname = $_POST['lname'];
$contact_no = $_POST['contact_no'];
$barangay = $_POST['barangay'];
$city = $_POST['city'];
$province = $_POST['province'];

$id_type = $_POST['id_type'];
$id_number = $_POST['id_number'];

$stmnt = $connection->prepare("UPDATE users SET user_fname = '$fname', user_mname = '$mname', user_lname = '$lname',
    user_contact_no = '$contact_no', user_barangay = '$barangay', user_city = '$city', user_province = '$province' WHERE user_id='$user_id'");
$stmnt->execute();

$stmnt = $connection->prepare("UPDATE passengers SET pass_id_type = '$id_type', pass_id_number = '$id_number' WHERE user_id='$user_id'");
$stmnt->execute();

$stmnt->close();
$connection->close();

$_SESSION['bg'] =  "success";
$_SESSION['message'] = "Profile has been successfully updated!";
header('Location: ' . $home . '/user/profile.php');
