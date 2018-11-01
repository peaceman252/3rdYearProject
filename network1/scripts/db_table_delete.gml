///db_table_delete(table)
/*
    Deletes a table from the database
*/

var table,columns,index,types;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];
columns = _db_column_names[? argument0];
types = _db_types[? argument0];

if(table >= 0) {
    ds_grid_destroy(table);
}
ds_map_destroy(index);
ds_map_destroy(columns);
ds_map_destroy(types);

ds_map_delete(_db_tables,argument0);
ds_map_delete(_db_indexes,argument0);
ds_map_delete(_db_column_names,argument0);
ds_map_delete(_db_types,argument0);
