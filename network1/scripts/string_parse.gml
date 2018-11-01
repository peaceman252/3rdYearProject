///string_parse(string,separator,convert_to_real)
/*
    Splits a string based on a separator characters and returns a ds_list of values
    Example: string_parse("first|second|third","|",true)
*/
{
    var str, token, ignore, conv, list, tlen, temp;

    str = argument0;
    token = argument1;
    conv = argument2;
    ignore = false;

    list = ds_list_create();
    tlen = string_length( token);

    while( string_length( str) != 0) {
        temp = string_pos( token, str);
        if( temp) {
            if( temp != 1 || !ignore)
            if(conv) {ds_list_add( list, real(string_copy(str, 1, temp - 1)));}
            else {ds_list_add( list, string_copy(str, 1, temp - 1));}
            str = string_copy( str, temp + tlen, string_length( str));
        }
        else {
            if(conv) {ds_list_add( list, real(str));}
            else {ds_list_add( list, str);}
            str = "";
        }
    }

    return list;
}
