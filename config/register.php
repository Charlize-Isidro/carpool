<?php

include '../includes/connection.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $type = 'Passenger';
    $fname = $_POST['fname'];
    $mname = $_POST['mname'];
    $lname = $_POST['lname'];
    $contact_no = $_POST['contact_no'];
    $barangay = $_POST['barangay'];
    $city = $_POST['city'];
    $province = $_POST['province'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $id_type = $_POST['id_type'];
    $id_number = $_POST['id_number'];

    // Validate Email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Invalid email format!";
        header('Location: ' . $home .'/index.php');
        return;
    }

    // Checks the Email 
    $sql = "SELECT * FROM users WHERE user_email='$email'";
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Email already exist!";
        header('Location: ' . $home .'/index.php');
        return;
    }

    // Prepared Statement & Binding (Avoid SQL Injections)
    $stmnt = $connection->prepare("INSERT INTO users (user_type, user_fname, 
                                    user_mname, user_lname, user_contact_no, 
                                    user_email, user_password, user_barangay, 
                                    user_city, user_province)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmnt->bind_param('ssssssssss', $type, $fname, $mname, $lname, $contact_no, 
                                    $email, $password, $barangay, $city, $province);
    $stmnt->execute();

    // Adding to Passenger
    $sql = "SELECT user_id, user_verified_at, user_type  FROM users WHERE user_email='$email' AND user_password='$password'";
    $result = $connection->query($sql);
    $row = $result->fetch_assoc();
    $user_id = $row['user_id'];

    $stmnt = $connection->prepare("INSERT INTO passengers (user_id, pass_id_type, pass_id_number)
            VALUES (?, ?, ?)");
    $stmnt->bind_param('sss', $user_id, $id_type, $id_number);
    $stmnt->execute();

    $stmnt->close();
    $connection->close();

    // Mailling Part
    $name = $fname . " " . $lname;
    $subject = "Carpool | User Verification for " . $name;
    $link = $home . "/config/verify.php?user=" . $email . "";
    $message = ' 
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <style>
            #verify {
                background-color: #0f79b7;
                padding: 10px;
                text-decoration: none;
                color: white;
            }
            #verify:hover {
                background-color: #0988d2;
            }
        </style>
    </head>
    <body>
        <b> Carpool </b>
        <hr>
        <p> Hallu, <strong>' . $name . '!</strong></p>
        <p> Please confirm your email address by tapping the link below.
            <br><br>
            <a id="verify" href="' . $link . '"> Confirm Email Address </a>
            <br><br>
        
        </p>
    </body>
    </html>
    ';

    $mail = new PHPMailer(true);
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = 'true';
    $mail->Username = 'charlize.isidro@gmail.com';
    $mail->Password = 'fbuqwhpdlpevpnzq';
    $mail->SMTPSecure = 'ssl';
    $mail->Port = '465';

    $mail->setFrom('charlize.isidro@gmail.com', 'Carpool');
    $mail->addAddress($email);
    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body = $message;
    $mail->send();

    $_SESSION['bg'] =  "warning";
    $_SESSION['message'] = "Please check your email to verify your registration.";
    header('Location: ' . $home .'/index.php');
}
