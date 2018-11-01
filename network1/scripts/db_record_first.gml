///db_record_first(table,column,value)
/*
    Returns the id of the first record having value at the specified column, 
    or 0 if no record found.
*/

var table,columns,column;

table = _db_tables[? argument0];
columns = _db_column_names[? argument0];
column = columns[? argument1];

if(table < 0) {
    return 0;
}

if(ds_grid_value_exists(table,column,0,column,ds_grid_height(table)-1,argument2)) {
    var row = ds_grid_value_y(table,column,0,column,ds_grid_height(table)-1,argument2);
    return table[# 0,row];
}
else {
    return 0;
}
