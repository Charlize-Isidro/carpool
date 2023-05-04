<?php

if (isset($_SESSION['auth_id'])) {
    $id = $_SESSION['auth_id'];
    $auth_type = $_SESSION['auth_type'];

    if ($auth_type == 'admin') {
        header('Location: ' . $home . '/admin/index.php');
    } else {
        header('Location: ' . $home . '/user/profile.php');
    }

    exit;
}
