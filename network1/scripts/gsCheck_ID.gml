/*
This simply calls the PHP script to check if a the user ID supplied exists in the database 
or not so you can make sure a user ID is not already in use.

argument0 = players user ID
*/


z = (argument0 * mySEED);

idcheck = http_post_string(string(myURL)+"lbpdo.php?","f=ci&u="+string(z)+ "&gi=" + string(myGAMEID));
