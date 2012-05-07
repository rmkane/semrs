<?php
//For security reasons, don't display any errors or warnings. Comment out in DEV.
//error_reporting(0);

include('globals.php');	

session_cache_expire(10); // Call before start
session_start(); // Start session
$inactive = 600; // 10 minute timeout

// http://www.emirplicanic.com/php/simple-phpmysql-authentication-class
class logmein {
  //database setup
  //MAKE SURE TO FILL IN DATABASE INFO
  var $hostname_logon = 'localhost';	//Database server LOCATION
  var $database_logon = 'semrs';			//Database NAME
  var $username_logon = 'root';				//Database USERNAME
  var $password_logon = '';						//Database PASSWORD
 
  //table fields
  var $user_table = 'users';
  var $user_id = 'id';
  var $user_email = 'email';
  var $user_password = 'password';
  var $user_level = 'userlevel';
  var $user_fname = 'fname';
  var $user_mname = 'mname';
  var $user_lname = 'lname';
  var $user_facility_id = 'facility_id';
  
  var $facility_table = 'facility';
  var $facility_id = 'id';
  var $facility_name = 'name';
  
  var $level_table = 'level';
  var $level_id = 'id';
  var $level_type = 'type';
  
  var $patient_table = 'patient_data';
  var $patient_id = 'id';
  var $patient_title = 'title';
  var $patient_fname = 'fname';
  var $patient_mname = 'mname';
  var $patient_lname = 'lname';
  var $patient_dob = 'DOB';
  var $patient_sex = 'sex';
  var $patient_race = 'race';
  var $patient_ethnicity = 'ethnicity';
  var $patient_street = 'street';
  var $patient_city = 'city';
	var $patient_state = 'state';
  var $patient_postal_code = 'postal_code';
  var $patient_country = 'country';
  var $patient_phone_home = 'phone_home';
  var $patient_phone_cell = 'phone_cell';
  var $patient_regdate = 'regdate';
 
  //encryption
  var $encrypt = false;       //set to true to use md5 encryption for the password
 
  //connect to database
  function dbconnect(){
    $connections = mysql_connect($this->hostname_logon, $this->username_logon, $this->password_logon) or die ('Unabale to connect to the database');
    mysql_select_db($this->database_logon) or die ('Unable to select database!');
    return;
  }
 
  //login function
  function login($table, $username, $password){
    //conect to DB
    $this->dbconnect();
    //make sure table name is set
    if($this->user_table == ""){
      $this->user_table = $table;
    }
    //check if encryption is used
    if($this->encrypt == true){
      $password = md5($password);
    }
    //execute login via qry function that prevents MySQL injections
    $result = $this->qry("SELECT * FROM ".$this->user_table." WHERE ".$this->user_email."='?' AND ".$this->user_password." = '?';" , $username, $password);
    $row=mysql_fetch_assoc($result);
    if($row != "Error"){
      if($row[$this->user_email] !="" && $row[$this->user_password] !=""){
        //register sessions you can add additional sessions here if needed
        $_SESSION['userid'] = $row[$this->user_id];
        $_SESSION['useremail'] = $row[$this->user_email];
        $_SESSION['userfullname'] = $row[$this->user_fname]." ".$row[$this->user_mname]." ".$row[$this->user_lname];
        $_SESSION['loggedin'] = $row[$this->user_password];
        $_SESSION['userlevel'] = $row[$this->user_level];
				$_SESSION['patient_id'] = null;
        
        $datetime = gmdate("Y-m-d H:i:s", time());
        $qry = $this->qry("INSERT INTO `log`(`date`, `event`, `user_id`, `level_id`, `comments`, `user_notes`) VALUES ('?', '?', '?', '?', '?', '?');", $datetime, 'log in', $_SESSION['userid'], $_SESSION['userlevel'], '', '', '');
        
        return true;
      } else {
        session_destroy();
        return false;
      }
    } else{
      return false;
    }
  }
 
  //prevent injection
  function qry($query) {
		$this->dbconnect();
		$args  = func_get_args();
		$query = array_shift($args);
		$query = str_replace("?", "%s", $query);
		$args  = array_map('mysql_real_escape_string', $args);
		array_unshift($args,$query);
		$query = call_user_func_array('sprintf',$args);
		$result = mysql_query($query) or die(mysql_error());
		if($result){
			return $result;
		} else {
			$error = "Error";
			return $result;
		}
  }
  
  //logout function
  function logout(){
    $datetime = gmdate("Y-m-d H:i:s", time());
    $qry = $this->qry("INSERT INTO `log`(`date`, `event`, `user_id`, `level_id`, `comments`, `user_notes`) VALUES ('?', '?', '?', '?', '?', '?');", $datetime, 'log out', $_SESSION['userid'], $_SESSION['userlevel'], '', '', '');
    $_SESSION = array();
    session_destroy();
		header("location:interface/login/logout.php");
  return;
  }
	
	//logout function
  function timeout(){
    $datetime = gmdate("Y-m-d H:i:s", time());
    $qry = $this->qry("INSERT INTO `log`(`date`, `event`, `user_id`, `level_id`, `comments`, `user_notes`) VALUES ('?', '?', '?', '?', '?', '?');", $datetime, 'timeout', $_SESSION['userid'], $_SESSION['userlevel'], '', '', '');
    $_SESSION = array();
    session_destroy();
		header("location:../login/logout.php");
  return;
  }
 
  //check if loggedin
  function logincheck($logincode){
    //conect to DB
    $this->dbconnect();
    //exectue query
    $result = $this->qry("SELECT * FROM ".$this->user_table." WHERE ".$this->user_password." = '?';" , $logincode);
    $rownum = mysql_num_rows($result);
    //return true if logged in and false if not
    if($rownum != "Error"){
      if($rownum > 0){
        return true;
      } else {
        return false;
      }
    }
  }
  
  // I added this
  function newuser($username, $password1, $password2, $level, $facility_option, $lname) {
    //conect to DB
    $this->dbconnect();
    //if both passwords match
    
		$query = "SELECT * FROM `users` WHERE `email` = '".$username."'";
		$result = mysql_query($query) or die(mysql_error());
		
		if (mysql_num_rows($result) == 0) {
			if ($password1 == $password2) {
				$password1 = md5($password1); // Encrypt Password
				// Insert New User into Users table
				$qry = $this->qry("INSERT INTO ".$this->user_table." (".$this->user_email.",".$this->user_password.",".$this->user_level.",".$this->user_facility_id.",".$this->user_lname.") VALUES ('?', '?', '?', '?', '?');", $username, $password1, $level, $facility_option, $lname);
				// Get the associated user type from the id			
				$result = $this->qry("SELECT ".$this->level_type." FROM ".$this->level_table." WHERE ".$this->level_id." = '?';", $level);
				$row=mysql_fetch_assoc($result);
				if(row != "Error") { $type = $row[$this->level_type]; }
				echo "New User: ".$username."(".$type.") was created!";
				return true;
			} else {
				echo "Failed to create user! ";
				return false;
			}
		} else {
			echo "Username already taken! ";
			return false;
		}
  }
  
  function changepassword($oldpassword, $newpassword1, $newpassword2) {
    //conect to DB
    $this->dbconnect();
    $username = $_SESSION['useremail'];
    $result = $this->qry("SELECT ".$this->user_password." FROM ".$this->user_table." WHERE ".$this->user_email." = '?';", $username);
    $row = mysql_fetch_assoc($result);
    if(row != "Error") {
      $oldpassword = md5($oldpassword);
      if ($oldpassword == $row[$this->user_password]) {
        if ($newpassword1 == $newpassword2) {
          $newpassword1 = md5($newpassword1);
          $qry = "UPDATE ".$this->user_table." SET ".$this->user_password."='".$newpassword1."' WHERE ".$this->user_email."='".stripslashes($username)."'";
          $result = mysql_query($qry) or die(mysql_error());
          return true;
        } else {
          echo "New passwords do not match!";
          return false;
        }
      } else {
        echo "Old password does not match.";
        return false;
      }
    }
  }
 
    //reset password
  function passwordreset($username){
    //conect to DB
    $this->dbconnect();
    //generate new password
    $newpassword = $this->createPassword();

    ////////////////////////////////
    // -- GIVES ME THE PASSWORD ! //
    ////////////////////////////////
    echo "<p>New Password: ".$newpassword."</p>"; // ADDED THIS
		
    //check if encryption is used
    if($this->encrypt == true){
      $newpassword_db = md5($newpassword);
    } else {
      $newpassword_db = $newpassword;
    }
 
    //update database with new password
    $qry = "UPDATE ".$this->user_table." SET ".$this->user_password."='".$newpassword_db."' WHERE ".$this->user_email."='".stripslashes($username)."'";
    $result = mysql_query($qry) or die(mysql_error());
 
    $to = stripslashes($username);
    //some injection protection
    $illegals=array("%0A","%0D","%0a","%0d","bcc:","Content-Type","BCC:","Bcc:","Cc:","CC:","TO:","To:","cc:","to:");
    $to = str_replace($illegals, "", $to);
    $getemail = explode("@",$to);
 
    //send only if there is one email
    if(sizeof($getemail) > 2){
      return false;
    } else {
      //send email
      $from = $_SERVER['SERVER_NAME'];
      $subject = "Password Reset: ".$_SERVER['SERVER_NAME'];
      $msg = "Your new password is: ".$newpassword."";
 
      //now we need to set mail headers
      $headers = "MIME-Version: 1.0 rn" ;
      $headers .= "Content-Type: text/html; \r\n" ;
      $headers .= "From: $from  \r\n" ;
 
      //now we are ready to send mail
      $sent = mail($to, $subject, $msg, $headers);
      if($sent){
        return true;
      } else {
        return false;
      }
    }
  }
 
  //create random password with 8 alphanumerical characters
  function createPassword() {
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    srand((double)microtime()*1000000);
    $i = 0;
    $pass = '' ;
    while ($i <= 7) { // Random 8 character password
      $num = rand() % 61;
      $tmp = substr($chars, $num, 1);
      $pass = $pass . $tmp;
      
      $i++;
    }
    return $pass;
  }
  
    // I added this
  function createpatient($title, $language, $fname, $mname, $lname, $dob, $sex, $race, $ethnicity, $street, $city, $state, $postal_code, $country, $phone_home, $phone_cell, $dl, $nid, $occupation, $mothers_name, $guardians_name) {
    //conect to DB
    $this->dbconnect();
		
		$mssg = "New Patient: ".$lname." ".$mname.", ".$fname." was created! "; 
		
		$pubKey = $this->getPublicKey('', 'common');
		
		$title = $this->encrypt($title, $pubKey);
		$language = $this->encrypt($language, $pubKey);
		$fname = $this->encrypt($fname, $pubKey);
		$mname = $this->encrypt($mname, $pubKey);
		$lname = $this->encrypt($lname, $pubKey);
		$dob = $this->encrypt($dob, $pubKey);
		$sex = $this->encrypt($sex, $pubKey);
		$race = $this->encrypt($race, $pubKey);
		$ethnicity = $this->encrypt($ethnicity, $pubKey);
		$street = $this->encrypt($street, $pubKey);
		$city = $this->encrypt($city, $pubKey);
		$state = $this->encrypt($state, $pubKey);
		$postal_code = $this->encrypt($postal_code, $pubKey);
		$country = $this->encrypt($country, $pubKey);
		$phone_home = $this->encrypt($phone_home, $pubKey);
		$phone_cell = $this->encrypt($phone_cell, $pubKey);
		$dl = $this->encrypt($dl, $pubKey);
		$nid = $this->encrypt($nid, $pubKey);
		$occupation = $this->encrypt($occupation, $pubKey);
		$mothers_name = $this->encrypt($mothers_name, $pubKey);
		$guardians_name = $this->encrypt($guardians_name, $pubKey);
		$regdate = $this->encrypt(time(), $pubKey);
		
		$qry = $this->qry("INSERT INTO `patient_data` (`title`,`language`,`fname`,`mname`,`lname`,`DOB`,`sex`,`race`,`ethnicity`,`street`,`city`,`state`,`postal_code`,`country`,`phone_home`,`phone_cell`,`drivers_license`, `national_id`, `occupation`, `mothers_name`, `guardians_name`,`regdate`) VALUES ('?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?');", $title, $language, $fname,	$mname, $lname, $dob, $sex, $race, $ethnicity, $street, $city, $state, $postal_code, $country, $phone_home, $phone_cell, $dl, $nid, $occupation, $mothers_name, $guardians_name, $regdate);
		echo $mssg;
		return true;
  }
	
	function sendmessage($recipient, $subject, $message) {
		//conect to DB
    $this->dbconnect();
		if ($recipient != "" && $message != "") {
			$qry = $this->qry("INSERT INTO `message` (`author`, `recipient`, `subject`, `message`) VALUES ('?', '?', '?', '?');", $_SESSION['userid'], $recipient, $subject, $message);
			return true;
		} else {
			echo "ERROR";
			return false;
		}
	}
	
	function addvisit($type, $date, $time, $physician, $patient, $facility, $notes) {
		$this->dbconnect();
		if ($type != "" && $date != "" && $time != "" && $physician != "" && $patient != "" && $facility != "") {
			$qry = $this->qry("INSERT INTO `visit` (`type`, `scheduled_date`, `scheduled_time`, `physician_id`, `patient_id`, `facility_id`, `notes`) VALUES ('?', '?', '?', '?', '?', '?', '?');", $type, $date, $time, $physician, $patient, $facility, $notes);
			return true;
		} else {
			echo "ERROR";
			return false;
		}
		return true;
	}

  //login form
  function loginform($action_login){
    //conect to DB
    $this->dbconnect();
    ?>
    <form name="login_name" id="login_id" class="login_class" enctype="application/x-www-form-urlencoded" method="post" action="<?php echo $action_login ?>">
      <fieldset>
        <legend>Log In</legend>
        <table>
        <tr>
          <td><label for="username">Username</label></td>
          <td><input name="username" id="username" type="text" /></td>
        </tr>
        <tr>
          <td><label for="password">Password</label></td>
          <td><input name="password" id="password" type="password" /></td>
        </tr>
        <tr>
          <td></td>
          <td align="left">
            <input name="action" class="action" value="login" type="hidden" />
            <input name="submit1" class="submit" value="Log In" type="submit" />
          </td>
        </tr>
      </table>
    </fieldset>
  </form>
  <?php
  }
  
    //new user form
  function newuserform(){
    //conect to DB
    $this->dbconnect();
    ?>
    <form id="newuser_form" method="post" action="">
      <script type="text/javascript" src="../../form_control.js"></script>
      <fieldset>
        <legend>Create User</legend>
        <table>
          <tr>
            <td><label>Choose A Username</label></td>
            <td><input name="username" type="text" /></td>
          </tr>
          <tr>
            <td><label>Choose Your Password</label></td>
            <td><input name="password1" id="password1" type="password" onblur="checkpass('password1', 'password2', 'mssg_newuser');" /></td>
          </tr>
          <tr>
            <td><label>Re-Enter Your Password</label></td>
            <td><input name="password2" id="password2" type="password" onblur="checkpass('password1', 'password2', 'mssg_newuser');" /><span id="mssg_newuser" /></span></td>
          </tr>
          <tr>
						<td><label>Choose Facility</label></td>
						<td><?php $this->dropdown('facility', 'Facility', $this->facility_table, $this->facility_id, $this->facility_name, 0, ''); ?></td>
          </tr>
          <tr>
						<td><label>Choose User Level</label></td>
						<td><?php $this->dropdown('level', 'User Level', $this->level_table, $this->level_id, $this->level_type, 0, ''); ?></td>    
          </tr>
          <tr>
            <td><label>Enter Your Last Name</label></td>
            <td><input name="lname" type="text"></td>
          </tr>
          <tr>
            <td></td>
            <td align="left">
              <input class="submit" value="Register" type="button" onclick="newuser(this.form);">
            </td>
          </tr>
        </table>
      </fieldset>
    </form>
    <?php
  }
  
    //change password form
  function changepasswordform(){
    //conect to DB
    $this->dbconnect();
    ?>
    <form id="changepass_form" method="post" action="">
      <script type="text/javascript" src="../../form_control.js"></script>
      <fieldset>
        <legend>Change Password</legend>
        <table>
          <tr>
            <td><label for="oldpassword">Old Password</label></td>
            <td><input name="oldpassword" id="oldpassword" type="password" /></td>
          </tr>
          <tr>
            <td><label for="newpassword1">Enter New Password</label></td>
            <td><input name="newpassword1" id="newpassword1" type="password" onblur="checkpass('newpassword1', 'newpassword2', 'mssg_changepassword');" /></td>
          </tr>
          <tr>
            <td><label for="newpassword2">Re-Enter New Password</label></td>
            <td>
              <input name="newpassword2" id="newpassword2" type="password" onblur="checkpass('newpassword1', 'newpassword2', 'mssg_changepassword');" />
              <span id="mssg_changepassword"></span>
            </td>
          </tr>
          <tr>
            <td></td>
            <td align="left"><input class="submit" value="Update Password" type="button" onclick="changepassword('changepass_form')"></td>
          </tr>
        </table>
      </fieldset>
    </form>
  <?php
  }
  
    //reset password form
  function resetform($action_reset){
    //conect to DB
    $this->dbconnect();
    ?>
    <form name="reset_form" id="reset_form" enctype="application/x-www-form-urlencoded" method="post" action="<?php echo $action_reset ?>">
      <fieldset>
        <legend>Reset Password</legend>
        <table>
          <tr>
            <td><label for="username">Username</label></td>
            <td><input name="username" id="username" type="text"></div></td>
          </tr>
          <tr>
            <td></td>
            <td align="left">
              <input name="action" class="action" value="resetlogin" type="hidden">
              <input name="submit4" class="submit" value="Reset Password" type="submit">
            </td>
          </tr>
        </table>
      </fieldset>
    </form>
  <?php
  }
  
  //logout form
  function logoutform($action_logout){
    //conect to DB
    $this->dbconnect();
    ?>
    <form name="logout_form" id="logout_form" enctype="application/x-www-form-urlencoded" method="post"action="<?php echo $action_logout ?>">
      <input type="submit" name="submit5" class="submit" value="Logout"
        style="background:none; border:none; color:#fff; padding:0; margin:0" />
      <input name="action" class="action" value="logout" type="hidden" />
    </form>
  <?php
  }
  
  //new patient form
  function new_patient_form(){
    //conect to DB
    $this->dbconnect();
    ?>
		<script type="text/javascript">
		function checkForm(f) {
			var errors = new Array();
			
			var lname = f.elements['lname'].value;
			var dob = f.elements['dob'].value;
			
			if (lname < 1) errors.push("Please enter a last name.\n");			
			if (dob < 1) errors.push("Please enter a date of birth.\n");
			else if (!isValidDate(dob)) errors.push("Please enter a valid date of birth.\n");
			
			if (errors.length > 0) {
				var error_string = "";
				for (var e = 0; e < errors.length; e++) error_string += errors[e];
				alert(error_string);
				return false;
			} else {
				alert("Submitted!");
				addpatient(f);
			}
		}
		</script>
    <form method="post" action="">
      <script type="text/javascript" src="../../form_control.js"></script>
			<style type="text/css">
				label {font-weight:bold;}
				.lbl {text-align:center; font-size:smaller;}
				.ele {text-align:center;float:left;}
				.type_head {padding:4px; font-weight:bold; font-size:150%;}
			</style>
      <fieldset>
        <legend>Patient Information</legend>
				<table>
					<tr>
						<td><Label>Patient Name</Label></td>
						<td colspan="2">
							<div class="ele">
								<select name="title" title="Title">
									<option value="Mr.">Mr</option>
									<option value="Mrs.">Mrs</option>
									<option value="Ms.">Ms</option>
								</select><br />
								<span class="lbl">Title</span>
							</div>
							<div class="ele">
								<input type="text" name="fname" size="15" title="First Name" /><br />
								<span class="lbl">First</span>
							</div>
							<div class="ele">
								<input type="text" name="mname" size="10" title="Middle Name" /><br />
								<span class="lbl">Middle</span>
							</div>
							<div class="ele">
								<input type="text" name="lname" size="15" title="Last Name" /><br />
								<span class="lbl">Last</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><label>Date of Birth</label></td>
						<td>
							<div class="ele">
								<input type="text" name="dob" title="Date of Birth" /><br />
								<span class="lbl">YYYY-MM-DD</span>
							</div>
						<td>
							<label>Sex</label>
							<select name="sex" title="Sex" /><br />
								<option value="">Unassigned</option>
								<option value="Female">Female</option>
								<option value="Male">Male</option>
							</select>	
						</td>
					</tr>
					<tr>
						<td><label>Language</label></td>
						<td><input type="text" name="language" title="Language" /></td>
					</tr>
					<tr>
						<td>
							<label>Race</label>
						</td>
						<td>
							<select name="race" id="race" title="Race">
								<option value="Unknown">Unknown</option>
								<option value="American Indian">American Indian or Alaska Native</option>
								<option value="Asian">Asian</option>
								<option value="Black">Black or African American</option>
								<option value="Pacific Islander">Native Hawaiian or Other Pacific Islander</option>
								<option value="White">White</option>
								<option value="Other">Other</option>
							</select>
						</td>
						<td colspan="2">
							<label>Ethnicity</label>
							<select name="ethnicity" id="ethnicity" title="Ethnicity">
								<option value="Unknown">Unknown</option>
								<option value="Hispanic">Hispanic</option>
								<option value="Non-Hispanic">Non-Hispanic</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label>Driver's License</label>
							<input type="text" name="dl" title="Driver's License" />
						</td>
						<td colspan="2">
							<label>National ID</label>
							<input type="text" name="nid" title="National Identification Number" />
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<label>Occupation</label><br />
							<textarea name="occupation" title="Employment Information" rows="8" cols="72"></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>Contact Information</legend>
				<table>
					<tr>
						<td><label>Address</label></td>
						<td colspan="4">
							<div class="ele">
								<input type="text" name="street" title="Street" /><br />
								<span class="lbl">Street</span>
							</div>
							<div class="ele">
								<input type="text" name="city" size="10" title="City" /><br />
								<span class="lbl">City</span>
							</div>
							<div class="ele">
								<input type="text" name="state" size="10" title="State" /><br />
								<span class="lbl">State</span>
							</div>
							<div class="ele">
								<input type="text" name="postal_code" size="5" title="Postal Code" /><br />
								<span class="lbl">Postal Code</span>
							</div>
							<div class="ele">
								<?php $this->dropdown('patient_country', 'Country','geo_country_reference', 'countries_id', 'countries_name', 222, ''); ?><br />
								<span class="lbl">Country</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><label>Phone</label></td>
						<td colspan="4">
							<div class="ele">
								<input type="text" name="phone_home" size="15" title="Home Phone" /><br />
								<span class="lbl">Home</span>
							</div>
							<div class="ele">
								<input type="text" name="phone_cell" size="15" title="Cell Phone" /><br />
								<span class="lbl">Cell</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><label>Mother's<br />Name</label></td>
						<td><input type="text" name="mothers_name" size="30" title="Mother's Name" /></td>
						<td><label>Guardians's<br />Name</label></td>	
						<td><input type="text" name="guardians_name" size="30" title="Guardians's Name" /></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>Insurance Information</legend>
				<table>
					<tr>
						<td colspan="2">
							<label>Primary Insurance Provider</label>
							<select name="i1provider">
								<option value="">Unassigned</option>
							</select>
						</td>
					</tr>
					<tr>
					<td valign="top">
						<table border="0">
							<tr>
								<td><label>Plan Name</label></td>
								<td><input type="text" size="20" name="i1plan_name" />
							</tr>
							<tr>
								<td><label>Effective Date</label></td>
								<td><input type="text" name="i1effective_date" size="11" /></td>
							</tr>
							<tr>
								<td><label>Policy Number</label></td>
								<td><input type="text" name="i1policy_number" size="16" /></td>
							</tr>
							<tr>
								<td><label>Group Number</label></td>
								<td><input type="text"  name="i1group_number" size="16" /></td>
							</tr>
							<tr>
								<td>
									<label>Subscriber Employer (SE)</label>
								</td>
								<td><input type="text"  name="i1subscriber_employer" size="25"/></td>
							</tr>
							<tr>
								<td><label>SE Address<label></td>
								<td><input type="text" name="i1subscriber_employer_street" size="25" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<table>
										<tr>
											<td><label>SE City</label></td>
											<td><input type="text" name="i1subscriber_employer_city" size="15"/></td>
											<td><label>SE State:</label></td>
											<td><input type="text" name="form_i1subscriber_employer_state" title="" /></td>
										</tr>
										<tr>
											<td><label>SE Zip Code</label></td>
											<td><input type="text" name="i1subscriber_employer_postal_code" size="10"></td>
											<td><label>SE Country</label></td>
											<td><?php $this->dropdown('form_i1subscriber_employer_country', 'Country','geo_country_reference', 'countries_id', 'countries_name', 223, ''); ?></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						<label>Subscriber</label>
						<input type="text" name="i1subscriber_fname" size="10" />
						<input type="text" name="i1subscriber_mname" size="3" />
						<input type="text" name="i1subscriber_lname" size="10" />
						<br />
						<label>Relationship</label>
						<select name="form_i1subscriber_relationship" title="">
							<option value=""> </option>
							<option value="self">Self</option>
							<option value="spouse">Spouse</option>
							<option value="child">Child</option>
						</select>
						<label>DOB</label>
						<input type="text" name="i1subscriber_DOB" size="11" /><br />
						<label>SSN</label>
						<input type="text" size="11" name="i1subscriber_ss" value="" />
						<label>Sex</label>
						<select name="form_i1subscriber_sex" id="form_i1subscriber_sex" title="" /><br />
							<option value="">Unassigned</option>
							<option value="Female">Female</option>
							<option value="Male">Male</option>
						</select>	
						<br />
						<label>Subscriber Address</label>
						<input type="text" name="i1subscriber_street" size="25" /><br />
						<label>City</label>
						<input type="text" name="i1subscriber_city" size="15" />
						<label>State</label>
						<input type="text" name="form_i1subscriber_state" title="" /><br />
						<label>Zip Code</label>
						<input type="text" size="10" name="i1subscriber_postal_code" value="">
						<label>Country</label>
						<input type="text" name="form_i1subscriber_country" /><br />
						<label>Subscriber Phone</label>
						<input type="text" size="20" name="i1subscriber_phone" /><br />
						<label>CoPay: <input type="text" size="6" name="i1copay" value="">
					</td>
				 </tr>
				 <tr>
						<td colspan="2">
							<label>Secondary Insurance Provider</label>
							<select name="i2provider">
								<option value="">Unassigned</option>
							</select>
						</td>
					</tr>
					<tr>
					<td valign="top">
						<table border="0">
							<tr>
								<td><label>Plan Name</label></td>
								<td><input type="text" size="20" name="i2plan_name" />
							</tr>
							<tr>
								<td><label>Effective Date</label></td>
								<td><input type="text" name="i2effective_date" size="11" /></td>
							</tr>
							<tr>
								<td><label>Policy Number</label></td>
								<td><input type="text" name="i2policy_number" size="16" /></td>
							</tr>
							<tr>
								<td><label>Group Number</label></td>
								<td><input type="text"  name="i2group_number" size="16" /></td>
							</tr>
							<tr>
								<td>
									<label>Subscriber Employer (SE)</label>
								</td>
								<td><input type="text"  name="i2subscriber_employer" size="25"/></td>
							</tr>
							<tr>
								<td><label>SE Address<label></td>
								<td><input type="text" name="i2subscriber_employer_street" size="25" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<table>
										<tr>
											<td><label>SE City</label></td>
											<td><input type="text" name="i2subscriber_employer_city" size="15"/></td>
											<td><label>SE State:</label></td>
											<td><input type="text" name="form_i2subscriber_employer_state" title="" /></td>
										</tr>
										<tr>
											<td><label>SE Zip Code</label></td>
											<td><input type="text" name="i2subscriber_employer_postal_code" size="10"></td>
											<td><label>SE Country</label></td>
											<td><?php $this->dropdown('form_i2subscriber_employer_country', '','geo_country_reference', 'countries_id', 'countries_name', 223, ''); ?></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						<label>Subscriber</label>
						<input type="text" name="i2subscriber_fname" size="10" />
						<input type="text" name="i2subscriber_mname" size="3" />
						<input type="text" name="i2subscriber_lname" size="10" />
						<br />
						<label>Relationship</label>
						<select name="form_i2subscriber_relationship" title="">
							<option value=""> </option>
							<option value="self">Self</option>
							<option value="spouse">Spouse</option>
							<option value="child">Child</option>
						</select>
						<label>DOB</label>
						<input type="text" name="i2subscriber_DOB" size="11" /><br />
						<label>SSN</label>
						<input type="text" size="11" name="i2subscriber_ss" value="" />
						<label>Sex</label>
						<select name="form_i2subscriber_sex" id="form_i2subscriber_sex" title="" /><br />
							<option value="">Unassigned</option>
							<option value="Female">Female</option>
							<option value="Male">Male</option>
						</select>	
						<br />
						<label>Subscriber Address</label>
						<input type="text" name="i2subscriber_street" size="25" /><br />
						<label>City</label>
						<input type="text" name="i2subscriber_city" size="15" />
						<label>State</label>
						<input type="text" name="form_i2subscriber_state" title="" /><br />
						<label>Zip Code</label>
						<input type="text" size="10" name="i2subscriber_postal_code" value="">
						<label>Country</label>
						<input type="text" name="form_i2subscriber_country" /><br />
						<label>Subscriber Phone</label>
						<input type="text" size="20" name="i2subscriber_phone" /><br />
						<label>CoPay: <input type="text" size="6" name="i2copay" value="">
					</td>
				 </tr>
				</table>
      </fieldset>
			<div style="text-align:center;"><input class="submit" value="Create Patient" type="button" onclick="return checkForm(this.form); return false;" /> <input type="reset" /></div>
    </form>
    <?php
  }
  
  //search form
  function search_patient_form(){
    //conect to DB
    $this->dbconnect();
		
		/*
		$patient_list = Array();
		while($row = mysql_fetch_assoc($result)) {
			$patient_list[] = $row;
		}
		
		for ($i = 0; $i < sizeof($patient_list); $i++) {
			foreach($patient_list[$i] as $key => $value) {	
				if ($key === "lname") $patient_list[$i]["$key"] = $this->decrypt($value, $privKey);
			}
		}
		
		for ($i = 0; $i < sizeof($patient_list); $i++) {
			$p = $patient_list[$i];
			
			asort($p, $patient_list[$i]['lname']);
		}	

		echo "<pre>";
		print_r($patient_list);
		echo "</pre>";
		*/	
		?>
		
    <form enctype="application/x-www-form-urlencoded" method="post" action="../../form_action.php">
      <label for="search_input">Patient</label>
      <?php echo $this->patient_list('selectedpatient'); ?>
      <input name="action" class="action" value="selectpatient" type="hidden" />
      <input name="submit" class="submit" value="Select Patient" type="submit" />
    </form>
  <?php
  }
	
	// Need to add address???
	function add_insurer_form() {
		//conect to DB
    $this->dbconnect();
	  ?>
		<form method="post" action="">
			<script type="text/javascript" src="../../form_control.js"></script>
			<label>Insurer Name</label>
			<input type="text" name="i_name" /><br />
			<label>Message</label>
			<input type="text" name="i_name" /><br />
			<input type="button" name="send" value="Send Message" onclick="xxx(this.form);"/>
		</form>
		<?php
	}
	
	function message_form() {
    //conect to DB
    $this->dbconnect();
	  ?>
		<form method="post" action="">
			<script type="text/javascript" src="../../form_control.js"></script>
			<label>To</label><?php $this->user_list('recipient') ?>
			<label>Subject</label><input type="text" name="subject" /><br />
			<label>Message</label><br /><textarea name="message" rows="12" cols="60"></textarea><br />
			<input type="button" name="send" value="Send Message" onclick="send_message(this.form);"/>
		</form>
		<?php
	}
	
	
	function visit_form() {
    //conect to DB
    $this->dbconnect();
	  ?>
		<form method="post" action="">
			<script type="text/javascript" src="../../form_control.js"></script>
			<script type="text/javascript" src="../../js/calendarDateInput/calendarDateInput.js"></script>
			<script type="text/javascript" src="../../js/timeInput.js"></script>
			<table>
				<tr>
					<td><label>Type</label></td>
					<td>
						<select name="type">
							<option value="Appointment">Appointment</option>
							<option value="Walk-In">Walk-In</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>Date</label></td>
					<td><script>DateInput('date', true, 'YYYY-MM-DD')</script></td>
				</tr>
				<tr>
					<td><label>Time</label></td>
					<td><script>TimeInput('time')</script></td>
				</tr>
				<tr>
					<td><label>Patient</label></td>
					<td><?php echo $this->patient_list('patient'); ?></td>
				</tr>
				<tr>
					<td><label>Physician</label></td>
					<td><?php echo $this->dropdown('physician', 'Physician', 'users', 'id', 'lname', -1, 'WHERE `userlevel` = 1 ORDER BY lname ASC'); ?></td>
				</tr>
				<tr>
					<td><label>Facility</label></td>
					<td><?php echo $this->dropdown('facility', 'Facility', 'facility', 'id', 'name', -1, ''); ?></td>
				</tr>
				<tr>
					<td><label>Notes</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="notes" rows="6" cols="45"></textarea></td>
				</tr>
			</table>
			<input type="button" name="send" value="Add Visit" onclick="add_visit(this.form);"/>
		</form>
		<?php
	}
	
	function encrypt($data, $pubKey) {			
		openssl_public_encrypt($data, $encrypted, $pubKey);
		return $encrypted;
	}
	
	function decrypt($data, $privKey) {			
		openssl_private_decrypt($data, $decrypted, $privKey); 
		return $decrypted;
	}
	
	function getPublicKey($parentDir, $key) {
		// Public Key
		$filename = $parentDir."ssl/keys/".$key.".pub";
		$handle = fopen($filename, 'r');
		$pubKey = fread($handle, filesize($filename));
		fclose($handle);
		return $pubKey;
	}
	
	function getPrivateKey($parentDir, $key) {
		// Private Key
		$filename = $parentDir."ssl/keys/".$key;
		$handle = fopen($filename, 'r');
		$privKey = fread($handle, filesize($filename));
		fclose($handle);
		return $privKey;
	}
	
  // Creates a dropdown menu for a specific table
  function dropdown($name, $title, $table, $value, $option, $selected, $where) {
    $this->dbconnect();
    $dropdown_list = '';
    $dropdown_list .= '<select title="'.$title.'" name="'.$name.'" id="'.$name.'">';
    $qry = "SELECT * FROM ".$table." ".$where.";";
    $result = mysql_query($qry) or die(mysql_error());
    while($row = mysql_fetch_assoc($result)) {
			$dropdown_list .= "<option value ='".$row[$value]."'>".$row[$option]."</option>";
		}
    $dropdown_list .= '</select><script type="text/javascript">document.getElementById("'.$name.'").selectedIndex = '.$selected.';</script>';
    echo $dropdown_list;
  }
	
	function user_list($name) {
		?><select name="<?php echo $name; ?>"><?php
		$query = "SELECT * FROM `users`";
		$result = mysql_query($query) or die(mysql_error());
		while($row = mysql_fetch_assoc($result)) {
			?><option value="<?php echo $row['id']; ?>"><?php echo $row['email'];?></option><?php
		}
		?></select><?php
	}
	
	function patient_list($name) {
		$this->dbconnect();
		$privKey = $this->getPrivateKey('../../', 'common');
		$qry = "SELECT * FROM `patient_data` ORDER BY 'lname'";
		$result = mysql_query($qry) or die(mysql_error());
		?>
			<select name="<?php echo $name; ?>" id="<?php echo $name; ?>"/>
        <?php while($row = mysql_fetch_assoc($result)) { ?>
						<?php $dob = $this->decrypt($row[$this->patient_dob], $privKey); ?>
            <option value="<?php echo $row[$this->patient_id]; ?>"><?php echo $this->decrypt($row[$this->patient_lname], $privKey); ?> <?php echo $this->decrypt($row[$this->patient_mname], $privKey); ?>, <?php echo $this->decrypt($row[$this->patient_fname], $privKey); ?><?php echo "; ".$dob; ?></option>				
        <?php } ?>
      </select>
			<script type="text/javascript">document.getElementById('<?php echo $name; ?>').selectedIndex = -1;</script>
		<?php
	}
  
  function getAge($birthdate) {
    // Explode the date (YYYY-MM-DD)
    list($birth_year, $birth_month, $birth_day) = explode("-", $birthdate);
    // Find the differences
    $year_diff = date("Y") - $birth_year;
    $month_diff = date("m") - $birth_month;
    $day_diff = date("d") - $birth_day;
    // If the birthday has not occured this year
    if (($day_diff < 0 && $month_diff == 0) || $month_diff < 0) $year_diff--;
    return $year_diff;
  }
  
  function getTimeStamp() {
    $mysqldate = date( 'Y-m-d H:i:s', $phpdate );
    $phpdate = strtotime( $mysqldate );
    return $phpdate;
  }
}
?>