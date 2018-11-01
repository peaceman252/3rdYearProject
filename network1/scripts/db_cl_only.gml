///db_cl_only(query,ids[csv_string or ds_list])
/*
    Restrict the result set of a query to the specified record ids.
    ids can be passed as a string of comma separated ids, or in a ds_list
    Returns: query
*/

var query,ids;

query = argument0;
if(is_string(argument1)) {ids = string_parse(argument1,",",true);}
else if(argument1 >= 0) {
    var list = ds_list_create();
    ds_list_copy(list,argument1);
    ids = list;
}
else {
    ids = -1;
}

if(query[? "only"] >= 0) {ds_list_destroy(query[? "only"]);}
query[? "only"] = ids;

return query;
