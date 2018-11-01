///db_record_rnd(table,n)
/*
    Returns a ds_list of n random valid ids from the specified table.
    Note that the list may contain duplicate ids. If you need a list of
    unique records, perform a query with random sorting.
    If n == 1, and id is returned instead of a ds_list.
    If the table is empty 0 is returned.
*/

var table;

table = _db_tables[? argument0];

if(table < 0) {
    return 0;
}

if(argument1 == 1) {
    return table[# 0,irandom(ds_grid_height(table)-1)];
}
else {
    var ids = ds_list_create();
    repeat(argument1) {
        ds_list_add(ids,table[# 0,irandom(ds_grid_height(table)-1)]);   
    }
    return ids;
}
