/*
This simple function calls the PHP script to retrieve the lowest available score
so you can make a comparison against the YOU current score. This will determine
if the player can submit their high score to the database or not.
*/

lowRow = http_post_string(myURL+"lbpdo.php?","f=ls"+ "&gi=" + string(myGAMEID));
