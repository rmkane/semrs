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
					win = window.open(this.href, "", "width=300,height=300");
					win.document.writeln(return_data);
				}
				clearForm(form_id);
			}
		}
	}
}

function newuser(form_id) {
	// Get form information
	var username = form_id.elements['username'].value;
	var pass1 = form_id.elements['password1'].value;
	var pass2 = form_id.elements['password2'].value;
	var facility = form_id.elements['facility'].value;
	var level = form_id.elements['level'].value;
	var lname = form_id.elements['lname'].value;
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
	var title = form_id.elements['title'].value;
	var language = form_id.elements['language'].value;
	var fname = form_id.elements['fname'].value;
	var mname = form_id.elements['mname'].value;
	var lname = form_id.elements['lname'].value;
	var dob = form_id.elements['dob'].value;
	var sex = form_id.elements['sex'].value;
	var race = form_id.elements['race'].value;
	var ethnicity = form_id.elements['ethnicity'].value;
	var street = form_id.elements['street'].value;
	var city = form_id.elements['city'].value;
	var state = form_id.elements['state'].value;
	var postal_code = form_id.elements['postal_code'].value;
	var country = form_id.elements['patient_country'].value;
	var phone_home = form_id.elements['phone_home'].value;
	var phone_cell = form_id.elements['phone_cell'].value;
	// Adding...
	var dl = form_id.elements['dl'].value;
	var nid = form_id.elements['nid'].value;
	var occupation = form_id.elements['occupation'].value; 
	var mothers_name = form_id.elements['mothers_name'].value;
	var guardians_name = form_id.elements['guardians_name'].value;	
	// Send data to the form action
	var s = "action=addpatient&title=" + title + "&language=" + language + "&fname=" + fname + "&mname=" + mname + "&lname=" + lname + "&dob=" + dob + "&sex=" + sex + "&race=" + race + "&ethnicity=" + ethnicity + "&street=" + street + "&city=" + city + "&state=" + state + "&postal_code=" + postal_code + "&country=" + country + "&phone_home=" + phone_home + "&phone_cell=" + phone_cell + "&dl=" + dl + "&nid=" + nid + "&occupation=" + occupation + "&mothers_name=" + mothers_name + "&guardians_name=" + guardians_name;
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

function selectpatient(form_id) {
  var id = document.getElementById('selectedpatient').value;
	var s = "action=selectpatient&selectedpatient=" + id;
	requestForm(s, form_id, true);
}

function send_message(form_id) {
	var recipient = form_id.elements['recipient'].value;
	var subject = form_id.elements['subject'].value;
	var message = form_id.elements['message'].value;
	var s = "action=sendmessage&recipient=" + recipient + "&subject=" + subject + "&message=" + message;
	requestForm(s, form_id, true);
}

function add_visit(form_id) {
	var type = form_id.elements['type'].value;
	var date = form_id.elements['date'].value;
	var time = form_id.elements['time'].value;
	var patient = form_id.elements['patient'].value;
	var physician = form_id.elements['physician'].value;
	var facility = form_id.elements['facility'].value;
	var notes = form_id.elements['notes'].value;
	var s = "action=addvisit&type=" + type + "&date=" + date + "&time=" + time + "&patient=" + patient + "&physician=" + physician + "&facility=" + facility + "&notes=" + notes;
	requestForm(s, form_id, true);
}

function getDate() {
  var currentTime = new Date()
  var month = currentTime.getMonth() + 1
  var day = currentTime.getDate()
  var year = currentTime.getFullYear()
  return year + "-" + month + "-" + day;
}

function isValidDate(dateStr) {
	// Checks for the following valid date formats:
	// YYYY/MM/DD/YY or YYYY-MM-DD
	// Also separates date into month, day, and year variables

	// To require a 4 digit year entry, use this line instead:
	var datePat = /^(\d{4})(\/|-)(\d{1,2})\2(\d{1,2})$/;

	var matchArray = dateStr.match(datePat); // is the format ok?
	if (matchArray == null) {
		alert("Date is not in a valid format.")
		return false;
	}
	
	year = matchArray[1]; // parse date into variables
	month = matchArray[3];
	day = matchArray[4];
	
	if (month.length == 1) month = "0" + month;
	if (day.length == 1) day = "0" + day;
	
	if (month < 1 || month > 12) { // check month range
		alert("Month must be between 1 and 12.");
		return false;
	}
	if (day < 1 || day > 31) {
		alert("Day must be between 1 and 31.");
		return false;
	}
	if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
		alert("Month "+month+" doesn't have 31 days!")
		return false;
	}
	if (month == 2) { // check for february 29th
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day > 29 || (day == 29 && !isleap)) {
			alert("February " + year + " doesn't have " + day + " days!");
			return false;
		}
	}
	return true;  // date is valid
}

