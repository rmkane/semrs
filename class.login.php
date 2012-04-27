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
      if(row != "Error") { $type = $row[$this->level_type]; }
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
  function createpatient($title, $fname, $mname, $lname, $dob, $sex, $race, $ethnicity, $street, $city, $state, $postal_code, $country, $phone_home, $phone_cell) {
    //conect to DB
    $this->dbconnect();
		
		$pubKey = $this->getPublicKey('', 'common');
		
		$title = $this->encrypt($title, $pubKey);
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
		$regdate = $this->encrypt(time(), $pubKey);
		
		$qry = $this->qry("INSERT INTO ".$this->patient_table." (".$this->patient_title.",".$this->patient_fname.",".$this->patient_mname.",".$this->patient_lname.",".$this->patient_dob.",".$this->patient_sex.",".$this->patient_race.",".$this->patient_ethnicity.",".$this->patient_street.",".$this->patient_city.",".$this->patient_state.",".$this->patient_postal_code.",".$this->patient_country.",".$this->patient_phone_home.",".$this->patient_phone_cell.",".$this->patient_regdate.") VALUES ('?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?');", $title, $fname,	$mname, $lname, $dob, $sex, $race, $ethnicity, $street, $city, $state, $postal_code, $country, $phone_home, $phone_cell, $regdate);
		echo "New Patient: ".$lname." ".$mname.", ".$fname." was created!";
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
  function newuserform($formaction){
    //conect to DB
    $this->dbconnect();
    ?>
    <form name="newuser_form" id="newuser_form" method="post" action="">
      <script type="text/javascript" src="../../form_control.js"></script>
      <fieldset>
        <legend>Create User</legend>
        <table>
          <tr>
            <td><label for="usernameCreate">Choose A Username</label></td>
            <td><input name="username" id="usernameCreate" type="text" /></td>
          </tr>
          <tr>
            <td><label for="password1">Choose Your Password</label></td>
            <td><input name="password1" id="password1" type="password" onblur="checkpass('password1', 'password2', 'mssg_newuser');" /></td>
          </tr>
          <tr>
            <td><label for="password2">Re-Enter Your Password</label></td>
            <td><input name="password2" id="password2" type="password" onblur="checkpass('password1', 'password2', 'mssg_newuser');" /><span id="mssg_newuser" /></span></td>
          </tr>
          <tr>
            <?php $this->dropdown('Choose Facility', 'Facility', $this->facility_table, $this->facility_id, $this->facility_name, 0); ?>
          </tr>
          <tr>
            <?php $this->dropdown('Choose User Level', 'User Level', $this->level_table, $this->level_id, $this->level_type, 0); ?>
          </tr>
          <tr>
            <td><label for="lname">Enter Your Last Name</label></td>
            <td><input name="lname" id="lname" type="text"></td>
          </tr>
          <tr>
            <td></td>
            <td align="left">
              <input class="submit" value="Register" type="button" onclick="newuser('newuser_form');">
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
			
			var lname = f.elements["lname"].value;
			var dob = f.elements["dob"].value;
			
			if (lname < 1) errors.push("Please enter a last name.\n");			
			if (dob < 1) errors.push("Please enter a date of birth.\n");
			else if (!isValidDate(dob)) errors.push("Please enter a valid date of birth.\n");
			
			if (errors.length > 0) {
				var error_string = "";
				for (var e = 0; e < errors.length; e++) error_string += errors[e];
				alert(error_string);
				return false;
			} else {
				addpatient(f);
			}
		}
		</script>
    <form method="post" action="" id="newPatient_form">
      <script type="text/javascript" src="../../form_control.js"></script>
      <fieldset>
        <legend>New Patient</legend>
				<style type="text/css">
					tr {border:#00f thin solid; margin:2px; padding:2px;}
					td {border:#f00 thin solid; margin:12px;}
				</style>
        <table>
          <tr>
            <td><label>Name</label></td>
            <td>
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
            <td><label>DOB</label></td>
            <td><input name="dob" id="dob" type="text" value="" size="10" title="Date of Birth" /><span style="font-size:smaller" >YYYY-MM-DD</span></td>
            <td><label>Sex</label></td>
            <td>
              <select name="sex" id="sex" title="Gender">
                <option value="M">Male</option>
                <option value="F">Female</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><label>Race</label></td>
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
						<td><label>Ethnicity</label></td>
            <td>
              <select name="ethnicity" id="ethnicity" title="Ethnicity">
                <option value="Unknown">Unknown</option>
                <option value="Hispanic">Hispanic</option>
                <option value="Non-Hispanic">Non-Hispanic</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><label>Street</label></td>
            <td><input name="street" id="street" type="text" value="" size="27" title="Street" /></td>
          </tr>
          <tr>
            <td></td>
						<td>
            <input name="city" id="city" type="text" value="" size="10" title="City" />
            <input name="state" id="state" type="text" value="" size="10" title="State" />
            <input name="postal_code" id="postal_code" type="text" value="" size="5" title="Postal Code" />
						</td>
					</tr>
					<tr>
            <?php $this->dropdown('Country','Country','geo_country_reference', 'countries_id', 'countries_name', 223); ?>
          </tr>
          <tr>
            <td><label>Phone</label></td>
            <td>
							<input name="home" id="home" type="text" value="" size="10" title="Home Phone" />(Home)
							<input name="cell" id="cell" type="text" value="" size="10" title="Cell Phone" />(Cell)
						</td>
          </tr>
          <tr>
            <td colspan="4" align="center"><div style="text-align:center;"><input class="submit" value="Create Patient" type="button" onclick="return checkForm(this.form); return false;" /> <input type="reset" /></div></td>
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
		
		$privKey = $this->getPrivateKey('../../', 'common');
		
		$qry = "SELECT * FROM `patient_data` ORDER BY 'lname'";
		$result = mysql_query($qry) or die(mysql_error());
		
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

		*/	
		?>
		
		<pre><?php print_r($patient_list); ?></pre>
		
    <form enctype="application/x-www-form-urlencoded" method="post" action="../../form_action.php">
      <label for="search_input">Patient</label>
      <select name="selectedpatient" id="selectedpatient"/>
        <?php while($row = mysql_fetch_assoc($result)) { ?>
						<?php $dob = $this->decrypt($row[$this->patient_dob], $privKey); echo dob;  ?>
            <option value="<?php echo $row[$this->patient_id]; ?>"><?php echo $this->decrypt($row[$this->patient_lname], $privKey); ?> <?php echo $this->decrypt($row[$this->patient_mname], $privKey); ?>, <?php echo $this->decrypt($row[$this->patient_fname], $privKey); ?> 	<?php echo "Age:".$this->getAge($dob); ?></option>				
        <?php } ?>
      </select>
			<script type="text/javascript">document.getElementById('selectedpatient').selectedIndex = -1;</script>
      <input name="action" class="action" value="selectpatient" type="hidden" />
      <input name="submit" class="submit" value="Select Patient" type="submit" />
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
  function dropdown($label, $title, $table, $value, $option, $selected) {
    $this->dbconnect();
    $dropdown_list = '';
    $dropdown_list .= $label == '' ? '' : '<td><label for="'.$table.'">'.$label.'</label></td>';
    $dropdown_list .= '<td><select title="'.$title.'" name="'.$table.'" id="'.$table.'">';
    $qry = "SELECT * FROM ".$table.";";
    $result = mysql_query($qry) or die(mysql_error());
    while($row = mysql_fetch_assoc($result)) {
			$dropdown_list .= "<option ";
			$dropdown_list .= $row[$value] == $selected ? "SELECTED" : "";
			$dropdown_list .= " value ='".$row[$value]."'>".$row[$option]."</option>";
		}
    $dropdown_list .= '</select></td>';
    echo $dropdown_list;
  }
  
  function getAge($birthdate) {
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
}
?>