<!-- This is just an example -->!
<style>
	#patient_tabs {background:#777; color:#000; padding:1px; overflow:hidden; }
	.patient_tab {background:#999; border:#555 thin solid; color:#000; line-height:2em; padding:2px; width:8em; float:left; text-align:center;}
	.patient_tab:hover {background:#bbb; cursor:pointer;}
	.tab_view {background:#ddd; border:#444 thin solid; color:#008;}
	
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
<html>
	<form>
		<h2>Patient Info</h2>
		<div id="patient_info_bar">
			<span class="patient_info"><strong>Name:</strong> <?php echo "Ryan M Kane"; ?></span>
			<span class="patient_info"><strong>Age:</strong> <?php echo "22 yrs"; ?></span>
			<span class="patient_info"><strong>DOB:</strong> <?php echo "1989-06-11"; ?></span>
		</div>
		<div id="patient_tabs">
			<div class="patient_tab" id="tab_1" onclick="showTab('tab_home');" style="background-color:#444 ; border-color:#fff; color:#ccc;">Home</div>
			<div class="patient_tab" id="tab_2" onclick="showTab('tab_appointments');">Appointment</div>
			<div class="patient_tab" id="tab_3" onclick="showTab('tab_prescriptions');">Prescriptions</div>
			<div class="patient_tab" id="tab_4" onclick="showTab('tab_messages');">Messages</div>
			<div class="patient_tab" id="tab_5" onclick="showTab('tab_access');">Access History</div>
		</div>
		<div class="tab_view" id="tab_home" style="display:block;">
			<h2>Home</h2>
		</div>
		<div class="tab_view" id="tab_appointments"  style="display:none;">
			<h2>Appointments</h2>
		</div>
		<div class="tab_view" id="tab_prescriptions"  style="display:none;">
			<h2>Prescriptions</h2>
		</div>
		<div class="tab_view" id="tab_messages"  style="display:none;">
			<h2>Messages</h2>
		</div>
		<div class="tab_view" id="tab_access"  style="display:none;">
			<h2>Access</h2>
		</div>
	</form>
</html>
