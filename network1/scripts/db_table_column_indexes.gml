///db_table_column_indexes(table,columns)
/*
    Given a string with comma separated column names, returns a ds_list of column indexes
*/

var columns,column_names,column_indexes;

columns = _db_column_names[? argument0];

column_indexes = ds_list_create();
column_names = string_parse(argument1,",",false);

for(var i=0; i<ds_list_size(column_names); i+=1) {
    ds_list_add(column_indexes,columns[? ds_list_find_value(column_names,i)]);
}

ds_list_destroy(column_names);

return column_indexes;
