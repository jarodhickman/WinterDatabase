<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

include 'db_connect.php';

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }


$user_name = $_POST['Name'];
$user_pwd = $_POST['Password'];

$result=mysqli_query($con,"SELECT * FROM User WHERE User_Name = '$user_name' AND User_Password = '$user_pwd';");

$row=mysqli_fetch_assoc($result);
mysqli_close($con);

if($row == NULL){
	header("Location: signin.html");
	exit();
}
else{
		$_SESSION['admin'] = $row['Admin'];
		$_SESSION['user_id'] = $row['User_ID'];
		$_SESSION['user_name'] = $row['User_Name'];
		header("Location: Admin_Site/admin.php");
		exit();
}

?>