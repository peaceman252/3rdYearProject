///db_table_create(name,columns[col:type,col:type,...])
/*
    Creates a table in the database, witht the specified columns. A special column "id" is auto generated.
    If a table already exists with the same name, it is deleted and replaced.
    Fields have to be passed as comma separated strings (Eg: "name:string,color:string,weight:real")
*/
    
var table,columns,index,fields,types;

if(db_table_exists(argument0)) {
    db_table_delete(argument0);
}

fields = string_parse(argument1,",",false);
table = -1;
types = ds_map_create();
columns = ds_map_create();

ds_map_add(columns,"id",0) //add default id column
ds_map_add(types,"id","real"); //set id type
for(var i=0;i<ds_list_size(fields);i+=1) {
    var col = pair_get(fields[| i],":",0);
    var type = pair_get(fields[| i],":",1);
    ds_map_add(columns,col,i+1);
    ds_map_add(types,col,type);
}
ds_list_destroy(fields);

index = ds_map_create();

ds_map_add(_db_tables,argument0,table);
ds_map_add(_db_types,argument0,types);
ds_map_add(_db_column_names,argument0,columns);
ds_map_add(_db_indexes,argument0,index);
