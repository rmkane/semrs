<?php
//For security reasons, don't display any errors or warnings. Comment out in DEV.
error_reporting(0);

//start session
session_start();
// http://www.emirplicanic.com/php/simple-phpmysql-authentication-class
class logmein {
  //database setup
  //MAKE SURE TO FILL IN DATABASE INFO
  var $hostname_logon = 'localhost';	//Database server LOCATION
  var $database_logon = 'semrs';			//Database NAME
  var $username_logon = 'root';				//Database USERNAME
  var $password_logon = '';						//Database PASSWORD
 
  //table fields
  var $user_table = 'users';          //Users table name
	var $user_id = 'id';
  var $user_email = 'email';     //USERNAME column (value MUST be valid email)
  var $user_password = 'password';      //PASSWORD column
  var $user_level = 'userlevel';      //(optional) userlevel column
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
        $_SESSION['useremail'] = $row[$this->user_email];
				$_SESSION['userfullname'] = $row[$this->user_fname]." ".$row[$this->user_mname]." ".$row[$this->user_lname];
				$_SESSION['loggedin'] = $row[$this->user_password];
        $_SESSION['userlevel'] = $row[$this->user_level];
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
		  echo "Passwords failed to match";
			return false;
		}
	}
	
	function changepassword($username, $oldpassword, $newpassword1, $newpassword2) {
	  //conect to DB
    $this->dbconnect();
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
    $chars = "abcdefghijkmnopqrstuvwxyz023456789";
    srand((double)microtime()*1000000);
    $i = 0;
    $pass = '' ;
    while ($i <= 7) { // Random 7 character password
      $num = rand() % 33;
      $tmp = substr($chars, $num, 1);
      $pass = $pass . $tmp;
      $i++;
    }
    return $pass;
  }
 
  //login form
  function loginform($formname, $formclass, $formaction){
    //conect to DB
    $this->dbconnect();
    echo'
<form name="'.$formname.'" method="post" id="'.$formname.'" class="'.$formclass.'" enctype="application/x-www-form-urlencoded" action="'.$formaction.'">
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
          <input name="submit1" class="submit" value="Login" type="submit" />
        </td>
      </tr>
    </table>
  </fieldset>
</form>
';
  }
	
	  //login form
  function newuserform($formname, $formclass, $formaction){
    //conect to DB
    $this->dbconnect();
    echo'
<form name="'.$formname.'" method="post" id="'.$formname.'" class="'.$formclass.'" enctype="application/x-www-form-urlencoded" action="'.$formaction.'">
  <script type="text/javascript" src="form_control.js"></script>
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
      <tr>';
        $this->dropdown('Choose Facility',$this->facility_table, $this->facility_id, $this->facility_name);
        echo '
      </tr>
      <tr>';
        $this->dropdown('Choose User Level', $this->level_table, $this->level_id, $this->level_type);
        echo'
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
          <input name="action" class="action" value="register" type="hidden">
          <input name="submit2" class="submit" value="Register" type="submit">
        </td>
      </tr>
    </table>
  </fieldset>
</form>
';
  }
	
	  //reset password form
  function changepasswordform($formname, $formclass, $formaction){		
		//conect to DB
    $this->dbconnect();
    echo'
<form name="'.$formname.'" method="post" id="'.$formname.'" class="'.$formclass.'" enctype="application/x-www-form-urlencoded" action="">
  <script type="text/javascript" src="form_control.js"></script>
  <fieldset>
    <legend>Change Password</legend>
    <table>
      <tr>
        <td>
          <label for="usernameChange">Choose A Username</label>
        </td>
        <td>
          <input name="username" id="usernameChange" type="text" />
        </td>
      </tr>
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
          <input name="newpassword1" id="newpassword1" type="password" onblur="checkpass(\'newpassword1\', \'newpassword2\', \'mssg_changepassword\');" />
        </td>
      </tr>
      <tr>
        <td>
          <label for="newpassword2">Re-Enter New Password</label>
        </td>
        <td>
          <input name="newpassword2" id="newpassword2" type="password" onblur="checkpass(\'newpassword1\', \'newpassword2\', \'mssg_changepassword\');" />
          <span id="mssg_changepassword"></span>
        </td>
      </tr>
      <tr>
			  <td></td>
        <td align="left">
          <input name="submit3" class="submit" value="Update Password" type="button" onclick="changepassword()">
        </td>
      </tr>
    </table>
</fieldset>
</form>
';
  }
	
	  //reset password form
  function resetform($formname, $formclass, $formaction){
    //conect to DB
    $this->dbconnect();
    echo'
<form name="'.$formname.'" method="post" id="'.$formname.'" class="'.$formclass.'" enctype="application/x-www-form-urlencoded" action="'.$formaction.'">
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
';
  }
	
		  //logout form
  function logoutform($formname, $formclass, $formaction){
    //conect to DB
    $this->dbconnect();
    echo'
<form name="'.$formname.'" method="post" id="'.$formname.'" class="'.$formclass.'" enctype="application/x-www-form-urlencoded" action="'.$formaction.'">
  <input name="action" class="action" value="logout" type="hidden" />
  <input
	  style="background:none; border:none; color:#fff; padding:0; margin:0" 
		name="submit5" class="submit" value="Logout" type="submit" />
</form>
';
  }
	
	function new_patient_form($formname, $formclass, $formaction){
    //conect to DB
    $this->dbconnect();
    echo'
<form name="new_patient_form" method="post" id="'.$formname.'" class="'.$formclass.'" enctype="application/x-www-form-urlencoded" action="'.$formaction.'">
  <fieldset>
    <legend>New Patient</legend>
    <table>
      <tr>
        <td>
          <label>Name:</label>
        </td>
        <td>
          <select title="Title">
            <option>Unassigned</option>
            <option>Mr.</option>
            <option>Mrs.</option>
            <option>Ms.</option>
            <option>Dr.</option>
          </select>
        </td>
        <td>
          <input type="text" name="fname" value="" size="10" title="First Name" />
        </td>
        <td>
          <input type="text" name="mname" value="" size="5"  title="Middle Name" />
        </td>
        <td>
          <input type="text" name="lname" value=""  size="10" title="Last Name" />
        </td>
      </tr>
      <tr>
        <td>
          <label>DOB:</label>
        </td>
        <td colspan="3">
          <input type="text" name="dob" value="" size="10" title="Date of Birth" /> <span style="font-size:smaller" >YYYY/MM/DD</span>
        </td>
      </tr>
      <tr>
        <td>
          <label>Race:</label>
        </td>
        <td colspan="4">
          <select title="Race">
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
          <label>Ethnicity:</label>
        </td>
        <td colspan="4">
          <select title="Ethnicity">
            <option value="Unknown">Unknown</option>
            <option value="Hispanic">Hispanic</option>
            <option value="Non-Hispanic">Non-Hispanic</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <label>Address:</label>
        </td>
        <td colspan="2">
          <input type="text" name="street" value="" size="20" title="Street" />
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="text" name="city" value="" size="10" title="City" />
        </td>
        <td>
          <input type="text" name="state" value="" size="10" title="State" />
        </td>
        <td>
          <input type="text" name="zip" value="" size="5" title="Postal Code" />
        </td>
        <td>
          <input type="text" name="country" value="" size="10" title="Country" />
        </td>
      </tr>
      <tr>
        <td>
          <label>Phone:</label>
        </td>
        <td>
          <input type="text" name="home" value="" size="10" title="Home Phone" />
        </td>
        <td  align="left">
          <label>(Home)</label>
        </td>
        <td>
          <input type="text" name="country" value="" size="10" title="Cell Phone" />
        </td>
        <td align="left">
          <label>(Cell)</label>
        </td>
      </tr>
    </table>
  </fieldset>
</form>
    ';
  }
	
	
	
	// Creates a dropdown menu for a specific table
	function dropdown($label, $table, $value, $option) {
	  $this->dbconnect();
		$dropdown_list = '<td><label for="'.$table.'">'.$label.'</label></td><td><select name="'.$table.'" id="'.$table.'">';
		$qry = "SELECT * FROM ".$table.";";
    $result = mysql_query($qry) or die(mysql_error());
    while($row = mysql_fetch_assoc($result)) { $dropdown_list .= "<option value ='".$row[$value]."'>".$row[$option]."</option>"; }
    $dropdown_list .= '</select></td>';
		echo $dropdown_list;
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