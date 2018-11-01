/*
This function will insert a record to the databse regardless of the user name already
exists or not. This will allow a single person to maintain multiple positions on the 
high score list and in the database. If you only want to allow one score per user name
then use the gs_Insert_Record_S function.

argument0 = The players user name 
argument1 = The players current score from the game (the one to be submitted)
argument2 = The players user ID
*/

z = (argument2 * mySEED);

insm = http_post_string(myURL+"lbpdo.php?","f=mi&n=" + argument0 + "&s=" + argument1 + "&u=" + string(z)+ "&gi=" + string(myGAMEID));
