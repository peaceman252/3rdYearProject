// This first bit will write the table to an ini file to be loaded if the player is offline.
if (objGsController.settings[12] == 1 && wr == 1)
{
    ls = ds_list_size(name_list);
    ini_open(objGsController.settings[0])
    ini_section_delete('HighScores');
    for (c=0 c<ls c+=1)
    {
        ini_write_string('HighScores','Row'+string(c),string(ds_list_find_value(name_list,c)));
    }
    ini_close();
    wr = 0;
}

// Colored Table (2)===================================================================
if (argument4 == 2) 
{
    skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
    ls = ds_list_size(name_list);
    num = global.listd;
    for (global.lista=0; global.lista<(objGsController.settings[16]*2) global.lista+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
        {
            skip+=argument3; //The spacing bwtween lines
            num++
            global.listb = global.lista+1;
            switch (global.lista)
                {
                    case 0: draw_set_color(objGsController.table[4]); break;
                    case 2: draw_set_color(objGsController.table[5]); break;
                    case 4: draw_set_color(objGsController.table[6]); break;
                    case 6: draw_set_color(objGsController.table[7]); break;
                    case 8: draw_set_color(objGsController.table[8]); break;
                    case 10: draw_set_color(objGsController.table[9]); break;
                    case 12: draw_set_color(objGsController.table[10]); break;
                    case 14: draw_set_color(objGsController.table[11]); break;
                    case 16: draw_set_color(objGsController.table[12]); break;
                    case 18: draw_set_color(objGsController.table[13]); break;
                    default: draw_set_color(objGsController.settings[1]);
                } 
    
    if (argument5 == 1)
        {
            if (argument6 == 1)
                {
                    if (num < 10)
                        {
                        draw_text(argument0,skip,string(num) + ". " ); //Loop through all the EVEN indexes for the names only
                        }
                    if (num >= 10 && num < 100)
                        {
                        draw_text(argument0-objGsController.table[3,4],skip,string(num) + ". " ); //Loop through all the EVEN indexes for the names only
                        }
                    if (num >=100 &&num < 1000)
                        {
                        draw_text(argument0-objGsController.table[3,5],skip,string(num) + ". ");
                        }
                    if (num >=1000 &&num < 9999)
                        {
                        draw_text(argument0-objGsController.table[3,6],skip,string(num) + ". " );
                        }
                }
            else
                {
                    draw_text(argument0,skip,string(num) + ". "); //Loop through all the EVEN indexes for the names only   
                }
            draw_text(argument0+objGsController.table[3,2],skip,ds_list_find_value(name_list,global.lista));//Loop through all the EVEN indexes for the names only
            draw_text(argument0+argument2,skip,ds_list_find_value(name_list,global.listb)); //Loop through all the ODD indexes for the scores only.
     }
    else
        {
         draw_text(argument0,skip,ds_list_find_value(name_list,global.lista));//Loop through all the EVEN indexes for the names only
         draw_text(argument0+argument2,skip,ds_list_find_value(name_list,global.listb)); //Loop through all the ODD indexes for the scores only.
        }
    
        }
        draw_set_color(objGsController.settings[1]);
        if num == ls { ds_list_destroy(name_list) }
}
