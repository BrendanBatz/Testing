<?php
/*Extract the parameter named icao from the URL and put into a variable*/
$q=$_GET["icao"];
//Connect to the database
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

//Find the report for the ICAO code in the database
	
	
	$query = "select * from NOAA where ICAO = '".$q."'";
	$result = $db->query($query);
	$num_results = $result->num_rows;
	
	for ($i = 0; $i <$num_results; $i++)
	{
	$row = $result->fetch_assoc();
	$arr = array('ICAO' => $row['ICAO'], 'time' => $row['time'],
	'report' =>  str_replace("\n", '', $row['report']));
	/* get the JSON printed */
	echo json_encode($arr);
	}

?>
