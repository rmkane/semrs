<?php
	include('variables\variables.php');	
	include("class.login.php");
  $log = new logmein();		//Instentiate the class
  $log->dbconnect();			//Connect to the database
  $log->encrypt = true;		//set to true if password is md5 encrypted. Default is false.
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Log In</title>
    <meta name="Author" content="Ryan Kane">
    <link rel=stylesheet href="<?php echo $css_header;?>" type="text/css">
  </head>
  <body>
	  <?php include('includes\header.php'); ?>
    <div id="wrapper">
			<div style="clear:both;"></div>
			<div id="login" style="background:url('images/logo.png') no-repeat; min-height:320px; width:100%; padding-top:1em;">
				<?php
					$log->loginform("loginformname", "loginformid", "form_action.php");
					$log->resetform("resetformname", "resetformid", "form_action.php");
			  ?>
      </div> <!-- content -->
			<div style="clear:both"></div>
    </div> <!-- wrapper -->
		<?php include('includes\footer.php'); ?>
  </body>
</html>