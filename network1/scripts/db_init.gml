///db_init()
/*
    Initializes the database system creating the required data structures
*/

globalvar _db_tables,_db_column_names,_db_indexes,_db_types;

_db_tables = ds_map_create(); //holds tables
_db_column_names = ds_map_create(); //holds column names
_db_types = ds_map_create(); //holds column types (string or real)
_db_indexes = ds_map_create(); //holds entry ids for fast lookup
