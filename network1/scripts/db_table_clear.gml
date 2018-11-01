///db_table_clear(table)
/*
    Deletes all the records of a table, resetting the index but keeping the table structure
*/

var table,index;

table = ds_map_find_value(_db_tables,argument0);
index = ds_map_find_value(_db_indexes,argument0);

ds_map_clear(index);

if(table >= 0) {
    ds_grid_destroy(table);
    ds_map_replace(_db_tables,argument0,-1);
}
