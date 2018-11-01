///db_query_calc(query_or_table,operation,field,ignore_limits)
/*
    Generates a calculation query for the specified operation on the specified field.
    The first argument can be either a table name (in this case the script returns a new query),
    or an existing query (in this case the script directly returns the result of the calculation applied to the query).
    If ignore_limits is true, the limit and offset clauses are ignored when performing the calculation.
    
    Valid operations: count,mean,max,min,sum.

*/

var query,operation,field,ignore_limits;

operation = argument1;
field = argument2;
ignore_limits = argument3;

if(is_real(argument0)) { //calculate based on another query
    var orig_query = argument0;
    query = ds_map_create();
    ds_map_copy(query,orig_query);
   
    if(orig_query[? "only"] >= 0) { //if only clause ds_list is present, make a copy
        var only = ds_list_create();
        ds_list_copy(only,orig_query[? "only"]);
        query[? "only"] = only;
    }
    
    if(ignore_limits) {
        query[? "limit"] = 0;
        query[? "offset"] = 0;
    }
}
else { //create a new calc query
    query = db_query_init();
    query[? "table_name"] = argument0;
}

query[? "function"] = "calc";
query[? "calc_operation"] = operation;
query[? "fields"] = field;

if(is_real(argument0)) {
    return db_query_exec(query);
}
else {
    return query;
}
