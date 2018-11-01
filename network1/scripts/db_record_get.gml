///db_record_get(table,id,column)
/*
    Finds the record with the provided id and returns the contents of the provided column.
    Returns undefined if the records is not found.
*/

var table,index,columns;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];
columns = _db_column_names[? argument0];

if(table < 0) {
    return undefined;
}

if(db_record_exists(argument0,argument1)) {
    var row = ds_map_find_value(index,argument1);
    var col = ds_map_find_value(columns,argument2);
    return ds_grid_get(table,col,row);
}
else {
    return undefined;
}
