///db_record_update(table,id,columns,value)
/*
    Updates the value in the specified column of record id.
    Returns true if successful, false otherwise
*/

var table,index,types,columns;

table = _db_tables[? argument[0]];
index = _db_indexes[? argument[0]];
columns = _db_column_names[? argument[0]];
types = _db_types[? argument[0]];

if(table < 0) {return false;}
if(!db_record_exists(argument[0],argument[1])) {return false;}


var fields,values,row;

fields = string_parse(argument[2],",",false);
row = index[? argument[1]];

if(ds_list_size(fields) == argument_count - 3) { //values passed as arguments
    values = ds_list_create();
    for(var i=3;i<argument_count;i+=1) {
        ds_list_add(values,argument[i]);
    }
}
else { //values passed as string
    values = csv_parse_line(argument[3],",");
}

for(var i=0;i<ds_list_size(fields);i+=1) {
    var field = fields[| i];
    var value = values[| i];
    var col = columns[? field];
        
    if(types[? field] == "real") {
        table[# col,row] = real(value);
    }
    else {
        table[# col,row] = string(value);
    }
}

ds_list_destroy(values);
ds_list_destroy(fields);
return true;
