///db_table_save(table,path)
/*
    Saves a complete table to a file. The file can be later loaded with db_table_read.
*/

var file,table,index,columns,types;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];
columns = _db_column_names[? argument0];
types = _db_types[? argument0];

file = file_text_open_write(argument1);
    file_text_write_string(file,argument0);
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
file_text_close(file);
