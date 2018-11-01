/*This simply pulls the players overall reank from the database */

if ds_map_find_value(async_load, "id") == rnk //check id of returned value
    {
    if ds_map_find_value(async_load, "status") == 0 
    {
    global.rank = ds_map_find_value(async_load,"result");
    }
    }
    
