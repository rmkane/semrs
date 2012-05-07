function TimeInput(name) {
	var date = new Date();
	var h = (date.getHours() % 12) == 0 ? "12" : (date.getHours() % 12);
	var m = date.getMinutes();
	var meridiem = ["a.m.", "p.m."];
	var a = (date.getHours() < 12) ? meridiem[0] : meridiem[1];

	time = name;
	with (document) {
		writeln('<input type="hidden" name="' + name + '" value="'+h+":"+m+" "+a+'">');
		
		writeln('<select name="hours" onblur="setTime(this.form);">');
		for (var hour = 1; hour < 13; hour++) {
			hour = (hour < 10) ? "0"+hour : hour;
			var selected = (hour == h) ? "SELECTED" : "";
			writeln('<option '+selected+'>'+hour+'</option>');
		}
		writeln('</select>');
		writeln('<select name="minutes" onblur="setTime(this.form);">');
		for (var min = 0; min < 60; min++) {
			min = (min < 10) ? "0"+min : min;
			var selected = (min == m) ? "SELECTED" : "";
			writeln('<option '+selected+'>'+min+'</option>');
		}
		writeln('</select>');
		writeln('<select name="meridiem" onblur="setTime(this.form);">');
		for (var i = 0; i < 2; i++) {
			var selected = (meridiem[i] == a) ? "SELECTED" : "";
			writeln('<option '+selected+'>'+meridiem[i]+'</option>');
		}
		writeln('</select>');
	}
}

function setHour(h) { this.h = h; }
function setMinutes(m) { this.m = m; }
function setMeridiem(a) { this.a = a; }
function setTime(form_id) {
	setHour(form_id.elements['hours'].value);
	setMinutes(form_id.elements['minutes'].value);
	setMeridiem(form_id.elements['meridiem'].value);
	form_id.elements[time].value = h+":"+m+" "+a;
}