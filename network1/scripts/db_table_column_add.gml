///db_table_column_add(table,column_name,type,default)
/*
    Adds a column to a table, holding values of the specified type.
*/

var columns,types,table,def;

columns = _db_column_names[? argument0];
types = _db_types[? argument0];
table = _db_tables[? argument0];
if(argument2 == "real") {def = real(argument3);}
else {def = string(argument3);}

if(!ds_map_exists(columns,argument1)) {
    ds_map_add(columns,argument1,ds_grid_width(table));
    ds_map_add(types,argument1,argument2);
    ds_grid_resize(table,ds_grid_width(table)+1,ds_grid_height(table));
    ds_grid_set_region(table,ds_grid_width(table)-1,0,ds_grid_width(table)-1,ds_grid_height(table)-1,def);
}
