/*This will return the reult of the ID check, 1 if the ID exists and 0 if it does not
Hint - you want it to be 0 ;)
  */

if ds_map_find_value(async_load, "id") == idcheck //check id of returned value
    {
    if ds_map_find_value(async_load, "status") == 0 
    {
    idc = ds_map_find_value(async_load,"result");
    }
    }
    return idc;
