/*This will give you the result of the gsLowest_Score function call,
if it worked the result will be the lowest score in the database*/
if ds_map_find_value(async_load, "id") == lowRow //check id of returned value
    {
    if ds_map_find_value(async_load, "status") == 0 
    {
    lowscore_data = ds_map_find_value(async_load,"result");
    gsString_Explode(string(lowscore_data),",");
    global.lowscore = ds_list_find_value(brk,0);
    }
    }
    //return lowscore;
    
