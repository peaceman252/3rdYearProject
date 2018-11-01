///db_cl_join(query,join_table,foreign_key)
/*
    Adds join directives
    Returns: query
*/

var query;
query = argument0;

query[? "join_table_name"] = argument1;
query[? "foreign_key"] = argument2;

return query;
