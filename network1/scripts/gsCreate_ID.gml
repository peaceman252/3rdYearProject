/*
This will create a radomly generated ID number for the player. 

argument0 = id number size
*/
randomize(); // Randomize the game - must be called to get a unique seed
uid = real(floor(random(power(9,argument0)))); // Create a random ID for the players ID

return(real(floor(uid / mySEED)));
