//Operation to test if a value in the db is greater than the provided value

var val,arg,res;

res = true;
for(var i=0;i<ds_list_size(argument0);i+=1) {
    val = ds_list_find_value(argument0,i);
    arg = ds_list_find_value(argument1,i);
    if(is_real(val)) {arg = real(arg);}
    res = res && val > arg;
}

return res;
