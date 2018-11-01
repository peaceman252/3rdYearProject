///db_query_free(query)
/*
    Destroys a query freeing the memory used.
*/

var query;

query = argument0;

if(query[? "only"] >= 0) {
    ds_list_destroy(query[? "only"]);
}

ds_map_destroy(query);
