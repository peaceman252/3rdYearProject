/*
This function will insert a record to the databse if it does not already exists, or update
an existing record if the user ID already has a score submitted. This will over write
the users previous socre!

argument0 = The players user name 
argument1 = The players current score from the game (the one to be submitted)
argument2 = The players user ID
*/

z = (argument2 * mySEED);

inss = http_post_string(myURL+"lbpdo.php?","f=si&n=" + argument0 + "&s=" + argument1 + "&u=" + string(z) + "&gi=" + string(myGAMEID));
