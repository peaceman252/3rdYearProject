///db_query_update(table,columns,values)
/*
    Prepares a query to perform an update of records into the database table.
*/

var query,fields,values,values_list;

query = db_query_init();
fields = string_parse(argument[1],",",false);

if(ds_list_size(fields) == argument_count - 2) {//values passed as arguments
    values_list = ds_list_create();
    for(var i=2;i<argument_count;i+=1) {
        ds_list_add(values_list,argument[i]);
    }
    values = csv_compose_line(values_list,",");
}
else { //values passed as string
    values_list = csv_parse_line(argument[2],",");
    values = argument[2];
}

if(ds_list_size(values_list) != ds_list_size(fields)) {
    show_error("db_query_update: the number of fields doesn't match the number of values",true);
}

ds_list_destroy(values_list);
ds_list_destroy(fields);

query[? "table_name"] = argument[0];
query[? "function"] = "update";
query[? "fields"] = argument[1];
query[? "values"] = values;

return query;
