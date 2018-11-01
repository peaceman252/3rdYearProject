///dq_qf_select(table,columns,affected_rows)
/*
    INTERNAL USE ONLY. Helper function for db_query_exec. Applies select function to a set of record indexes.
    Returns: a ds_grid of affected_rows
*/

var data,table,rows;

rows = argument2;
if(ds_list_empty(rows)) {return -1;}
table = _db_tables[? argument0];

if(argument1 == "id") { //return ds_list of ids
    data = ds_list_create();
    for(var i=0;i<ds_list_size(rows);i+=1) {
        ds_list_add(data,table[# 0,rows[| i]]);
    }
}
else if(argument1 == "") { //fetch all data
    var columns = ds_grid_width(table);
    data = ds_grid_create(columns,ds_list_size(rows));
    
    for(var i=0;i<ds_list_size(rows);i+=1) {
        ds_grid_set_grid_region(data,table,0,rows[| i],columns-1,rows[| i],0,i);
    }
}
else { //fetch only requested fields
    var fields = db_table_column_indexes(argument0,argument1);

    data = ds_grid_create(ds_list_size(fields),ds_list_size(rows));
    for(var i=0;i<ds_list_size(rows);i+=1) {
        for(var j=0;j<ds_list_size(fields);j+=1) {
            ds_grid_set(data,j,i,table[# fields[| j],rows[| i]]);
        }
    }

    ds_list_destroy(fields);
}

return data;
