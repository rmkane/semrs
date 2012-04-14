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

function clearForm(oForm) {
  var elements = oForm.elements; 
  oForm.reset();
  for(i = 0; i < elements.length; i++) {
		/* field_type = elements[i].type.toLowerCase(); */
		field_type = elements[i].type;
		switch(field_type) {
			case "text": 
			case "password": 
			case "textarea":
      case "hidden":   
        elements[i].value = "";
				elements[i].focus(); // Clear out any associate text
				break;
      case "radio":
			case "checkbox":
				if (elements[i].checked) elements[i].checked = false;
				break;
		case "select":
		/* case "select-one":
     * case "select-multi": */
      elements[i].selectedIndex = -1;
      break;
		default: 
      break;
		}
  }
}

/* Create a XMLHttpRequest object */
function requestForm(s, form_id, alert_mssg) {
  var htmlHttp = new XMLHttpRequest();
	var url = "../../form_action.php"
	htmlHttp.open("POST", url, true);
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
				var return_data = htmlHttp.responseText;
				if (alert_mssg) alert(return_data);
				else {
					win = window.open("", return_data, "width=300,height=200");
					win.document.writeln(return_data);
				}
				clearForm(document.getElementById(form_id));
			}
		}
	}
}

function newuser(form_id) {
	// Get form information
	var username = document.getElementById('usernameCreate').value;
	var pass1 = document.getElementById('password1').value;
	var pass2 = document.getElementById('password2').value;
	var facility = document.getElementById('facility').value;
	var level = document.getElementById('level').value;
	var lname = document.getElementById('lname').value;
	// Send data to the form action
	var s = "action=register&username=" + username + "&password1=" + pass1 + "&password2=" + pass2 + "&facility=" + facility + "&level=" + level + "&lname=" + lname;
	requestForm(s, form_id, true);
}

function changepassword(form_id) {
  // Get form information
	var old_pass = document.getElementById('oldpassword').value;
	var new_pass1 = document.getElementById('newpassword1').value;
	var new_pass2 = document.getElementById('newpassword2').value;
	// Send data to the form action
	var s = "action=changepassword&oldpassword=" + old_pass + "&newpassword1=" + new_pass1 + "&newpassword2=" + new_pass2;
	requestForm(s, form_id, true);
}

function addpatient(form_id) {
	// Get form information
	var title = document.getElementById('title').value;
	var fname = document.getElementById('fname').value;
	var mname = document.getElementById('mname').value;
	var lname = document.getElementById('lname').value;
	var dob = document.getElementById('dob').value;
	var sex = document.getElementById('sex').value;
	var race = document.getElementById('race').value;
	var ethnicity = document.getElementById('ethnicity').value;
	var street = document.getElementById('street').value;
	var city = document.getElementById('city').value;
	var postal_code = document.getElementById('postal_code').value;
	var country = document.getElementById('geo_country_reference').value;
	var phone_home = document.getElementById('home').value;
	var phone_cell = document.getElementById('cell').value;
	var regdate = getDate();	
	// Send data to the form action
	var s = "action=addpatient&title=" + title + "&fname=" + fname + "&mname=" + mname + "&lname=" + lname + "&dob=" + dob + "&sex=" + sex + "&race=" + race + "&ethnicity=" + ethnicity + "&street=" + street + "&city=" + city + "&postal_code=" + postal_code + "&country=" + country + "&phone_home=" + phone_home + "&phone_cell=" + phone_cell + "&regdate=" + regdate;
	requestForm(s, form_id, true);
}

function searchpatient(form_id) {
	// Get form information
	var type = document.getElementById('search_type').value;
	var input = document.getElementById('search_input').value;
	// Send data to the form action
	var s = "action=searchpatient&type=" + type + "&input=" + input;
	requestForm(s, form_id, false);
}

function getDate() {
  var currentTime = new Date()
  var month = currentTime.getMonth() + 1
  var day = currentTime.getDate()
  var year = currentTime.getFullYear()
  return year + "-" + month + "-" + day;
}

