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

if (argument4 == 4) {
// Image for BG (4)
skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
global.liste = ds_list_size(name_list);
num = global.listd;
for (global.lista=0; global.lista<(objGsController.settings[16]*2) global.lista+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
{

    skip+=argument3; //The spacing bwtween lines
    num++;
    global.listb = global.lista+1;
    draw_sprite(sprTableBack,0,argument0+objGsController.table[29],skip+objGsController.table[30]);
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
}
