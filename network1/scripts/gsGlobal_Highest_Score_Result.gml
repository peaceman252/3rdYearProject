if ds_map_find_value(async_load, "id") == hs //check id of returned value
    {
    if ds_map_find_value(async_load, "status") == 0 
    {
    global.ghighscore = ds_map_find_value(async_load,"result");
    }
    }
    
    
