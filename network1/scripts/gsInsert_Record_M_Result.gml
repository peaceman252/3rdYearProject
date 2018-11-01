/* This will hold the return from the webserver when you insert a record. 
It will only return a 0 if it failed or a 1 if it succeded so this is only really here 
for error checking.

You may want to make sure the score got submitted before moving on ;)
*/
if ds_map_find_value(async_load, "id") == insm //check id of returned value
    {
    if ds_map_find_value(async_load, "status") == 0 
    {
    insertM = ds_map_find_value(async_load,"result");
    }
    }
    return insertM;
