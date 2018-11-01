/*
This will pull the players highest score from the database to show them in game
*/

z = (argument0 * mySEED);

phs = http_post_string(myURL+"lbpdo.php?","f=hs&u="+string(z) + "&gi=" + string(myGAMEID));
