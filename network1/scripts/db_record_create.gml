///db_record_create(table,values)
/*
    Inserts a new record in the database table with the provided values (should be passed in column order).
    Values can either be passed as string of comma separated values, or as script arguments.
    Example (values as arguments): db_record_create("fruits","banana","yellow",30)
    Example (values as string): db_record("fruits","banana,yellow,30")
    Returns: the id of the newly created record
*/

var table,index,row,col,new_id,values,types,columns;

table = _db_tables[? argument[0]];
if(!db_table_exists(argument[0])) {show_error("The table doesn't exists",false);}
index = _db_indexes[? argument[0]];
types = _db_types[? argument[0]];
columns = db_table_column_names(argument[0]);

new_id = ds_map_size(index)+1;
row = db_table_size(argument[0]);

if(table < 0) { //table empty, create it!
    table = ds_grid_create(ds_list_size(columns),1);
    _db_tables[? argument[0]] = table;
}
else {
    ds_grid_resize(table,ds_grid_width(table),ds_grid_height(table)+1);
}

if(ds_list_size(columns) == argument_count) {//values passed as arguments
    values = ds_list_create();
    for(var i=1;i<argument_count;i+=1) {
        ds_list_add(values,argument[i]);
    }
}
else { //values passed as string
    values = csv_parse_line(argument[1],",");
}

ds_list_insert(values,0,new_id);
for(var i=0;i<ds_list_size(columns);i+=1) {
    col = columns[| i];
    if(types[? col] == "real") {
        table[# i,row] = real(values[| i]);
    }
    else {
        table[# i,row] = string(values[| i]);
    }
}    
ds_list_destroy(values);
ds_list_destroy(columns);

ds_map_add(index,new_id,row);

return new_id;
