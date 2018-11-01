///db_query_init()
/*
    INTERNAL USE ONLY. Prepares the query map with default values
    Returns: query
*/

var query;

query = ds_map_create();
ds_map_add(query,"table_name","");
ds_map_add(query,"function","");
ds_map_add(query,"fields","");
ds_map_add(query,"values","");
ds_map_add(query,"where_script",-1);
ds_map_add(query,"where_fields","");
ds_map_add(query,"where_args","");
ds_map_add(query,"sort_field","");
ds_map_add(query,"only",-1);
ds_map_add(query,"limit",0);
ds_map_add(query,"offset",0);
ds_map_add(query,"join_table_name","");
ds_map_add(query,"foreign_key","");
ds_map_add(query,"calc_operation","");

return query;
