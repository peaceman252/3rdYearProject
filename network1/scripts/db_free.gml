///db_free()
/*
    Deletes all the tables and data structures, freeing the memory
*/

var key,keys;

keys = ds_list_create();
key = ds_map_find_first(_db_tables);
repeat (ds_map_size(_db_tables)) {
    ds_list_add(keys,key);
    key = ds_map_find_next(_db_tables,key);
}

for(var i=0; i<ds_list_size(keys);i+=1) {
    db_table_delete(ds_list_find_value(keys,i))
}

ds_map_destroy(_db_tables);
ds_map_destroy(_db_column_names);
ds_map_destroy(_db_indexes);
ds_map_destroy(_db_types);
ds_list_destroy(keys);
