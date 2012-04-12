<?php
	include("../../class.login.php");
  $log = new logmein();		//Instentiate the class
  $log->dbconnect();			//Connect to the database
  $log->encrypt = true;		//set to true if password is md5 encrypted. Default is false.
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Logged Out</title>
    <meta name="Author" content="Ryan Kane" />
    <link rel="stylesheet" href="<?php echo $css_header;?>" type="text/css" />
  </head>
  <body>
	  <?php include('../includes/header.php'); ?>
    <div id="wrapper">
			<div style="clear:both;"></div>
			<div id="login">
				<div style="text-align:center">
					<h2>You have been logged off.</h2>
					<p><a href="login.php">Log In</a></p>
					</p>
				</div>
      </div> <!-- content -->
			<div style="clear:both"></div>
    </div> <!-- wrapper -->
		<?php include('../includes/footer.php'); ?>
  </body>
</html>