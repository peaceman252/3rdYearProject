///db_record_fetch_all(table,ids_list)
/*
    Returns a ds_list of records matching the provided ids. 
    Each record is a ds_map representation of its data.
    Deleting the returned ds_list automatically deletes also the records ds_maps.
*/

var table,index,column_names,ids,records;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];
column_names = db_table_column_names(argument0);
ids = argument1;
records = ds_list_create();

for(var i=0; i<ds_list_size(ids);i++) {
    var rid = ids[| i];
    var row = index[? rid];
    if(ds_map_exists(index,rid) && row > -1) {
        var record_map = ds_map_create();
        record_map[? "_table"] = argument0;
        for(var j=0; j<ds_list_size(column_names);j++) {
            var name = column_names[| j];
            record_map[? name] = table[# j,row ];
        }
        ds_list_add(records,record_map);
        ds_list_mark_as_map(records,ds_list_size(records)-1);
    }
}

ds_list_destroy(column_names);
return records;
