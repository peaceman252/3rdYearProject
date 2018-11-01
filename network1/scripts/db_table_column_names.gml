///db_table_column_names(table)
/*
    Returns a ds_list containing the column names of a table (must be destroyed after usage)
*/

var key,list,column_names,queue;

queue = ds_priority_create();
column_names = _db_column_names[? argument0];
list = ds_list_create();

key = ds_map_find_first(column_names);
repeat (ds_map_size(column_names)) {
    ds_priority_add(queue,key,column_names[? key]);
    key = ds_map_find_next(column_names, key);
}

while(!ds_priority_empty(queue)) {
    ds_list_add(list,ds_priority_delete_min(queue));
}  

ds_priority_destroy(queue);

return list;
