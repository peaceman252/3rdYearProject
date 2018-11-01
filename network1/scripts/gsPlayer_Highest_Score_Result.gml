/* This will display the current players overall high score from the database. */

if ds_map_find_value(async_load, "id") == phs //check id of returned value
    {
    if ds_map_find_value(async_load, "status") == 0 
    {
    global.phighscore = ds_map_find_value(async_load,"result");
    }
    }
