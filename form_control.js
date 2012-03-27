/* Check Password */
function checkpass($pass1, $pass2, $mssg) {
	var $pass1_elm = document.getElementById($pass1);
	var $pass1_val = $pass1_elm.value;
  var $pass2_elm = document.getElementById($pass2);
	var $pass2_val = $pass2_elm.value;
	var $mssg_elm = document.getElementById($mssg);
	
	// Check if both passwords were entered
	if ($pass1_val.length > 0 && $pass2_val.length > 0) {
		// Check if both passwords match
		if ($pass1_val != $pass2_val) {
			$pass2_elm.style.border = "red 2px solid";
			$mssg_elm.innerHTML = "<span style=\"color:red; font-size:smaller\">Passwords don't match!</span>";
		} else {
			$pass2_elm.style.border = "green 2px solid";
			$mssg_elm.innerHTML = "<span style=\"color:green; font-size:smaller\">Passwords match!</span>";
		}	
	} else {
		  $pass2_elm.style.border = ""; // Reset border
			$mssg_elm.innerHTML = ""; // Clear message
		}
}
var htmlHttp;
function changepassword() {
  var name = document.getElementById('usernameChange').value;
	var old_pass = document.getElementById('oldpassword').value;
	var new_pass1 = document.getElementById('newpassword1').value;
	var new_pass2 = document.getElementById('newpassword2').value;
	
	
	htmlHttp = new XMLHttpRequest();
	htmlHttp.open("POST", "form_action.php", true);
	htmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	htmlHttp.onreadystatechange = handleReq;
	var s = "action=changepassword&username=" + name + "&oldpassword=" + old_pass + "&newpassword1=" + new_pass1 + "&newpassword2=" + new_pass2
	htmlHttp.send(s);
	alert(s);
	
	// Reset form?
	document.innerHTML.name = "";
	document.innerHTML.old_pass = "";
	document.innerHTML.new_pass1 = "";
	document.innerHTML.new_pass2 = "";
}

function handleReq()
{
 if (htmlHttp.readyState == 4) 
  {
    // continue only if HTTP status is "OK"
    if (htmlHttp.status == 200) 
    {
			alert(htmlHttp.responseText);
		}
	}
}