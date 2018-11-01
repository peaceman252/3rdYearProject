///db_query_exec(query,[keep_query])
/*
    Executes a prepared query and returns the results. 
    If keep query is set to true, the query is not destroyed at the end of the script call and can be reused.
    Returns: query results
*/

//init generic parameters

var query,results,keep;

query = argument[0];
if(argument_count > 1) {keep = argument[1];}
else {keep = false;}
results = -1;

//init other clauses
var table_name = query[? "table_name"];
var function = query[? "function"];
var where_script = query[? "where_script"];
var where_fields = query[? "where_fields"];
var where_args = query[? "where_args"];
var limit = query[? "limit"];
var offset = query[? "offset"];
var only = query[? "only"];
var sort_field = query[? "sort_field"];
var fields = query[? "fields"];
var values = query[? "values"];
var join_table_name = query[? "join_table_name"];
var foreign_key = query[? "foreign_key"];
var calc_operation = query[? "calc_operation"];
var sort_records = sort_field != "" && function != "calc"; //if count query, no need to sort the records

//join tables
if(join_table_name != "") {
    db_table_merge(table_name,join_table_name,"_jointable_",foreign_key);
    table_name = "_jointable_";
}

//fetch affected rows
var rows = db_qf_fetch(table_name,only,where_script,where_fields,where_args,limit,offset,sort_records);

//sort rows
if(sort_records) {
    db_qf_sort(table_name,rows,sort_field,limit,offset);
}

//handle functions
switch(function) {
    case "select":
        results = db_qf_select(table_name,fields,rows); 
        break;
    case "delete":
        if(join_table_name != "") {table_name = query[? "table_name"];}
        results = db_qf_delete(table_name,rows); 
        break;
    case "update":
        if(join_table_name != "") {table_name = query[? "table_name"];}
        results = db_qf_update(table_name,fields,values,rows);
        break;
    case "calc":
        results = db_qf_calc(table_name,calc_operation,fields,rows);
        break;
}

//cleanup
if(join_table_name != "") {
    db_table_delete("_jointable_");
}
ds_list_destroy(rows); 
if(!keep) {
    db_query_free(query);
}

return results;
