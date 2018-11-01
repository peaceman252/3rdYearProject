///db_table_load_csv(table,path,separator)
/*
    Loads and inserts contents into the table from a CSV file.
    The file has to be formatted as seen using db_table_save_csv.
    The first row (labels) and the first column (ids) are skipped.
    Note that existing contents in the table are left untouched.
*/

var csv,values;

csv = file_text_open_read(argument1);
file_text_readln(csv); //skip labels
while(!file_text_eof(csv)) {
    //parse the line and recompose it (deleting the id value)
    values = csv_parse_line(file_text_read_string(csv),argument2);
    ds_list_delete(values,0); //remove id value
    db_record_create(argument0,csv_compose_line(values,","));
    ds_list_destroy(values);
    file_text_readln(csv);
}
file_text_close(csv);
