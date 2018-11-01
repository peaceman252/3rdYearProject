/*This will pull the highest score from the database from ALL player, in case  
you want to show it in the game! This returns the score only, not the name that 
goes with it!
*/

hs = http_post_string(myURL+"lbpdo.php?","f=os"+ "&gi=" + string(myGAMEID));
