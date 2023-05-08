<?php

include '../includes/connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $id = $_SESSION['auth_id'];

    $plate_no = $_POST['plate_no'];
    // $field_office = $_POST['field_office'];
    // $office_code = $_POST['office_code'];
    // $receipt_no = $_POST['receipt_no'];
    // $tin_no = $_POST['tin_no'];

    $model = $_POST['model'];
    $color = $_POST['color'];
    
    $brand = $_POST['brand'];
    $classification = $_POST['classification'];
    $engine = $_POST['engine'];

    $chassis = $_POST['chassis'];
    $car_year = $_POST['car_year'];
    $car_type = $_POST['car_type'];

    // $car_category = $_POST['car_category'];
    $car_fuel = $_POST['car_fuel'];
    $car_renewal = $_POST['car_renewal'];

    // Checks the Plate
    $sql = "SELECT * FROM cars WHERE car_plate_no='$plate_no'";
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Car Plate Number already exist!";
        header('Location: ' . $home .'/user/car_register.php');
        return;
    }

    // Checks the Receipt No. 
    // $sql = "SELECT * FROM cars WHERE car_receipt_no='$receipt_no'";
    // $result = $connection->query($sql);

    // if ($result->num_rows > 0) {
    //     $_SESSION['bg'] =  "danger";
    //     $_SESSION['message'] = "Car Receipt Number already exist!";
    //     header('Location: ' . $home .'/user/car_register.php');
    //     return;
    // }

    // Checks the Engine No. 
    $sql = "SELECT * FROM cars WHERE car_engine_no='$engine'";
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Car Engine Number already exist!";
        header('Location: ' . $home .'/user/car_register.php');
        return;
    }

    // Checks the Chassis
    $sql = "SELECT * FROM cars WHERE car_chassis_no='$chassis'";
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        $_SESSION['bg'] =  "danger";
        $_SESSION['message'] = "Car Chassis already exist!";
        header('Location: ' . $home .'/user/car_register.php');
        return;
    }

    // Prepared Statement & Binding (Avoid SQL Injections)
    $stmnt = $connection->prepare("INSERT INTO cars (driv_id, 
    car_plate_no, car_model, car_color, car_brand,
    car_classification, car_engine_no, car_chassis_no, car_year,
    car_type, car_fuel, car_renewal_date)
            VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmnt->bind_param('ssssssssssss', $id, $plate_no, $model, $color, $brand,
    $classification, $engine, $chassis, $car_year, $car_type,
    $car_fuel, $car_renewal);
    $stmnt->execute();
    $stmnt->close();
    $connection->close();

    $_SESSION['bg'] =  "warning";
    $_SESSION['message'] = "Your car is now pending for approval.";
    header('Location: ' . $home .'/user/view_cars.php');
}
