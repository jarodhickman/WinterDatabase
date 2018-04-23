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


$coin_id = $_POST['coin_id'];

$result=mysqli_query($con,"DELETE FROM Product WHERE prodID = '$coin_id';");

mysqli_close($con);

if($result == NULL){
	echo "FAILED TO INSERT";
}
else{
		header("Location: admin.php");
		exit();
}

?>