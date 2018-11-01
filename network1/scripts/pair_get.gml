///pair_get(string,separator,n)
/*
    Returns the nth (0 or 1) part of the string as separated by the 
    specified separator.
*/

var str = argument0;
var sep = argument1;
var n = argument2;

var pos = string_pos(sep,str);

if(pos < 1) {return str;}

if(n) {
    return string_copy(str,pos+1,string_length(str)-pos);
}
else {
    return string_copy(str,1,pos-1);
}


