<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

include '../db_connect.php';

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }


$user_name = $_POST['user_name'];
$user_ssn = $_POST['user_ssn'];
$user_email = $_POST['user_email'];
$user_phone = $_POST['user_phone'];
$admin = $_POST['admin'];
$user_password = $_POST['user_password'];





$result=mysqli_query($con,"INSERT INTO User (User_Name, User_SSN, User_Email, User_Phone, Admin, User_Password) VALUES ('$user_name', '$user_ssn', '$user_email', '$user_phone', '$admin', '$user_password')");

mysqli_close($con);

if($result == NULL){
	echo "FAILED TO INSERT";
}
else{
		header("Location: admin.php");
		exit();
}

?>