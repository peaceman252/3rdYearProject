///db_record_fetch(table,id)
/*
    Finds the record with the provided id and returns a ds_map representation
    of that record. If no record is found with the provided id, -1 is returned.
*/

var table,index,column_names,row,record_map;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];
column_names = db_table_column_names(argument0);
row = index[? argument1];

if(ds_map_exists(index,argument1) && row > -1) {
    record_map = ds_map_create();
    record_map[? "_table"] = argument0;
    for(var i=0; i<ds_list_size(column_names);i++) {
        var name = column_names[| i];
        record_map[? name] = table[# i,row ];
    }
    ds_list_destroy(column_names);
    return record_map;
}
else {
    ds_list_destroy(column_names);
    return -1;
}
