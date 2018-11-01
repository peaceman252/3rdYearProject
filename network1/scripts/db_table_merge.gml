///db_table_merge(t1,t2,name,foreign_key)
/*
    INTERNAL USE ONLY! Merges to tables into a new one. Needed by join query clause. 
*/

var t1,t1_name,t1_columns,t1_types,t1_index;
t1_name = argument0;
t1 = _db_tables[? t1_name];
t1_index = _db_indexes[? t1_name];
t1_columns = _db_column_names[? t1_name];
t1_types = _db_types[? t1_name];

var t2,t2_name,t2_columns,t2_types,t2_index;
t2_name = argument1;
t2 = _db_tables[? t2_name];
t2_index = _db_indexes[? t2_name];
t2_columns = _db_column_names[? t2_name];
t2_types = _db_types[? t2_name];

var t3,t3_name,t3_columns,t3_types,t3_index;
t3_name = argument2;
if(t1 >= 0) {
    t3 = ds_grid_create(ds_map_size(t1_columns)+ds_map_size(t2_columns),ds_grid_height(t1));
    ds_grid_clear(t3,undefined);
}
else {
    t3 = -1;
}
t3_columns = ds_map_create();
t3_types = ds_map_create();
t3_index = ds_map_create();

//merge table values
if(t1 >= 0) {
    var foreign_key 
    foreign_key = t1_columns[? argument3];
    ds_grid_set_grid_region(t3,t1,0,0,ds_grid_width(t1)-1,ds_grid_height(t1)-1,0,0);
    if(t2 >= 0) {
        for(var t1_row=0;t1_row<ds_grid_height(t1);t1_row+=1) {
            if(db_record_exists(t2_name,t1[# foreign_key,t1_row])) {
                var t2_row = t2_index[? t1[# foreign_key,t1_row]];
                ds_grid_set_grid_region(t3,t2,0,t2_row,ds_grid_width(t2),t2_row,ds_grid_width(t1),t1_row);
            }
        }
    }
}

//merge column names
var t1_cnames,t2_cnames;
t1_cnames = db_table_column_names(t1_name);
t2_cnames = db_table_column_names(t2_name);
for(var i=0;i<ds_list_size(t1_cnames);i+=1) {
    var n = t1_cnames[| i];
    ds_map_add(t3_columns,t1_name+"."+n,i);
    ds_map_add(t3_types,t1_name+"."+n,t1_types[? n]);
}
for(var i=0;i<ds_list_size(t2_cnames);i+=1) {
    var n = t2_cnames[| i];
    ds_map_add(t3_columns,t2_name+"."+n,i+ds_list_size(t1_cnames));
    ds_map_add(t3_types,t2_name+"."+n,t2_types[? n]);
}
ds_list_destroy(t1_cnames);
ds_list_destroy(t2_cnames);

//copy index
ds_map_copy(t3_index,t1_index);

//add to tables
ds_map_add(_db_tables,t3_name,t3);
ds_map_add(_db_types,t3_name,t3_types);
ds_map_add(_db_column_names,t3_name,t3_columns);
ds_map_add(_db_indexes,t3_name,t3_index);
