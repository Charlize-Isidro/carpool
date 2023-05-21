<?php
if(!empty(session_)){

}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

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

            <h1 class="mb-3"> E-Wallet Transaction </h1>
            <hr>

            <div class="row">
                <h3>Your Wallet </h3>
                <div class="mb-3 col-4">
                    <label for="walletType" class="form-label">Wallet type <span class="text-danger">*</span></label>
                     <input type="text" name="fname" id="walletType" class="form-control" required value="<?= $row['user_fname'] ?>" >
                </div>
                <div class="mb-3 col-4">
                    <label for="mname" class="form-label">ProFee</label>
                    <input type="text" name="mname" id="mname" class="form-control" value=">
                </div>
                <div class="mb-3 col-4">
                    <label for="lname" class="form-label">ConFee<span class="text-danger">*</span></label>
                    <input type="text" name="lname" id="lname" class="form-control" required value="<?= $row['user_lname'] ?>" >
                </div>
            </div>

            <div class="row">
                <div class="mb-3 col-4">
                    <label for="contact_no" class="form-label">Total Amount</label>
                    <input type="text" minlength="11" maxlength="11" placeholder="09000000000" name="contact_no" id="contact_no" class="form-control">
                </div>
                <div class="mb-3 col-8">
                    <label for="barangay" class="form-label">Reference No. <span class="text-danger">*</span></label>
                    <input type="text" name="barangay" id="barangay" class="form-control" required value="<?= $row['user_barangay'] ?>" >
                </div>
            </div>


            <hr>

        </form>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous">
    </script>
</body>

</html>