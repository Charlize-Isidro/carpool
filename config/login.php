<?php

include '../includes/connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $email = $_POST['email'];
    $password = $_POST['password'];

    // Validate Email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Invalid email format!";
        header('Location: ' . $home . '/login.php');
        return;
    }

    // Checks the Email & Password
    $sql = "SELECT user_id, user_verified_at, user_type FROM users WHERE user_email='$email' AND user_password='$password'";
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {

            // Check if the Account is Verified or Not
            if (is_null($row['user_verified_at'])) {
                $_SESSION['bg'] =  "warning";
                $_SESSION['message'] = "Your account is not yet verified. Check your email to verify account!";
                header('Location: ' . $home . '/login.php');
                return;
            } else {

                $_SESSION['auth_id'] =  $row['user_id'];
                $_SESSION['auth_type'] =  $row['user_type'];

                if($row['user_type'] == 'admin'){
                    header('Location: ' . $home . '/admin/index.php');
                    return;
                }

                header('Location: ' . $home . '/user/profile.php');
                return;
            }
        }
    } else {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Invalid credentials!";
        header('Location: ' . $home . '/login.php');
        return;
    }
}
