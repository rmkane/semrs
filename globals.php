<?php
////////////////////////////////////////
///////////// Database Info ////////////
////////////////////////////////////////
$GLOBALS['hostname_logon'] = 'localhost';
$GLOBALS['database_logon'] = 'semrs';
$GLOBALS['username_logon'] = 'root';
$GLOBALS['password_logon'] = '';

////////////////////////////////////////
//////////////// Tables ////////////////
////////////////////////////////////////

//////////////// Users /////////////////
$GLOBALS['user_table'] = 'users';
$GLOBALS['user_id'] = 'id';
$GLOBALS['user_email'] = 'email';
$GLOBALS['user_password'] = 'password';
$GLOBALS['user_level'] = 'userlevel'; 
$GLOBALS['user_fname'] = 'fname';
$GLOBALS['user_mname'] = 'mname';
$GLOBALS['user_lname'] = 'lname';
$GLOBALS['user_facility_id'] = 'facility_id';

////////////// Patient Data ////////////
$GLOBALS['facility_table'] = 'facility';
$GLOBALS['facility_id'] = 'id';
$GLOBALS['facility_name'] = 'name';

//////////////// Level /////////////////
$GLOBALS['level_table'] = 'level';
$GLOBALS['level_id'] = 'id';
$GLOBALS['level_type'] = 'type';


////////////////////////////////////////
////////////////// CSS /////////////////
////////////////////////////////////////
$GLOBALS['css_header'] = 'stylesheets/stylesheet.css';

////////////////////////////////////////
/////////// Header/Footer Info /////////////////
////////////////////////////////////////
$GLOBALS['heading'] = 'Welcome to MCHC';
$GLOBALS['footer'] = 'Kane &amp; Orndorff | Copyright &copy; 2011-2012'
?>