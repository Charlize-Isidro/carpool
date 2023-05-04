<?php

if (isset($_SESSION['auth_id'])) {
    $id = $_SESSION['auth_id'];
} else {
    $_SESSION['bg'] =  "warning";
    $_SESSION['message'] = "Please login first!";
    header('Location: ' . $home . '/login.php');
    exit;
}
