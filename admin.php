<?php
	include('variables\variables.php');	
	include("class.login.php");
  $log = new logmein();		//Instentiate the class
  $log->dbconnect();			//Connect to the database
  $log->encrypt = true;		//set to true if password is md5 encrypted. Default is false.

if($log->logincheck($_SESSION['loggedin']) == false || $_SESSION['userlevel'] != 0){
    //do something if NOT logged in. For example, redirect to login page or display message.
		echo "Restricted Access: You are not logged in!";
} else {
    //do something else if logged in.
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Admin | Home</title>
    <meta name="Author" content="Ryan Kane">
    <link rel=stylesheet href="<?php echo $css_header;?>" type="text/css">
  </head>
  <body>
	  <?php include('includes\header.php'); ?>
    <div id="wrapper">
		  <?php include('includes\nav.php'); ?>
			<div style="clear:both;"></div>
		  <?php include('includes\sidebar.php'); ?>
			<div style="overflow:hidden;"></div>
      <div id="admin">
        <h1>Welcome <?php echo $_SESSION['userfullname']; ?></h1>
				<?php
					$log->newuserform("newuserformname", "newuserformid", "form_action.php");
					$log->changepasswordform("changepasswordformname", "changepasswordformid", "form_action.php");
					$log->new_patient_form("blah", "blah", "form_action.php")
			  ?>
      </div> <!-- content -->
    </div> <!-- wrapper -->
		<?php include('includes\footer.php'); ?>
  </body>
</html>

<?php
}
?>
