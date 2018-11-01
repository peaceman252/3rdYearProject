///db_record_build(table,[key:value],[key:value],...)
/*
    Crates a ds_map representation of a record for the provided table.
    Unlike db_record_create, this call DOES NOT insert the record in the table
    until db_record_save is called.
    Optionally, you can preload some default data into the ds_map by passing key:value pair strings as arguments.
    Example 1: db_record_build("items");
    Example 2: db_record_build("items","equipped:0","quantity:0");
*/

var record_map,column_names,table,types,params;

table = _db_tables[? argument[0]];
types = _db_types[? argument[0]];
column_names = db_table_column_names(argument[0]);
params = ds_map_create();

record_map = ds_map_create();
record_map[? "_table"] = argument[0];

if(argument_count > 1) {
    for(var i=1;i<argument_count;i+=1) {
        var key = pair_get(argument[i],":",0);
        var value = pair_get(argument[i],":",1);
        if(ds_map_exists(types,key)) {
            if(types[? key] == "real") {params[? key] = real(value);}
            else {params[? key] = value;}
        }
    }
}

for(var i=0; i<ds_list_size(column_names);i++) {
    var col_name = column_names[| i];
    if(ds_map_exists(params,col_name)) { //if value for the column provided as argument
        record_map[? col_name] = params[? col_name];
    }
    else { //value for the column not provided, add default
        if(types[? col_name] == "real") {record_map[? col_name] = -1;}
        else {record_map[? col_name] = "";}
    }
}

ds_map_destroy(params);
ds_list_destroy(column_names);

return record_map;
