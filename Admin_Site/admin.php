<?php
Session_start();
include '../db_connect.php';
$admin = $_SESSION['admin'];
$user_id = $_SESSION['user_id'];

if(!isset($_SESSION['user_id'])) {
    header('Location: ../signin.html');
    exit();
}

if($admin != 1){
    header("Location: http://192.168.50.28:5000/showShop?id=$user_id");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/style2.css">
<link rel="stylesheet" href="../css/font-awesome.css">

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Page</title>

</head>
<body>
<h1><a href="http://192.168.50.28:3000/DBMS">Database Managment</a></h1><br>
    <div class="main-content-agile">
        <div class="sub-main-w3">
            <form action= "admin_insert_product.php" method="POST">
                <label>Add Coin</label><br />
                <input type="text" name="coin_name" value = "coin_name"><br>
                <input type="text" name="coin_price" value ="coin_price"><br>
                <button type="submit">Add</button><br>
            </form>

            <br>
        </div>
    </div>

    <div class="main-content-agile">
        <div class="sub-main-w3">
            <form action= "admin_delete_product.php" method="POST">
                <label>Remove Coin</label><br />
                <input type="text" name="coin_id" value="coin_id"><br>
                <button type="submit">Remove</button><br>
            </form>
             <br>
        </div>
    </div>

    <div class="main-content-agile">
        <div class="sub-main-w3">
             <form action= "admin_modify_product.php" method="POST">
                <label>Select Coin to Modify</label><br />
                <input type="text" name="coin_id" Value="coin_id"><br> <br> 
                <label>Change the following fields</label><br />
                 <input type="text" name="coin_name" Value="coin_name"><br>
                 <input type="text" name="coin_price" Value="coin_price"><br>
                 <br>
                <button type="submit">Modify</button><br>
            </form>
             <br>
        </div>
    </div>

    <div class="main-content-agile">
        <div class="sub-main-w3">
            <form action= "admin_insert_user.php" method="POST">
                <label>Add User</label><br />
                <input type="text" name="user_name" value="user_name"><br>
                
                <input type="text" name="user_ssn" value="user_ssn"><br>
               
                <input type="text" name="user_email" value="user_email"><br>
               
                <input type="text" name="user_phone" value="user_phone"><br>
             
                <input type="text" name="admin" value="admin"><br>
           
                <input type="text" name="user_password" value="user_password"><br>

                <button type="submit">Add</button><br>
            </form>
             <br>
        </div>
    </div>

     <div class="main-content-agile">
        <div class="sub-main-w3">
            <form action= "admin_delete_user.php" method="POST">
                <label>Remove User</label><br />
                <input type="text" name="user_id" value="user_id"><br>
                <button type="submit">Remove</button><br>
            </form>
             <br>
        </div>
    </div>

       <p align="left"><strong><font color='white'>List of Products:</font></strong></p>

    <table width="600" border="1" cellpadding="1" cellspacing="1" align="center">
        <tr>
            <th><font color='white'>Coin ID</font></th>
            <th><font color='white'>Coin Name</font></th>
            <th><font color='white'>Coin Value</font></th>
        </tr>


    <?php
    $sql = "SELECT * FROM Product;";
    $result = mysqli_query($con, $sql);
    $resultCheck = mysqli_num_rows($result);
    if($resultCheck > 0){
        while($row = mysqli_fetch_assoc($result)){
            echo "<div align='center'><tr>";
            echo "<td><font color='white'>" . $row['prodID'] . "</font></td>";
            echo "<td><font color='white'>" . $row['prodName'] . "</font></td>";
            echo "<td><font color='white'>" . $row['prodValue'] . "</font></td>";
            echo "<tr></div>";
        }
    }
    ?>
    </table>
<p align="left"><strong><font color='white'>List of Users:</font></strong></p>
    <table width="600" border="1" cellpadding="1" cellspacing="1" align="center">
        <tr>
            <th><font color='white'>User ID</font></th>
            <th><font color='white'>User Name</font></th>
            <th><font color='white'>User Email</font></th>
        </tr>


    <?php
    $sql = "SELECT * FROM User;";
    $result = mysqli_query($con, $sql);
    $resultCheck = mysqli_num_rows($result);
    if($resultCheck > 0){
        while($row = mysqli_fetch_assoc($result)){
            echo "<div align='center'><tr>";
            echo "<td><font color='white'>" . $row['User_ID'] . "</font></td>";
            echo "<td><font color='white'>" . $row['User_Name'] . "</font></td>";
            echo "<td><font color='white'>" . $row['User_Email'] . "</font></td>";
            echo "<tr></div>";
        }
    }
    ?>
    </table>
</body>
</html>