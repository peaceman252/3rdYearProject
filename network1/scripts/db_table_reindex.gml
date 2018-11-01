///db_table_reindex(table)
/*
    Rebuils the index of the table. Used internally.
*/

var index,table,t_id;

table = _db_tables[? argument0];
index = _db_indexes[? argument0];

if(table >= 0) {
    for(var i=0;i<ds_grid_height(table);i+=1) {
        t_id = table[# 0,i];
        if(ds_map_exists(index,t_id)) {
            ds_map_replace(index,t_id,i);
        }
        else {
            ds_map_add(index,t_id,i);
        }
    }
}
