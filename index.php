<?php
	include("class.login.php");
  $log = new logmein();		//Instentiate the class
  $log->dbconnect();			//Connect to the database
  $log->encrypt = true;		//set to true if password is md5 encrypted. Default is false.

if($log->logincheck($_SESSION['loggedin']) == false) header("Location:interface/login/login.php");
else {
	if ($_SESSION['userlevel'] == 0) header("Location:interface/admin/main.php");
	else if ($_SESSION['userlevel'] == 1) header("Location:interface/physician/main.php");
	else if ($_SESSION['userlevel'] == 2) header("Location:interface/receptionist/main.php");
	else if ($_SESSION['userlevel'] == 3) header("Location:interface/pharmacisit/main.php");
}
?>