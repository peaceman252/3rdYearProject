///db_save(path)
/*
    Saves all the database to file. The file can be later loaded with db_load.
*/

var file,table_name,table,index,columns,types;

file = file_text_open_write(argument0);
file_text_write_string(file,"GMSDB DATABASE FILE");
table_name = ds_map_find_first(_db_tables);
repeat (ds_map_size(_db_tables)) {
    file_text_writeln(file);
    table = ds_map_find_value(_db_tables,table_name);
    index = ds_map_find_value(_db_indexes,table_name);
    columns = ds_map_find_value(_db_column_names,table_name);
    types = ds_map_find_value(_db_types,table_name);
    
    file_text_write_string(file,table_name);
    file_text_writeln(file);
    file_text_write_string(file,ds_map_write(columns));
    file_text_writeln(file);
    if(table >= 0) {
        file_text_write_string(file,ds_grid_write(table));
    }
    file_text_writeln(file);
    file_text_write_string(file,ds_map_write(index));
    file_text_writeln(file);
    file_text_write_string(file,ds_map_write(types));
    
    table_name = ds_map_find_next(_db_tables, table_name);
}
file_text_close(file);
