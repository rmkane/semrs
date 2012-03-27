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

function requestForm(s) {
  var htmlHttp;
	htmlHttp = new XMLHttpRequest();
	htmlHttp.open("POST", "form_action.php", true);
	htmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	htmlHttp.onreadystatechange = handleReq;	
	htmlHttp.send(s);
	
	// Handle request: 0 = uninitialized, 1 = loading, 2 = loaded, 3 = interactive, 4 = complete
	function handleReq()
	{
		if (htmlHttp.readyState == 4) 
		{
			/****************** Standard HTTP status code *************************
			100 = Continue,											101 = Switching protocols,
			200 = OK,														201 = Created,
			202 = Accepted,											203 = Non-Authoritative Information,
			204 = No Content,										205 = Reset Content,
			206 = Partial Content,							300 = Multiple Choices,
			301 = Moved Permanently,						302 = Found,
			303 = See Other,										304 = Not Modified,
			305 = Use Proxy,										307 = Temporary Redirect,
			400 = Bad Request,									401 = Unauthorized,
			402 = Payment Required,							403 = Forbidden,
			404 = Not Found,										405 = Method Not Allowed,
			406 = Not Acceptable,								407 = Proxy Authentication Required,
			408 = Request Timeout,							409 = Conflict,
			410 = Gone,													411 = Length Required,
			412 = Precondition Failed,					413 = Request Entity Too Large,
			414 = Request-URI Too Long,					415 = Unsupported Media Type,
			416 = Requested Range Not Suitable,	417 = Expectation Failed,
			500 = Internal Server Error,				501 = Not Implemented,
			502 = Bad Gateway,									503 = Service Unavailable,
			504 = Gateway Timeout,							505 = HTTP Version Not Supported
			**********************************************************************/
			// continue only if HTTP status is "OK"
			if (htmlHttp.status == 200) {
				alert(htmlHttp.responseText);
				
				ClearNewUserForm();
				ClearChangePasswordForm();
			}
		}
	}
}

function newuser() {
	// Get form information
	var username = document.getElementById('usernameCreate').value;
	var pass1 = document.getElementById('password1').value;
	var pass2 = document.getElementById('password2').value;
	var facility = document.getElementById('facility').value;
	var level = document.getElementById('level').value;
	var lname = document.getElementById('lname').value;
	// Send data to the form action
	var s = "action=register&username=" + username + "&password1=" + pass1 + "&password2=" + pass2 + "&facility=" + facility + "&level=" + level + "&lname=" + lname;
	requestForm(s);
}

function ClearNewUserForm() {
  document.getElementById('usernameCreate').value = "";
	document.getElementById('password1').value = "";
	document.getElementById('password2').value = "";
	document.getElementById('facility').selectedIndex = 0;
	document.getElementById('level').selectedIndex = 0;
	document.getElementById('lname').value = "";
}

function changepassword() {
  // Get form information
	var name = document.getElementById('usernameChange').value;
	var old_pass = document.getElementById('oldpassword').value;
	var new_pass1 = document.getElementById('newpassword1').value;
	var new_pass2 = document.getElementById('newpassword2').value;
	// Send data to the form action
	var s = "action=changepassword&username=" + name + "&oldpassword=" + old_pass + "&newpassword1=" + new_pass1 + "&newpassword2=" + new_pass2
	requestForm(s);
}

function ClearChangePasswordForm() {
  document.getElementById('usernameChange').value = "";
	document.getElementById('oldpassword').value = "";
	document.getElementById('newpassword1').value = "";
	document.getElementById('newpassword2').value = "";
}

