<?php

function connect(){
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'semrs';

	$connections = mysql_connect($host, $user, $pass) or die ('Unabale to connect to the database');
	mysql_select_db($db) or die ('Unable to select database!');
	return;
}

connect();
if (!isset($_SESSION['patient_id'])) {
	
	?> <!-- HTML / FAIL-->
	
	  <strong>No patient selected!</strong>
	
	<!-- HTML --> <?php

} else {
	$query = "SELECT * FROM `patient_data` WHERE `id` = '".$_SESSION['patient_id']."'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_assoc($result);
	
	$fname = $row['fname'];
	$mname = $row['mname'];
	$lname = $row['lname'];
	$dob = $row['DOB'];
	
	?> <!-- HTML / PASS-->
	
		<img src="" alt="" width="96" height="128" />
		<h2>Patient ID = <?php echo $_SESSION['patient_id'] ?></h2>
		Name: <?php echo $fname ?> <?php echo $mname ?> <?php echo $lname ?><br />
		DOB: <?php echo $dob ?>
	
	<!-- HTML --> <?php
}
?>
