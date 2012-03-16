<?php
//instantiate if needed
include("class.login.php");
$log = new logmein();
$log->encrypt = true; //set encryption

if($_REQUEST['action_login'] == "login"){
    if($log->login("logon", $_REQUEST['username'], $_REQUEST['password']) == true){
        //do something on successful login
				// CHECK USER LEVELS AND REDIRECT TO APPROPRIATE FILES
				echo "Successful Login: ".$log->$name()."! You are now being redirected.";
				
				switch($userlevel) {
				  case 0: // Admin
					  echo "<br />Administrator";
						break;
				  case 1: // Physician
					  echo "<br />Physician";
						break;
				  case 2: // Receptionist
					  echo "<br />Receptionist";
						break;
				  case 3: // Pharmacist
					  echo "<br />Pharmacist";
						break;
					default: // Unknown User
					  echo "<br />Unknown";
						break;
				}
    } else{
        //do something on FAILED login
				echo "Failed Login";
    }
}

if($_REQUEST['action_resetpassword'] == "resetlogin"){
    if($log->passwordreset($_REQUEST['username']) == true){
        //do something on successful password reset
				echo "Successful Password Reset";
    }else{
        //do something on failed password reset
				echo "Failed Password Reset";
    }
}

if($_REQUEST['action_newuser'] == "register"){
    if($log->newuser($_REQUEST['username'], $_REQUEST['password1'], $_REQUEST['password2'], $_REQUEST['level'], $_REQUEST['facility'], $_REQUEST['lname']) == true){
        //do something on successful password reset
				echo "Created New User!";
    }else{
        //do something on failed password reset
				echo "Failed Password Reset";
    }
}
?>