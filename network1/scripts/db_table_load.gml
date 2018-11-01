///db_table_load(path)
/*
    Loads a dump file saved with db_table_write into the database
*/

var file,table,index,columns,name,types;

columns = ds_map_create();
table = -1;
index = ds_map_create();
types = ds_map_create();

file = file_text_open_read(argument0);
name = file_text_read_string(file);
file_text_readln(file);
ds_map_read(columns,file_text_read_string(file));
file_text_readln(file);
var table_data = file_text_read_string(file);
if(table_data != "") {
    table = ds_grid_create(1,1);
    ds_grid_read(table,table_data);
}
file_text_readln(file);
ds_map_read(index,file_text_read_string(file));
file_text_readln(file);
ds_map_read(types,file_text_read_string(file));
file_text_close(file);

if(db_table_exists(name)) {db_table_delete(name);}

ds_map_add(_db_tables,name,table);
ds_map_add(_db_column_names,name,columns);
ds_map_add(_db_types,name,types);
ds_map_add(_db_indexes,name,index);
