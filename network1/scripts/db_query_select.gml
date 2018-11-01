///db_query_select(table,columns)
/*
    Prepares a query for selecting values in the specified columns of a table.
    If only id is provided as column, the query will return a ds_list of ids.
    Returns: query
*/

var query;

query = db_query_init();

query[? "table_name"] = argument0;
query[? "function"] ="select";
query[? "fields"] = argument1;

return query;
