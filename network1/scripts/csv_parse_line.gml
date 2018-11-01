///csv_parse_line(string,separator,[convert to real])
/*
    Takes a CSV line as a string separated by the specified separator character, 
    and returns a ds_list of string values
*/

var line,list,sep,pos,val,conv;

line = argument[0];
sep = argument[1];
if(argument_count > 2) {conv = argument[2];}
else {conv = false;}

list = ds_list_create();

while(string_length(line) != 0) {
    pos = 0;
    if(string_char_at(line,1) == '"') {//quoted value
        var char,quotes; quotes = 0;
        for(var i=1;i<=string_length(line);i+=1) {
            char = string_char_at(line,i);
            if(char == '"') {quotes ^= 1; continue;}
            if(char == sep && quotes == 0) {pos = i; break;}
        }
        if(pos < 1) {pos = string_length(line)+1;}
        val = string_replace_all(string_copy(line,2,pos-3),'""','"');
    }
    else { //safe value
        pos = string_pos(sep,line);
        if(pos < 1) {pos = string_length(line)+1;}
        val = string_copy(line,1,pos-1);
    }
    if(conv) {ds_list_add(list,real(val));}     
    else {ds_list_add(list,val);}
    line = string_delete(line,1,pos);
}

return list;
