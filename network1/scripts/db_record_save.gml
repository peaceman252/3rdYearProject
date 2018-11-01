///db_record_save(record_ds_map)
/*
    Saves the data of the provided record ds_map (as obtained from db_record_fetch
    or db_record_build) to the database.
*/

var table_name,table,index,columns,types,record_map,record_id,row;

record_map = argument0;
record_id = record_map[? "id"];
table_name = record_map[? "_table"];
table = _db_tables[? table_name];
if(!db_table_exists(table_name)) {show_error("The table doesn't exists",false);}
index = _db_indexes[? table_name];
types = _db_types[? table_name];

if(record_id > 0) { //if updating
    if(!ds_map_exists(index,record_id) || index[? record_id] < 0) {
        return false; //record has been deleted or does not exists
    }
}

columns = db_table_column_names(table_name);

//fetch or create row
if(record_id <= 0) { //create record
    record_id = ds_map_size(index)+1;
    record_map[? "id"] = record_id;
    row = db_table_size(table_name);
    
    if(table < 0) { //table empty, create it!
        table = ds_grid_create(ds_list_size(columns),1);
        _db_tables[? table_name] = table;
    }
    else {
        ds_grid_resize(table,ds_grid_width(table),ds_grid_height(table)+1);
    }
    ds_map_add(index,record_id,row);
}
else {
    row = index[? record_id];
}

//insert data
for(var i=0; i<ds_list_size(columns);i++) {
    var col_name = columns[| i];
    var value = record_map[? col_name];
    if(types[? col_name] == "real") {value = real(value);}
    else {value = string(value);}
    table[# i,row] = value;
}

ds_list_destroy(columns);
return true;
