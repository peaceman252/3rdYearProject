//Operation to test if a value in the db is between two values (inluding the values themselves)

var val,arg1,arg2;

val = ds_list_find_value(argument0,0);
arg1 = ds_list_find_value(argument1,0);
arg2 = ds_list_find_value(argument1,1);

if(is_real(val)) {
    arg1 = real(arg1);
    arg2 = real(arg2);
}

return val >= arg1 && val <= arg2;
