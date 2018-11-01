///db_cl_where(query,db_op_script,columns,args)
/*
    Adds a condition to a query that will be applies to the result set on the specified fields
    Returns: query
*/

var query; 

query = argument0;

query[? "where_script"] = argument1;
query[? "where_fields"] = argument2;
query[? "where_args"] = argument3;

return query;
