/* Check Password */
function checkpass($pass1, $pass2, $mssg) {
	var $pass1_elm = document.getElementById($pass1);
	var $pass1_val = $pass1_elm.value;
  var $pass2_elm = document.getElementById($pass2);
	var $pass2_val = $pass2_elm.value;
	var $mssg_elm = document.getElementById($mssg);
	
	if ($pass1_val != $pass2_val) {
		$pass2_elm.style.border = "red thin solid";
		$mssg_elm.innerHTML = "<span style=\"color:red; font-size:smaller\">Passwords don't match!</span>";
	} else {
		$pass2_elm.style.border = "green thin solid";
		$mssg_elm.innerHTML = "<span style=\"color:green; font-size:smaller\">Passwords match!</span>";
	}	  
}