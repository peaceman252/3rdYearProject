///csv_compose_line(ds_list,separator)
/*
    Returns a string containing a valid CSV line from the values in a ds_list
    Values are separated by a separator character.
*/
    
var quoted,sep,value,result;

sep = argument1;
result = "";

for(var i=0;i<ds_list_size(argument0);i+=1) {
    value = string(argument0[| i]);

    if(string_count('"',value) + string_count(sep,value) + string_count(chr(10),value) + string_count(chr(13),value) > 0 ) {
        value = '"' + string_replace_all(value,'"','""') + '"';
    }

    result += value;
    if(i < ds_list_size(argument0)-1) {result += sep;}    
}

return result;
