///db_qf_sort(table,rows,sort_field,limit,offset)
/*
    INTERNAL USE ONLY. Sorts a ds_list of record indexes from a given set of parameters
*/

if(ds_list_empty(argument1)) {exit;}

if(argument2 == "RAND") {
    ds_list_shuffle(argument1);
    if(argument3 > 0 || argument4 > 0) { //limit list (offset ignored)
        var new_rows = ds_list_create();
        var top = min(argument3,ds_list_size(argument1));
        for(var i=0; i<top; i+=1) {
            new_rows[| i] = argument1[| i];
        }
        ds_list_copy(argument1,new_rows);
        ds_list_destroy(new_rows);
    }
    exit;
}

var table,columns,rows,sort_fields,sort_order,limit,offset,grid,params;

table = _db_tables[? argument0];
columns = _db_column_names[? argument0];
rows = argument1;
params = string_parse(argument2,",",false);
limit = argument3;
offset = argument4;
sort_fields = ds_list_create();
sort_order = ds_list_create();

//prepare fields db_table_column_indexes(argument0,argument2);
for(var i=0;i<ds_list_size(params);i++) {
    var p = params[| i];
    ds_list_add(sort_fields,columns[? pair_get(p,":",0)]);
    ds_list_add(sort_order,pair_get(p,":",1));
}

//create sortable row grid
grid = ds_grid_create(ds_list_size(sort_fields)+1,ds_list_size(rows));

if(ds_list_size(sort_fields) == 1) { //single column sorting
    var column = sort_fields[| 0];
    for(var i=0;i<ds_list_size(rows);i+=1) {
        ds_grid_set(grid,0,i,rows[| i]);
        ds_grid_set(grid,1,i,table[# column,rows[| i]]);
    }
    ds_grid_sort(grid,1,sort_order[| 0] == "asc");
}
else { //multi column sorting
    for(var i=0;i<ds_list_size(rows);i+=1) {
        ds_grid_set(grid,0,i,rows[| i]);
        for(var c=0;c<ds_list_size(sort_fields);c+=1) {
            ds_grid_set(grid,c+1,i,table[# sort_fields[| c],rows[| i]]);
        }
    }
    ds_grid_sort(grid,1,sort_order[| 0] == "asc");
    for(var i=2;i<ds_grid_width(grid);i+=1) {
        var start_row = 0;
        for(var r=0;r<ds_grid_height(grid);r+=1) {
            if(grid[# i-1,r] != grid[# i-1,start_row] || r == ds_grid_height(grid)-1) {
                if(r == ds_grid_height(grid)-1) {r += 1;}
                if(r - start_row > 1) { //need to sort chunk
                    var temp_grid = ds_grid_create(ds_grid_width(grid),r-start_row);
                    ds_grid_set_grid_region(temp_grid,grid,0,start_row,ds_grid_width(grid)-1,r-1,0,0);
                    ds_grid_sort(temp_grid,i,sort_order[| i-1] == "asc");
                    ds_grid_set_grid_region(grid,temp_grid,0,0,ds_grid_width(temp_grid)-1,ds_grid_height(temp_grid)-1,0,start_row);
                    ds_grid_destroy(temp_grid);
                }
                start_row = r;
            }
        }
    }
}

ds_list_destroy(params);
ds_list_destroy(sort_fields);
ds_list_destroy(sort_order);

//reset rows list and apply limit and offset
ds_list_clear(rows);
var top = ds_grid_height(grid);
if(limit > 0) {top = min(limit+offset,ds_grid_height(grid));}

for(var i=offset;i<top;i+=1) {
    ds_list_add(rows,grid[# 0,i]);
}

//cleanup
ds_grid_destroy(grid);
