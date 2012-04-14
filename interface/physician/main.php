<?php
	$pagearray = array("home", "help", "about", "newpatient", "account");
	$which =  $_SERVER["QUERY_STRING"];
	include("../../class.login.php");
  $log = new logmein();		//Instentiate the class
  $log->dbconnect();			//Connect to the database
  $log->encrypt = true;		//set to true if password is md5 encrypted. Default is false.

if($log->logincheck($_SESSION['loggedin']) == false || $_SESSION['userlevel'] != 1){
  //do something if NOT logged in. For example, redirect to login page or display message.
	echo "Restricted Access: You are not logged in!";
} else {
  //do something if timeout occurs.
	if(isset($_SESSION['start'])) {
		$session_life = time() - $_SESSION['start'];
		if($session_life > $inactive){
			header("Location:../login/logout.php");
		}
	}
	$_SESSION['start'] = time();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Physician | Home</title>
    <meta name="Author" content="Ryan Kane" />
    <link rel="stylesheet" href="<?php echo $css_header;?>" type="text/css" />
  </head>
  <body>
	  <?php include('../includes/header.php'); ?>
    <div id="wrapper">
			<div style="float:left; margin:2px;"><?php echo $log->search_patient_form(); ?></div>
		  <?php include('../includes/nav.php'); ?>
			<div style="clear:both;"></div>
		  <?php include('sidebar.php'); ?>
			<div style="overflow:hidden;"></div>
      <div id="content">
        <h1>Welcome <?php echo $_SESSION['userfullname']; ?></h1>
				<?php
					if ($which == "") include("home.php");
					else if (in_array($which, $pagearray)) include($which.".php");
					else {
					  echo "
						  <h1>Not Found</h1>
							<h3>The requested URL".$_SERVER['PHP_SELF'].'?'.$which." was not found on this server.</h3>
							<hr />
							<h3>".$_SERVER['SERVER_SOFTWARE']." Server at ".$_SERVER['HTTP_HOST']." Port ".$_SERVER['SERVER_PORT']."</h3>
						";
					}
				?>
      </div> <!-- content -->
			<div id="results"></div>
			<div style="clear:both"></div>
    </div> <!-- wrapper -->
		<?php include('../includes/footer.php'); ?>
  </body>
</html>

<?php
}
?>

