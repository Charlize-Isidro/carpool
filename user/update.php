<?php

include '../includes/connection.php';

$user_id = $_SESSION['auth_id'];

// Checks the Email & Password
$sql = "SELECT * FROM users INNER JOIN passengers ON users.user_id = passengers.user_id WHERE users.user_id='$user_id'";
$result = $connection->query($sql);
$row = $result->fetch_assoc();

if (is_null($row['pass_id_confirmed_at'])) {
    $pass_id_confirmed = 'false';
} else {
    $pass_id_confirmed = 'true';
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carpool App</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <style>
        /* Remove Arrows on Number Textfield */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>

<body>

    <div class="container my-3 col-lg-5">

        <form action="update_process.php" method="post">

            <h1 class="mb-3"> Update Profile </h1>
            <hr>

            <div class="row">
                <h3> Personal Details </h3>
                <div class="mb-3 col-4">
                    <label for="fname" class="form-label">First Name <span class="text-danger">*</span></label>
                    <input type="text" name="fname" id="fname" class="form-control" required value="<?= $row['user_fname'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
                <div class="mb-3 col-4">
                    <label for="mname" class="form-label">Middle Name</label>
                    <input type="text" name="mname" id="mname" class="form-control" value="<?= $row['user_mname'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
                <div class="mb-3 col-4">
                    <label for="lname" class="form-label">Last Name <span class="text-danger">*</span></label>
                    <input type="text" name="lname" id="lname" class="form-control" required value="<?= $row['user_lname'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
            </div>

            <div class="row">
                <div class="mb-3 col-4">
                    <label for="contact_no" class="form-label">Contact Number</label>
                    <input type="text" minlength="11" maxlength="11" placeholder="09000000000" name="contact_no" id="contact_no" class="form-control">
                </div>
                <div class="mb-3 col-8">
                    <label for="barangay" class="form-label">Barangay <span class="text-danger">*</span></label>
                    <input type="text" name="barangay" id="barangay" class="form-control" required value="<?= $row['user_barangay'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
            </div>

            <div class="row">
                <div class="mb-3 col-6">
                    <label for="city" class="form-label">City <span class="text-danger">*</span></label>
                    <input type="text" name="city" id="city" class="form-control" required value="<?= $row['user_city'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
                <div class="mb-3 col-6">
                    <label for="province" class="form-label">Province <span class="text-danger">*</span></label>
                    <input type="text" name="province" id="province" class="form-control" required value="<?= $row['user_province'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
            </div>

            <hr>

            <div class="row">
                <h3> Identification </h3>
                <div class="mb-3 col-6">
                    <label for="id_type" class="form-label">ID Type</label>
                    <select class="form-select" name="id_type" id="id_type" aria-label="Default select example">
                        <option value="" <?= $row['pass_id_type'] == '' ? 'selected' : '' ?> <?= $pass_id_confirmed == 'true' ? 'disabled' : '' ?>>-- Select -- </option>
                        <option value="driver" <?= $row['pass_id_type'] == 'driver' ? 'selected' : '' ?> <?= $pass_id_confirmed == 'true' ? 'disabled' : '' ?>>Driver's License</option>
                        <option value="umid" <?= $row['pass_id_type'] == 'umid' ? 'selected' : '' ?> <?= $pass_id_confirmed == 'true' ? 'disabled' : '' ?>>UMID</option>
                        <option value="student" <?= $row['pass_id_type'] == 'student' ? 'selected' : '' ?> <?= $pass_id_confirmed == 'true' ? 'disabled' : '' ?>>Student ID</option>
                    </select>
                </div>
                <div class="mb-3 col-6">
                    <label for="id_number" class="form-label">ID Number</label>
                    <input type="text" name="id_number" id="id_number" class="form-control" value="<?= $row['pass_id_number'] ?>" <?= $pass_id_confirmed == 'true' ? 'readonly' : '' ?>>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <input type="submit" name="register" value="Update" class="btn btn-primary">
                    <a href="profile.php" class="btn btn-secondary"> Back </a>
                </div>
            </div>
        </form>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous">
    </script>
</body>

</html>