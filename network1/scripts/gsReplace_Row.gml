/*
This function replace a specified row in the database by the lb_id coulumn.

argument0 = The players user name 
argument1 = The players current score from the game (the one to be submitted)
argument2 = The players user ID
argument3 = The row number to replace
*/

z = (argument2 * mySEED);

insm = http_post_string(myURL+"lbpdo.php?","f=re&n=" + argument0 + "&s=" + argument1 + "&u=" + string(z) + "&r=" + argument3+ "&gi=" + string(myGAMEID));
