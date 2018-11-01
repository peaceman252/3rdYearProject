/* This will determine the payers overall ranking in the database. It uses their userID

argument0 = user ID for the player. */

z = (argument0 * mySEED);

rnk = http_post_string(myURL+"lbpdo.php?","f=gr&u="+string(z)+ "&gi=" + string(myGAMEID));
