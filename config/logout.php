<?php

include '../includes/connection.php';

    unset($_SESSION['auth_id']);
    $_SESSION['bg'] =  "success";
    $_SESSION['message'] = "Logout successful!";
    header('Location: ' . $home .'/login.php');

    
