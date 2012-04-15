<?php
//For security reasons, don't display any errors or warnings. Comment out in DEV.
error_reporting(0);

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
    if($row != "Error"){
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
		if ($password1 == $password2) {
		  $password1 = md5($password1); // Encrypt Password
		  // Insert New User into Users table
			$qry = $this->qry("INSERT INTO ".$this->user_table." (".$this->user_email.",".$this->user_password.",".$this->user_level.",".$this->user_facility_id.",".$this->user_lname.") VALUES ('?', '?', '?', '?', '?');", $username, $password1, $level, $facility_option, $lname);
			// Get the associated user type from the id			
			$result = $this->qry("SELECT ".$this->level_type." FROM ".$this->level_table." WHERE ".$this->level_id." = '?';", $level);
			$row=mysql_fetch_assoc($result);
			if(row != "Error") { $type = "".$row[$this->level_type]; }
			echo "New User: ".$username."(".$type.") was created!";
			return true;
		} else {
		  echo "Failed to create user";
			return false;
		}
	}
	
	function changepassword($oldpassword, $newpassword1, $newpassword2) {
	  //conect to DB
    $this->dbconnect();
		$username = $_SESSION['useremail'];
		$result = $this->qry("SELECT ".$this->user_password." FROM ".$this->user_table." WHERE ".$this->user_email." = '?';", $username);
		$row=mysql_fetch_assoc($result);
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
 
    //make sure password column and table are set
    if($this->user_password == ""){
      $this->user_password = $user_password;
    }
    if($this->user_email == ""){
      $this->user_email = $user_email;
    }
    if($this->user_table == ""){
      $this->user_table = $user_table;
    }
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
	function createpatient($title, $fname,	$mname, $lname, $dob, $sex, $race, $ethnicity, $street, $city, $postal_code, $country, $phone_home, $phone_cell, $regdate) {
	  //conect to DB
    $this->dbconnect();
		//
		if ($lname != "" && $dob != "") {
			$qry = $this->qry("INSERT INTO ".$this->patient_table." (".$this->patient_title.",".$this->patient_fname.",".$this->patient_mname.",".$this->patient_lname.",".$this->patient_dob.",".$this->patient_sex.",".$this->patient_race.",".$this->patient_ethnicity.",".$this->patient_street.",".$this->patient_city.",".$this->patient_postal_code.",".$this->patient_country.",".$this->patient_phone_home.",".$this->patient_phone_cell.",".$this->patient_regdate.") VALUES ('?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?');", $title, $fname,	$mname, $lname, $dob, $sex, $race, $ethnicity, $street, $city, $postal_code, $country, $phone_home, $phone_cell, $regdate);
			echo "New Patient: ".$lname." ".$mname.", ".$fname." was created!";
			return true;
		} else return false;
	}
	
	function displaypatientinfo($search_type, $search_input) {
		//conect to DB
    $this->dbconnect();
		//if both passwords match		
		$condition = $search_type == 'DOB' ? '=' : 'LIKE';
		$search_term = $condition == "LIKE" ? "%".$search_input : $search_input;
	  $qry = "SELECT * FROM ".$this->patient_table." WHERE ".$search_type." ".$condition." '".$search_term."' ORDER BY lname, fname;";
		$result = mysql_query($qry) or die(mysql_error());
		if (mysql_num_rows($result) > 0) {
			$num = mysql_num_rows($result);
			?>
			<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
			"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
				<head>
					<title>Search Results</title>
					<meta name="Author" content="Ryan Kane" />
					<link rel="stylesheet" href="<?php echo $css_header;?>" type="text/css" />
				</head>
				<body onblur="self.close();" >
					<strong>Found <?php echo $num ?> patients matching <?php echo $search_input ?><br /></strong>
					<form name="select_name" id="select_id" enctype="application/x-www-form-urlencoded" method="post" action="../../form_action.php">
					<select name="selectedpatient" multiple="yes" size="<?php echo $num ?>" />
					<?php while($row = mysql_fetch_array($result)) { ?>
						<option value="<?php echo $row[$this->patient_id] ?>"><?php echo $row[$this->patient_lname] ?> <?php echo $row[$this->patient_mname] ?>, <?php echo $row[$this->patient_fname] ?> 	<?php echo "Age:".$this->GetAge($row[$this->patient_dob]); ?></option>				
					<?php } ?>
					</select><br />
					<input name="action" class="action" value="selectpatient" type="hidden" />
					<input name="submit" class="submit" value="Select Patient" type="submit" />
					<br /><a href="main.php">Return</a>
				</body>
			</html>
			<?php
			return true;
		} else return false;
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
					<td>
						<label for="username">Username</label>
					</td>
					<td>
						<input name="username" id="username" type="text" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="password">Password</label>
					</td>
					<td>
						<input name="password" id="password" type="password" />
					</td>
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
  function newuserform($formaction){
    //conect to DB
    $this->dbconnect();
    ?>
		<form name="newuser_form" id="newUser_form" method="post" action="">
			<script type="text/javascript" src="../..form_control.js"></script>
			<fieldset>
				<legend>Create User</legend>
				<table>
					<tr>
						<td>
							<label for="usernameCreate">Choose A Username</label>
						</td>
						<td>
							<input name="username" id="usernameCreate" type="text" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="password1">Choose Your Password</label>
						</td>
						<td>
							<input name="password1" id="password1" type="password" onblur="checkpass(\'password1\', \'password2\', \'mssg_newuser\');" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="password2">Re-Enter Your Password</label>
						</td>
						<td>
							<input name="password2" id="password2" type="password" onblur="checkpass(\'password1\', \'password2\', \'mssg_newuser\');" />
							<span id="mssg_newuser" /></span>
						</td>
					</tr>
					<tr>
						<?php $this->dropdown('Choose Facility', 'Facility', $this->facility_table, $this->facility_id, $this->facility_name); ?>
					</tr>
					<tr>
						<?php $this->dropdown('Choose User Level', 'User Level', $this->level_table, $this->level_id, $this->level_type); ?>
					</tr>
					<tr>
						<td>
							<label for="lname">Enter Your Last Name</label>
						</td>
						<td>
							<input name="lname" id="lname" type="text">
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="left">
							<input class="submit" value="Register" type="button" onclick="newuser('newUser_form');">
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
		<form name="changepass_form" id="changepass_form" method="post" action="">
			<script type="text/javascript" src="../../form_control.js"></script>
			<fieldset>
				<legend>Change Password</legend>
				<table>
      		<tr>
        		<td>
          		<label for="oldpassword">Old Password</label>
        		</td>
		        <td>
          		<input name="oldpassword" id="oldpassword" type="password" />
        		</td>
      		</tr>
      		<tr>
        		<td>
          		<label for="newpassword1">Enter New Password</label>
        		</td>
        		<td>
          		<input name="newpassword1" id="newpassword1" type="password" onblur="checkpass('newpassword1', 'newpassword2', 'mssg_changepassword');" />
        		</td>
      		</tr>
      		<tr>
        		<td>
          		<label for="newpassword2">Re-Enter New Password</label>
        		</td>
        		<td>
          		<input name="newpassword2" id="newpassword2" type="password" onblur="checkpass('newpassword1', 'newpassword2', 'mssg_changepassword');" />
          		<span id="mssg_changepassword"></span>
        		</td>
      		</tr>
		   		<tr>
						<td></td>
		     		<td align="left">
    	     		<input class="submit" value="Update Password" type="button" onclick="changepassword('changepass_form')">
      			</td>
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
						<td>
							<label for="username">Username</label>
						</td>
						<td>
							<input name="username" id="username" type="text"></div>
						</td>
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
		<form name="newPatient_form" method="post" id="newPatient_form" action="">
			<script type="text/javascript" src="../../form_control.js"></script>
			<fieldset>
				<legend>New Patient</legend>
				<table>
					<tr>
						<td>
							<label>Name</label>
						</td>
						<td colspan="5">
							<select name="title" id="title" title="Title">
								<option>Unassigned</option>
								<option>Mr.</option>
								<option>Mrs.</option>
								<option>Ms.</option>
								<option>Dr.</option>
							</select>
							<input type="text" name="fname" id="fname" value="" size="10" title="First Name" />
							<input type="text" name="mname" id="mname" value="" size="5"  title="Middle Name" />
							<input type="text" name="lname" id="lname" value=""  size="10" title="Last Name" />
						</td>
					</tr>
					<tr>
						<td>
							<label>DOB</label>
						</td>
						<td colspan="2">
							<input name="dob" id="dob" type="text" value="" size="10" title="Date of Birth" />
							<span style="font-size:smaller" >YYYY/MM/DD</span>			  
						</td>
						<td>
							<label>Sex</label>
						</td>
						<td>
							<select name="sex" id="sex" title="Gender">
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
						</td>
      		</tr>
      		<tr>
        		<td>
          		<label>Race</label>
        		</td>
        		<td colspan="4">
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
      		</tr>
      		<tr>
        		<td>
          		<label>Ethnicity</label>
        		</td>
        		<td colspan="4">
          		<select name="ethnicity" id="ethnicity" title="Ethnicity">
            		<option value="Unknown">Unknown</option>
            		<option value="Hispanic">Hispanic</option>
            		<option value="Non-Hispanic">Non-Hispanic</option>
          		</select>
        		</td>
      		</tr>
      		<tr>
        		<td>
          		<label>Address</label>
        		</td>
        		<td colspan="2">
          		<input name="street" id="street" type="text" value="" size="27" title="Street" />
        		</td>
      		</tr>
      		<tr>
        		<td></td>
        		<td>
          		<input name="city" id="city" type="text" value="" size="10" title="City" />
		        </td>
        		<td>
          		<input name="state" id="state" type="text" value="" size="10" title="State" />
        		</td>
        		<td>
          		<input name="postal_code" id="postal_code" type="text" value="" size="5" title="Postal Code" />
        		</td>
							<?php $this->dropdown('','Country','geo_country_reference', 'countries_id', 'countries_name'); ?>
      		</tr>
      		<tr>
        		<td>
		          <label>Phone</label>
        		</td>
        		<td colspan="2">
          		<input name="home" id="home" type="text" value="" size="10" title="Home Phone" />(Home)
        		</td>
        		<td colspan="2">
          		<input name="cell" id="cell" type="text" value="" size="10" title="Cell Phone" />(Cell)
        		</td>
      		</tr>
					<tr>
						<td></td>
        		<td align="center" colspan="4">
          		<input class="submit" value="Create Patient" type="button" onclick="addpatient('newPatient_form')" />
        		</td>
					</tr>
		    </table>
  		</fieldset>
		</form>
    <?php
  }
	
	//search form
  function search_patient_form(){
    //conect to DB
    $this->dbconnect();
    ?>
		<form name="searchPatient_form" method="post" id="searchPatient_form" action="">
			<label for="search_input">Patient</label>
			<input name="search_input" id="search_input" type="text" value="" size="22" title="Search for a patient." />
			<select name="search_type" id="search_type">
				<option value="lname">Last Name</option>
				<option value="DOB">Date of Birth</option>
			</select>
			<input class="submit" value="Search" type="button" onclick="searchpatient('searchPatient_form')" />
		</form>
	<?php
  }
		
	// Creates a dropdown menu for a specific table
	function dropdown($label, $title, $table, $value, $option) {
	  $this->dbconnect();
		$dropdown_list = '';
		$dropdown_list .= $label == '' ? '' : '<td><label for="'.$table.'">'.$label.'</label></td>';
		$dropdown_list .= '<td><select title="'.$title.'" name="'.$table.'" id="'.$table.'">';
		$qry = "SELECT * FROM ".$table.";";
    $result = mysql_query($qry) or die(mysql_error());
    while($row = mysql_fetch_assoc($result)) { $dropdown_list .= "<option value ='".$row[$value]."'>".$row[$option]."</option>"; }
    $dropdown_list .= '</select></td>';
		echo $dropdown_list;
	}
	
	function GetAge($birthdate) {
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
	
	function getTimeStamp() {
		$mysqldate = date( 'Y-m-d H:i:s', $phpdate );
		$phpdate = strtotime( $mysqldate );
		return $phpdate;
	}
	
	//function to install logon table
  function cratetable($users_table){
    //conect to DB
    $this->dbconnect();
		// Update this to reflect current table structure
    $qry = "CREATE TABLE IF NOT EXISTS ".$tablename." (
            id int(11) NOT NULL auto_increment,
            useremail varchar(50) NOT NULL default '',
            password varchar(50) NOT NULL default '',
            userlevel int(11) NOT NULL default '0',
            PRIMARY KEY  (id)
            )";
    $result = mysql_query($qry) or die(mysql_error());
    return;
  }
}
?>