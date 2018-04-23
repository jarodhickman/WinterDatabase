<?php
session_start();
$con = mysqli_connect("localhost", "admin", "password", "bitbizzar");
if(!$con){
	die("Failed to connec to MySQL: ".mysqli_connect_error());
}
?>
