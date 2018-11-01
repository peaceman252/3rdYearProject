/*
When your high score list arrives in your game it will be a single long string delimited with bars (|) and commas (,).
The bars separate the records, the commas separate the name and score in an individual record. So your high score list will 
arrive something like this:

Player1,1200|player2,1189|player3,1065|player4,1030|… and so on. 

This makes it easy to send in one call, but it’s useless to use in the game, so we will have to break it up!
This script will break your list up and store it all in a ds_list with 20 records, the name and scores of your top 10 players. 
It will be organized name, score, name, score etc. like this:
Player1
1200
Player2
1189
Player3
1065
Making the individual records in a ds_list will allow you to build your high score table any way you please to match your game!

*/
//Get the returned data from the server
if ds_map_find_value(async_load, "id") == list //check id of returned value
    {
    StringData = ds_map_find_value(async_load,"result");
// Create two lists (one will be destroyed at the end of this script)
    score_list = ds_list_create();
    name_list = ds_list_create();
//First we explode the string at the bars (|) to serprate the individual records and store them in an interim list
    gsString_Explode(string(StringData),"|");
//The gsStringEcplode script creates a ds_list named brk, we want to copy that list to a new one with a differnt name.
ds_list_copy(score_list,brk) ;
//Destroy the interime brk list.
ds_list_destroy(brk);
//Now we will take the entries from the first ds_list, explode them at the commas, and store them in a new list
    for (z=0; z<ds_list_size(score_list); z+=1;)    
        {
        gsString_Explode(ds_list_find_value(score_list,z),",");
        ds_list_add(name_list,ds_list_find_value(brk,0),ds_list_find_value(brk,1));
        ds_list_destroy(brk);
        }
//destroy the interim list as its no longer needed.
ds_list_destroy(score_list);

}
