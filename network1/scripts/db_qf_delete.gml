///db_qf_delete(table,rows)
/*
    INTERNAL USE ONLY. Helper function for db_query_exec. 
    Applies delete function to a set of record indexes.
*/

var table,table_name,rows,row,record_id,index;

table_name = argument0;
rows = argument1;
table = _db_tables[? table_name];
index = _db_indexes[? table_name];

ds_list_sort(rows,true);

for(var i=0;i<ds_list_size(rows);i+=1) {
    row = rows[| i] - i;
    record_id = table[# 0,row];
    ds_grid_set_grid_region(table,table,0,row+1,ds_grid_width(table)-1,ds_grid_height(table)-1,0,row);
    if(ds_grid_height(table)-1 == 0) {
        ds_grid_destroy(table);
        ds_map_replace(_db_tables,table_name,-1);
    }
    else {
        ds_grid_resize(table,ds_grid_width(table),ds_grid_height(table)-1);
    }
    ds_map_replace(index,record_id,-1); //set index for the id to -1
}

if(ds_list_size(rows) > 0) {
    db_table_reindex(table_name); //reindex to keep track of grid changes
}

return ds_list_size(rows);
