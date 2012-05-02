<?php
include("class.login.php");

$connections = mysql_connect("localhost", "root", "") or die ('Unabale to connect to the database'); 
mysql_select_db("semrs") or die ('Unable to select database!');

if ((($_FILES["file"]["type"] == "image/gif") || ($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/pjpeg")) && ($_FILES["file"]["size"] < 60000)) {
  if ($_FILES["file"]["error"] > 0) {
    echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
  } else {
    echo "<h1>Patient Photo Upload Successful!</h1>";
		echo "Upload: " . $_FILES["file"]["name"] . "<br />";
    echo "Type: " . $_FILES["file"]["type"] . "<br />";
    echo "Size: " . round(($_FILES["file"]["size"] / 1024), 2) . " Kb<br />";
    echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br />";
		$pid = $_SESSION['patient_id'];
		// Check for update
		$query = "SELECT * FROM photo WHERE patient_id = '$pid'";
		$result = mysql_query($query) or die(mysql_error());
		if (mysql_num_rows($result) == 0) {
			$timestamp = time();
		} else {
			$row = mysql_fetch_assoc($result);
			$timestamp = $row['timestamp'];
		}		
		$filename = $pid."_".$timestamp.".jpg";
		$dir = "patient_photos/";
		$_FILES["file"]["name"] = $filename; // Rename file
		
    // Check if file exists
		//if (file_exists($dir . $_FILES["file"]["name"])) {
      //echo $_FILES["file"]["name"] . " already exists. ";
    //} else {
			// Move photo to the patient_photos directory  so it can be accessed
      move_uploaded_file($_FILES["file"]["tmp_name"], $dir . $_FILES["file"]["name"]);
      echo "Stored in: " . $dir . $_FILES["file"]["name"] . "<br />";
    //}		
		
		// Check if patient has a photo
		$query = "SELECT * FROM photo WHERE patient_id = '$pid'";
		$result = mysql_query($query) or die(mysql_error());
		if (mysql_num_rows($result) == 0) {
			$query = "INSERT INTO photo (patient_id, data, timestamp) VALUES ('$pid', '$filename', '$timestamp')";
		} else {
			$query = "UPDATE photo SET data ='$filename' WHERE patient_id='$pid'";
		}		
		echo $query."<br />";
		$result = mysql_query($query) or die(mysql_error()); // Insert or update photo
		
		// Log action
		$datetime = gmdate("Y-m-d H:i:s", time());
		$usr = $_SESSION['userid'];
		$lvl = $_SESSION['userlevel'];
		$comment = mysql_real_escape_string($query);
    $qry = "INSERT INTO `log`(`date`, `event`, `user_id`, `level_id`, `comments`, `patient_id`) VALUES ('$datetime', 'Change Photo', '$usr', '$lvl', '$comment', '$pid')";
		mysql_query($qry) or die(mysql_error());
  }
	
	/* This is for debugging purposes
	echo "<h2>Redirecting in 10 seconds...</h2>";
	header('Refresh: 10; URL=interface/physician/main.php?viewpatient');
	*/
	header('location:interface/physician/main.php?viewpatient');
	
} else {
  echo "<h1>Invalid file</h1>";
}
?>