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