///db_table_size(table)
/*
    Returns the number of records in a table
*/

var table;

table = _db_tables[? argument0];

if(table < 0) {
    return 0;
}
else {
    return ds_grid_height(table);
}
