<?php
$log->dbconnect();

if (!isset($_SESSION['patient_id'])) {
	
	?> <!-- HTML / FAIL-->
	
	  <strong>No patient selected!</strong>
	
	<!-- HTML --> <?php

} else {
	// Private Key
	$privKey = $log->getPrivateKey('../../', 'common');
	
	// Get all of the nessesary data for the user to view
	$query = "SELECT * FROM `patient_data` WHERE `id` = '".$_SESSION['patient_id']."';";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_assoc($result);
		
	$fname = $log->decrypt($row['fname'], $privKey);
	$mname = $log->decrypt($row['mname'], $privKey);
	$lname = $log->decrypt($row['lname'], $privKey);
	$dob = $log->decrypt($row['DOB'], $privKey);
	$street = $log->decrypt($row['street'], $privKey);
	$city = $log->decrypt($row['city'], $privKey);
	$state = $log->decrypt($row['state'], $privKey);
	$postal_code = $log->decrypt($row['postal_code'], $privKey);
	$regdate = date("M d, Y", $log->decrypt($row['regdate'], $privKey));
	$phone_home = $log->decrypt($row['phone_home'], $privKey);
	$phone_cell = $log->decrypt($row['phone_cell'], $privKey);
	$sex = $log->decrypt($row['sex'], $privKey);
	$ethnicity = $log->decrypt($row['ethnicity'], $privKey);
	$race = $log->decrypt($row['race'], $privKey);
	
	$fname = $fname != "" ? $fname." " : "";
	$mname = $mname != "" ? $mname." " : "";
	$lname = $lname != "" ? $lname.", " : "";
	
	$name = $lname.$fname.$mname;
	
	$street = $street != "" ? $street.", " : "";
	$city = $city != "" ? $city.", " : "";
	$state = $state != "" ? $state." " : "";
	$postal_code = $postal_code != "" ? $postal_code.", " : "";
	
	$qry = "SELECT * FROM `geo_country_reference` WHERE `countries_id` = '".$log->decrypt($row['country'], $privKey)."'";
	$rlt = mysql_query($qry) or die(mysql_error());
	$r = mysql_fetch_assoc($rlt);
	$country = $r['countries_iso_code_3'];
	
	$address = $street.$city.$state.$postal_code.$country;
	
	$phone_home = $phone_home != "" ? $phone_home." (Home)" : "";
	$phone_cell = $phone_cell != "" ? $phone_cell." (Cell)" : "";
	
	
	?> <!-- HTML / PASS-->
	
		<style>
			#patient_tabs {background:#777; color:#000; padding:1px; overflow:hidden; }
			.patient_tab {background:#999; border:#555 thin solid; color:#000; line-height:2em; padding:2px; width:8em; float:left; text-align:center;}
			.patient_tab:hover {background:#bbb; cursor:pointer;}
			.tab_view {background:#ddd; border:#444 thin solid;}
			
			#patient_info_bar {padding:2px; background:#ccc;}
			.patient_info {margin-right:1em;}		
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
		<!--  -->
		<div>
			<h2>Patient Info</h2>
			<div id="patient_info_bar">
				<span class="patient_info"><strong>Name:</strong> <?php echo $name; ?></span>
				<span class="patient_info"><strong>Age:</strong> <?php echo $log->getAge($dob)." yrs"; ?></span>
				<span class="patient_info"><strong>DOB:</strong> <?php echo $dob; ?></span>
				<span class="patient_info"><strong>Sex:</strong> <?php echo $sex; ?></span>
				<span class="patient_info"><strong>Registration Date:</strong> <?php echo $regdate; ?></span>
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
				
				<?php
				//$connections = mysql_connect("localhost", "root", "") or die ('Unabale to connect to the database');
				//mysql_select_db("semrs") or die ('Unable to select database!');
				$query = "SELECT data FROM photo where patient_id = '".$_SESSION['patient_id']."'";
				$result = mysql_query($query) or die(mysql_error());
				if (mysql_num_rows($result) == 0) {
					echo '<img src="../../images/photo_not_found.gif" height="128" width="128"/><br />';
				} else {
					$row = mysql_fetch_assoc($result);
					echo '<img src="../../patient_photos/'.$row['data'].'" height="128" width="128"/><br />';
				}
				?>
				<input type="button" value="Change Patient Photo" onclick="document.getElementById('change_photo').style.display = 'block'" />
				<div id="change_photo" style="border:#000 thin solid; width:300px; display:none">
					<form action="../../file_upload.php" method="post" enctype="multipart/form-data">
						<label for="file">Upload Patient Photo:</label><br />
						Supported filetype: jpg<br />
						Dimensions 128x128<br />
						Max Size: 60kb Max<br />
						<input type="file" name="file" id="file" /><br />
						<input type="submit" name="submit" value="Submit" />
						<input name="action" class="action" value="upload" type="hidden" />
					</form>
				</div>
				<br />		
				<label>Address:</label> <?php echo $address ?><br />
				<label>Race:</label> <?php echo $race; ?>/<?php echo $ethnicity; ?><br /> 
				<label>Phone:</label> <?php echo $phone_home; ?> <?php echo $phone_cell; ?><br />
				
			</div>
			<div class="tab_view" id="tab_appointments" style="display:none;">
				<h2>Appointments</h2>
			</div>
			<div class="tab_view" id="tab_prescriptions" style="display:none;">
				<h2>Prescriptions</h2>
			</div>
			<div class="tab_view" id="tab_messages" style="display:none;">
				<h2>Messages</h2>
				<input type="button" id="btn_newmssg" value="New Message" onclick="document.getElementById('new_message').style.display = 'block'; this.style.display = 'none';" />
				<div id="new_message" style="display:none">
					<?php
					$log->message_form();
					?>
				</div>
				<table>
					<tr><th>From</th><th>Subject</th><th>Message</th><th>Date</th></tr>
					<?php
						$_qry = "SELECT * FROM `message` WHERE `recipient` = '".$_SESSION['userid']."' ORDER BY `timestamp` DESC";
						$_res = mysql_query($_qry) or die(mysql_error());
						while ($_row = mysql_fetch_assoc($_res)) {
							$e_q = "SELECT `email` FROM `users` WHERE `id` = '".$_row['author']."'";
							$e_r = mysql_query($e_q) or die(mysql_error());
							$e_a = mysql_fetch_row($e_r);
							$author = $e_a[0];
							?>
							<tr><td><?php echo $author; ?></td><td><?php echo $_row['subject']; ?></td><td><?php echo $_row['message']; ?></td><td><?php echo $_row['timestamp']; ?></td></tr>
							<?php
						}
					?>
				</table>
			</div>
			<div class="tab_view" id="tab_access" style="display:none;">
				<h2>Access</h2>
				
				<table>
				<tr><th>Event</th><th>Timestamp</th><th>User</th><th>Level</th></tr>
				<?php
				$query = "SELECT * FROM `log` WHERE `patient_id` = '".$_SESSION['patient_id']."' ORDER BY `date` DESC";
				$result = mysql_query($query) or die(mysql_error());
				while($row = mysql_fetch_array($result)) {
					$event = $row['event'];
					$timestamp = $row['date'];
					
					$e_q = "SELECT `email` FROM `users` WHERE `id` = '".$row['user_id']."'";
					$e_r = mysql_query($e_q) or die(mysql_error());
					$e_a = mysql_fetch_row($e_r);
					$useremail = $e_a[0];
					
					$l_q = "SELECT `type` FROM `level` WHERE `id` = '".$row['level_id']."'";
					$l_r = mysql_query($l_q) or die(mysql_error());
					$l_a = mysql_fetch_row($l_r);
					$userlevel = $l_a[0];
					
					?>
						<tr>
							<td><?php echo $event; ?></td>
							<td><?php echo $timestamp; ?></td>
							<td><?php echo $useremail; ?></td>
							<td><?php echo $userlevel; ?></td>
						</tr>
					
				<?php } ?>
				</table>
			</div>
		</div>
	<!-- HTML -->
	<?php }	?>
