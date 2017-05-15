<?php
//Connect to the database

shell_exec('~/Documents/Scripting/./bashexercise1.sh');
$servername = "localhost";
$username = "root";
$password = "?@~JDCNVOe7T%i9VzRHU";
$database = "testphp";

$db=new mysqli($servername,$username,$password,$database);
if(mysqli_connect_errno())
{
	echo "Error connecting to database\n";
	exit;
}

/*Open the text file fetched from NOAA – assuming that the files are
saved in a sub-folder called metars, relative to where the script is run
from */

$metar_file=fopen("/home/batz/Documents/Scripting/".gmdate('H')."Z.TXT", "r");

//Read file a line at a time
while($metar=fgets($metar_file, 500))
{
	//Check if the line has an ICAO code at the beginning
	//If so, find the relevant elements and put them in the database
	if(preg_match("/[A-Z]{4}/",substr($metar,0,4)))
	{
	$ICAO=substr($metar,0,4);
	$time=substr($metar,7,4);
	$report=substr($metar,13);
	$query="REPLACE INTO NOAA VALUES('$ICAO','$time','$report')";
	$result=$db->query($query);
	echo "Succes\n";
	}
}
?>
