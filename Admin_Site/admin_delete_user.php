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


$user_id = $_POST['user_id'];

$result=mysqli_query($con,"DELETE FROM User WHERE User_ID = '$user_id';");

mysqli_close($con);

if($result == NULL){
	echo "FAILED TO INSERT";
}
else{
		header("Location: admin.php");
		exit();
}

?>