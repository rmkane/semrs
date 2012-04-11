<?php
	include("class.login.php");
  $log = new logmein();		//Instentiate the class
  $log->dbconnect();			//Connect to the database
  $log->encrypt = true;		//set to true if password is md5 encrypted. Default is false.

if($log->logincheck($_SESSION['loggedin']) == false) header("Location:login.php");
else {
	if ($_SESSION['userlevel'] == 0) header("Location:admin.php");
	else if ($_SESSION['userlevel'] == 1) header("Location:physician.php");
	else if ($_SESSION['userlevel'] == 2) header("Location:receptionist.php");
	else if ($_SESSION['userlevel'] == 3) header("Location:pharmacisit.php");
}
?>