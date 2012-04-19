<?php

function connect(){
	$mysql_host = 'localhost';
	$mysql_user = 'root';
	$mysql_pass = '';
	$mysql_db = 'semrs';

	$connections = mysql_connect($mysql_host, $mysql_user, $mysql_pass) or die ('Unabale to connect to the database');
	mysql_select_db($mysql_db) or die ('Unable to select database!');
	return;
}

function getAge($birthdate) {
	// Explode the date (YYYY-MM-DD)
	list($birth_year, $birth_month, $birth_day) = explode("-", $birthdate);
	// Find the differences
	$year_diff = date("Y") - $birth_year;
	$month_diff = date("m") - $birth_month;
	$day_diff = date("d") - $birth_day;
	// If the birthday has not occured this year
	if ($day_diff < 0 || $month_diff < 0) $year_diff--;
	return $year_diff;
}

connect();
if (!isset($_SESSION['patient_id'])) {
	
	?> <!-- HTML / FAIL-->
	
	  <strong>No patient selected!</strong>
	
	<!-- HTML --> <?php

} else {
	// Get all of the nessesary data for the user to view
	$query = "SELECT * FROM `patient_data` WHERE `id` = '".$_SESSION['patient_id']."'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_assoc($result);
	$fname = $row['fname'];
	$mname = $row['mname'];
	$lname = $row['lname'];
	$dob = $row['DOB'];
	
	$qry = "SELECT * FROM `geo_country_reference` WHERE `countries_id` = '".$row['country']."'";
	$rlt = mysql_query($qry) or die(mysql_error());
	$r = mysql_fetch_assoc($rlt);
	$country = $r['countries_iso_code_3'];
	
	$address = $row['street'].", ".$row['city'].", ".$row['state']." ".$row['postal_code'].", ".$country;
	// Add stuff here!!!
	
	
	?> <!-- HTML / PASS-->
	
		<style>
			#patient_tabs {background:#777; color:#000; padding:1px; overflow:hidden; }
			.patient_tab {background:#999; border:#555 thin solid; color:#000; line-height:2em; padding:2px; width:8em; float:left; text-align:center;}
			.patient_tab:hover {background:#bbb; cursor:pointer;}
			.tab_view {background:#ddd; border:#444 thin solid;}
			
			#patient_info_bar {padding:2px; background:#ccc;}
			.patient_info {margin-right:1em;}
			
			table, tr, th, td {border:#555 thick solid; padding:4px;}
			
		</style>
		<script type="text/javascript">
		function showTab(id) {
			var tab_ids = new Array("tab_home","tab_appointments","tab_prescriptions","tab_messages","tab_access");
			for (var tab_id = 0; tab_id < tab_ids.length; tab_id++) {
				if (tab_ids[tab_id] == id) {
					document.getElementById(id).style.display = "block";
					document.getElementById('tab_'+(tab_id+1)).style.backgroundColor = "#444";
					document.getElementById('tab_'+(tab_id+1)).style.color = "#fff";
					document.getElementById('tab_'+(tab_id+1)).style.borderColor = "#ccc";
				}	else {
					document.getElementById(tab_ids[tab_id]).style.display = "none";
					document.getElementById('tab_'+(tab_id+1)).style.backgroundColor = "";
					document.getElementById('tab_'+(tab_id+1)).style.color = "";
					document.getElementById('tab_'+(tab_id+1)).style.borderColor = "";
				}
			}
		}
		</script>
		<html>
			<form>
				<h2>Patient Info</h2>
				<div id="patient_info_bar">
					<span class="patient_info"><strong>Name:</strong> <?php echo $fname; ?></span>
					<span class="patient_info"><strong>Age:</strong> <?php echo getAge($dob)." yrs"; ?></span>
					<span class="patient_info"><strong>DOB:</strong> <?php echo $dob; ?></span>
				</div>
				<div id="patient_tabs">
					<div class="patient_tab" id="tab_1" onclick="showTab('tab_home');" style="background-color:#444 ; border-color:#fff; color:#ccc;">Home</div>
					<div class="patient_tab" id="tab_2" onclick="showTab('tab_appointments');">Appointment</div>
					<div class="patient_tab" id="tab_3" onclick="showTab('tab_prescriptions');">Prescriptions</div>
					<div class="patient_tab" id="tab_4" onclick="showTab('tab_messages');">Messages</div>
					<div class="patient_tab" id="tab_5" onclick="showTab('tab_access');">Access History</div>
				</div>
				<div class="tab_view" id="tab_home" style="display:block;">
					<h2>Patient ID = <?php echo $_SESSION['patient_id'] ?></h2>
					<img src="" alt="" width="96" height="128" /><br />
					<?php
						if (true) {
							?>
								<!-- http://www.w3schools.com/php/php_file_upload.asp -->
								<input type="file" name="file" id="file" /><br />
							<?php
						}
					?>
					<label>Address:</label> <?php echo $address ?><br />
				</div>
				<div class="tab_view" id="tab_appointments" style="display:none;">
					<h2>Appointments</h2>
				</div>
				<div class="tab_view" id="tab_prescriptions" style="display:none;">
					<h2>Prescriptions</h2>
				</div>
				<div class="tab_view" id="tab_messages" style="display:none;">
					<h2>Messages</h2>
				</div>
				<div class="tab_view" id="tab_access" style="display:none;">
					<h2>Access</h2>
					
					<table>
					<tr><th>Event</th><th>Timestamp</th></tr>
					<?php
					//$query = "SELECT * FROM `log` WHERE `patient_id` = '".$_SESSION['patient_id']."' ORDER BY `date` DESC";
					$query = "SELECT * FROM `log` ORDER BY `date` DESC";
					$result = mysql_query($query) or die(mysql_error());
					while($row = mysql_fetch_array($result)) {
						$event = $row['event'];
						$timestamp = $row['date'];
						
						?>
							<tr>
								<td><?php echo $event; ?></td>
								<td><?php echo $timestamp; ?></td>
							</tr>
						
					<?php } ?>
					</table>
				</div>
			</form>
		</html>
		
	<!-- HTML --> <?php
	
			echo "<br />MOAR<br />";
	
	
		
			/* Create the private and public key */
			$res = openssl_pkey_new();
			 
			/* Extract the private key from $res to $privKey */
			openssl_pkey_export($res, $privKey);
			 
			/* Extract the public key from $res to $pubKey */
			$pubKey = openssl_pkey_get_details($res);
			$pubKey = $pubKey["key"];
			 
			$data = 'i.amniels.com is a great website!';
			 
			/* Encrypt the data using the public key
			 * The encrypted data is stored in $encrypted */
			openssl_public_encrypt($data, $encrypted, $pubKey);
			 
			/* Decrypt the data using the private key and store the
			 * result in $decrypted. */
			openssl_private_decrypt($encrypted, $decrypted, $privKey);
			 
			echo $decrypted;
		

}
?>
