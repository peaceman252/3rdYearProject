///db_record_delete(table,id)
/*
    Deletes record with id from the database table.
    Returns false if record is not found, true otherwise
*/

var table,index,record_id;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];
record_id = argument1;

if(table < 0) {
    return false;
}

if(db_record_exists(argument0,record_id)) {
    var row = ds_map_find_value(index,record_id);
    ds_grid_set_grid_region(table,table,0,row+1,ds_grid_width(table)-1,ds_grid_height(table)-1,0,row);
    if(ds_grid_height(table)-1 == 0) {
        ds_grid_destroy(table);
        ds_map_replace(_db_tables,argument0,-1);
    }
    else {
        ds_grid_resize(table,ds_grid_width(table),ds_grid_height(table)-1);
    }
    ds_map_replace(index,record_id,-1); //set index for the id to -1
    db_table_reindex(argument0);
    return true;
}
else {
    return false;
}
