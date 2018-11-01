///db_record_exists(table,id)
/*
    Returns true if the record with id is present into the database
*/

var index,record;

index = _db_indexes[? argument0];

return ds_map_exists(index,argument1) && index[? argument1] > -1;
