<?php
////////////////////////////////////////////////////////////////////////////////////
//   Sample High Score List
//   For use with gameSyncHS Extension
//   For commericial and private use. Feel free to modify to your needs!
//   Supprt - support@destronmedia.com or visit ngm.destronmedia.com
//
ob_start();
require('lbpdo.php');  //Include lbpdo.php for connection details edit to path to lbpdo.php if not in same directory
$data = ob_get_clean();  //This bit will snag any output from lbpdo.php so it doesent appear on your table page
ob_end_clean();

$limit = 10; //Number of rows.
$gameid = 1; //Game id - the same as the myGAMEID macro in GM

// Select the rows from the database
$stmt = $dbh->query("SELECT lb_pname,lb_score FROM $table WHERE lb_gameid = $gameid ORDER BY lb_score DESC LIMIT $limit");
$result = $stmt->fetchAll();
$dbh = null;


echo'
<html>
	<head>
		<!-- Stylesheet for the table -->
		<style type="text/css">
		.scoreTable{
			width:30%; 
			margin-left:auto;
			margin-right:auto;
			border-collapse:collapse; 
			counter-reset: rowNumber;
		}
		.scoreTable td{ 
			padding:7px; border:#4e95f4 1px solid;
		}
		.scoreTable tr{
			counter-increment: rowNumber;
		}
		.scoreTable tr td:first-child::before {
			content: counter(rowNumber)".";
			min-width: 1em;
			margin-right: 0.5em;
		}
	
		/*  Define the background color for all the ODD background rows  */
		.scoreTable tr:nth-child(odd){ 
			background: #b8d1f3;
		}
		/*  Define the background color for all the EVEN background rows  */
		.scoreTable tr:nth-child(even){
			background: #dae5f4;
		}
		</style>
	</head
	
<body>';

// Table output
echo '<p align="center">High Scores</p></br><table class = "scoreTable">';
foreach ($result as $row) 
	{
	echo '<tr><td>'.$row['lb_pname']. '</td><td>' . $row['lb_score']. '</td></tr>';
	}
echo '</table>';

echo'</body></html>';

?>

