///db_qf_update(table,operation,field,rows)
/*
    INTERNAL USE ONLY. Helper function for db_query_exec. 
    Performs a calculation on a result set.
*/

var table,columns,table_name,field,operation,rows,result;

table_name = argument0;
table = _db_tables[? table_name];
columns = _db_column_names[? table_name];
operation = argument1;
if(operation != "count") {
    field = columns[? argument2];
}
rows = argument3;

if(operation == "count") {
    result = ds_list_size(rows);
} 
else if(ds_list_empty(argument3)) {result = undefined;}
else {
    var grid = ds_grid_create(1,ds_list_size(rows));
    for(var i=0;i<ds_list_size(rows);i+=1) {
        ds_grid_set(grid,0,i,table[# field,rows[| i]]);
    }
    switch(operation) {
        case "mean": result = ds_grid_get_mean(grid,0,0,0,ds_grid_height(grid)-1); break;
        case "sum": result = ds_grid_get_sum(grid,0,0,0,ds_grid_height(grid)-1); break;
        case "min": result = ds_grid_get_min(grid,0,0,0,ds_grid_height(grid)-1); break;
        case "max": result = ds_grid_get_max(grid,0,0,0,ds_grid_height(grid)-1); break;
        default: result = "undefined";
    }
    ds_grid_destroy(grid);
}

return result;
