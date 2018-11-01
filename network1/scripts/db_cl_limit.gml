///db_cl_limit(query,limit,offset)
/*
    Tells a query to limit the results, and eventually apply an offset
    Returns: query
*/

var query;

query = argument0;

query[? "limit"] = argument1;
query[? "offset"] = argument2;

return query;
