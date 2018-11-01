///db_table_column_remove(table,column_name)
/*
    Removes the specified column from the table
*/

var columns,types,table,column_index;

columns = _db_column_names[? argument0];
column_index = columns[? argument1];
types = _db_types[? argument0];
table = _db_tables[? argument0];

if(ds_map_exists(columns,argument1)) {
    if(ds_grid_width(table)-1 != column_index) {
        ds_grid_set_grid_region(table,table,column_index+1,0,column_index+1,ds_grid_height(table)-1,column_index,0);
    }
    ds_grid_resize(table,ds_grid_width(table)-1,ds_grid_height(table));
    ds_map_delete(columns,argument1);
    ds_map_delete(types,argument1);

    //reindex columns
    var column_names = db_table_column_names(argument0);
    for(var i=0; i<ds_list_size(column_names);i++) {
        columns[? column_names[| i]] = i;
    }
    ds_list_destroy(column_names);
}
