/*
This simply calls the PHP script to fetch the list of top 10 scores and their
names from the server.

argument0 = high score list size
*/

list = http_post_string(string(myURL)+"lbpdo.php?","f=tr&l="+string(argument0) + "&gi=" + string(myGAMEID));
