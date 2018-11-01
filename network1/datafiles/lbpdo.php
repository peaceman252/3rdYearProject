<?php
header("Access-Control-Allow-Origin: *");
/***********************************************************************************************************************************
* gameSync System
* gameSyncHS ver 2.0
* (c) 2012,2015 Destron Media LLC
* Created by Destron 
* 
* Visit http://gs.destronmedia.com for updated information.
* Email support@destronmedia.com for help. 
* License: Free to use for all projects commercial or otherwise. Credit is not required. Donations are welcome :)
**************************************************************************************************************************************/

error_reporting(E_ERROR); 

/*EDIT HERE***************************************************************************************************************************/
$hostname = 'localhost'; // MySQL host, this is probably right, but check with your webhost to be sure
$username = 'Username'; // Your MySQL user name
$password = 'Password'; //Your MySQL password
$database = 'Database Name'; //The name of the database holding your table
$table = 'high_score'; // The name of your table
$seed = '15';  //Seed to use for user ID - see manual.
$user_agent = 0;  //Turn on user agent filtering - DO NOT use with HTML5
/***************************************************************************************************************************************/

/*DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING!****************************************************************************/

$f = $_POST['f'];
$uname = $_POST['n'];
$uscore = $_POST['s'];
$uid = ($_POST['u'] / $seed);
$date = date("n/j/Y");
$time = date("G:i T");
$lim = $_POST['l'];
$lim2 = $_POST['l2'];
$rid = $_POST['r'];
$gameid = $_POST['gi'];

$dbh = new PDO("mysql:host=$hostname; dbname=$database", $username, $password);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$dbh->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

function m_insert($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
{
	try {
		$stmt = $dbh->prepare("INSERT INTO $table (lb_pname, lb_score, lb_date, lb_time, lb_uid, lb_gameid) VALUES(:uname, :uscore, :date, :time, :uid, :gameid)");
		$stmt->execute(array(':uname' => $uname, ':uscore' => $uscore, ':date' => $date, ':time' =>$time, ':uid' => $uid, ':gameid' => $gameid));
		$affected_rows = $stmt->rowCount();  
		echo "1";
		}
	catch (PDOExecption $ex)
		{	
			echo "0";
		}
	$dbh = null;
}

function s_insert($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
{
try
	{
		$stmt = $dbh->prepare("INSERT INTO $table (lb_pname, lb_score, lb_date, lb_time, lb_uid, lb_gameid) VALUES(:uname, :uscore, :date, :time, :uid, :gameid)
	    ON DUPLICATE KEY UPDATE lb_score = :uscore2, lb_date = :date2, lb_time = :time2, lb_gameid = :gameid2");
		$stmt ->bindparam(':uname', $uname, PDO::PARAM_STR); 
		$stmt ->bindparam(':uscore', $uscore, PDO::PARAM_STR);
		$stmt ->bindparam(':date', $date, PDO::PARAM_STR);
		$stmt ->bindparam(':time', $time, PDO::PARAM_STR);
		$stmt ->bindparam(':uid', $uid, PDO::PARAM_INT);
		$stmt ->bindparam(':gameid', $gameid, PDO::PARAM_STR);
		$stmt ->bindparam(':uscore2', $uscore, PDO::PARAM_STR);
		$stmt ->bindparam(':date2', $date, PDO::PARAM_STR);
		$stmt ->bindparam(':time2', $time, PDO::PARAM_STR);
		$stmt ->bindparam(':gameid2', $gameid, PDO::PARAM_STR);
		
		$stmt->execute();
		echo "1";
	}
	catch (PDOExecption $ex)
		{	
			echo "0";
		}
	$dbh = null;
}

function h_score($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
	{
	$stmt = $dbh->query("SELECT COUNT(*) from $table WHERE lb_uid = $uid AND lb_gameid = $gameid");
	$result1 = $stmt->fetchColumn();
		
	if ($result1 > 0)
		{
		$stmt = $dbh->query("SELECT * FROM $table WHERE lb_uid = $uid AND lb_gameid = $gameid ORDER BY lb_score DESC");
		$result = $stmt->fetchObject();
		echo $result->lb_score;
		$dbh = null;
		}
	else
		{
		echo "N/A";
		}
		
	}
function check_id ($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
	{
	$stmt = $dbh->query("SELECT COUNT(*) from $table WHERE lb_uid = $uid AND lb_gameid = $gameid");
	$result1 = $stmt->fetchColumn();
		
	if ($result1 > 0)
		{
		echo "1";
		}
	else
		{
		echo "0";
		}
		
	}

function s_replace($dbh,$table,$uname,$uscore,$uid,$date,$time,$rid,$gameid)
{
try
	{
	$stmt = $dbh->prepare("UPDATE $table SET lb_pname=?, lb_score=?, lb_date=?, lb_time=?, lb_uid=? WHERE lb_id=? AND lb_gameid=?");
	$stmt->execute(array($uname,$uscore,$date,$time,$uid,$rid,$gameid));
	$affected_rows = $stmt->rowCount();

		echo "1";
	}
	catch (PDOExecption $ex)
		{	
			echo "0";
		}
	$dbh = null;
}
	
function global_h_score($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
	{
		$stmt = $dbh->query("SELECT * FROM $table WHERE lb_gameid = $gameid ORDER BY lb_score DESC");
		$result = $stmt->fetchObject();
		echo $result->lb_score;
		$dbh = null;
	}
	
function global_l_score($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
	{
		$stmt = $dbh->query("SELECT * FROM $table WHRE lb_gameid = $gameid ORDER BY lb_score ASC");
		$result = $stmt->fetchObject();
		echo $result->lb_score.",".$result->lb_id;
		$dbh = null;
	}
	
function get_rank($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
	{
	$stmt = $dbh->query("SELECT COUNT(*) from $table WHERE lb_uid = $uid AND lb_gameid = $gameid");
	$result1 = $stmt->fetchColumn();
		
	if ($result1 > 0)
	{
		$stmt = $dbh->query("SELECT COUNT(lb_uid) AS `rank` FROM $table WHERE lb_score > ( SELECT MAX(lb_score) from $table WHERE lb_uid = $uid AND lb_gameid = $gameid)"); 
		$result = $stmt->fetchColumn();
	
		echo $result+1;
	}
	else
		{
		echo "N/A";
		}
	$dbh = null;
	}

function get_row_count($dbh,$table,$uname,$uscore,$uid,$date,$time,$gameid)
	{
	$stmt = $dbh->query("SELECT COUNT(*) from $table");
	$nRows = $stmt->fetchColumn(); 
	echo $nRows;
	}
	
function get_toprank($dbh,$table,$uname,$uscore,$uid,$date,$lim,$time,$gameid)
	{
	$stmt = $dbh->query("SELECT * FROM $table WHERE lb_gameid = $gameid ORDER BY lb_score DESC LIMIT $lim"); 

    $rank = 0;
        while($uid = $stmt->fetchObject()) {
          $rank++;
          echo $uid->lb_pname .",". $uid->lb_score ."|";
        };
		$dbh = null;
	}
	
function get_toprank_part($dbh,$table,$uname,$uscore,$uid,$date,$lim,$lim2,$time,$gameid)
	{
	$stmt = $dbh->query("SELECT * FROM $table WHERE lb_gameid = $gameid ORDER BY lb_score DESC LIMIT $lim,$lim2"); 

    $rank = 0;
        while($uid = $stmt->fetchObject()) {
          $rank++;
          echo $uid->lb_pname .",". $uid->lb_score ."|";
        };
		$dbh = null;
	}
	
	
if ($user_agent == 0)
{
	switch($f)
	{
	case mi: m_insert($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
	case si: s_insert($dbh, $table, $uname, $uscore, $uid, $date,$time,$gameid); break;
	case hs: h_score($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
	case ci: check_id($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
	case re: s_replace($dbh, $table, $uname, $uscore, $uid, $date, $time, $rid,$gameid); break;
	case ls: global_l_score($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
	case os: global_h_score($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
	case gr: get_rank($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
	case tr: get_toprank($dbh, $table, $uname, $uscore, $uid, $date, $lim, $time,$gameid); break;
	case lp: get_toprank_part($dbh, $table, $uname, $uscore, $uid, $date, $lim, $lim2, $time,$gameid); break;
	case cr: get_row_count($dbh, $table, $uname, $uscore, $uid, $date, $lim, $time,$gameid); break;
	default: echo"0";
	}
}
else
{
	if ($_SERVER['HTTP_USER_AGENT'] == 'GameMaker HTTP')
	{
		switch($f)
		{
			case mi: m_insert($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
			case si: s_insert($dbh, $table, $uname, $uscore, $uid, $date,$time,$gameid); break;
			case hs: h_score($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
			case ci: check_id($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
			case re: s_replace($dbh, $table, $uname, $uscore, $uid, $date, $time, $rid,$gameid); break;
			case ls: global_l_score($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
			case os: global_h_score($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
			case gr: get_rank($dbh, $table, $uname, $uscore, $uid, $date, $time,$gameid); break;
			case tr: get_toprank($dbh, $table, $uname, $uscore, $uid, $date, $lim, $time,$gameid); break;
			case lp: get_toprank_part($dbh, $table, $uname, $uscore, $uid, $date, $lim, $lim2, $time,$gameid); break;
			case cr: get_row_count($dbh, $table, $uname, $uscore, $uid, $date, $lim, $time,$gameid); break;
			default: echo"0";
		}
	}
	else
	{
		//echo "Access Denied";
		header('HTTP/1.0 404 Not Found');
die;
	}
}



?>
