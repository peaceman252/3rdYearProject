/* This script will break apart a string and store the reuslt in a ds_list. The string 
delimiter is passed as an argument, so it can break apart any string really.
*/

var c, i, j, k, s;
s = "";
i = 0;
k = string_length(argument0);
brk = ds_list_create();
for (j = 1; j <= k; j += 1)
{
    c = string_char_at(argument0, j);
    if (c == argument1)
    {
        ds_list_add(brk,s);
        s = "";
        i += 1;
        continue;
    }
    s = s + c;
}
if (s != "")
   ds_list_add(brk,s);
