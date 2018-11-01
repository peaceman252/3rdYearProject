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

// Table with colored cells (3)================================================================================
if (argument4 == 3) {

skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
global.liste = ds_list_size(name_list);
num = global.listd;
for (global.lista = global.listc; global.lista<(objGsController.settings[16]*2); global.lista+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
{
    skip+=argument3; //The spacing bwtween lines
    switch(global.lista)
    {
    case 0: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[4],objGsController.table[4],objGsController.table[4],objGsController.table[4],objGsController.table[18]); break
    case 2: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[5],objGsController.table[5],objGsController.table[5],objGsController.table[5],objGsController.table[18]); break
    case 4: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[6],objGsController.table[6],objGsController.table[6],objGsController.table[6],objGsController.table[18]); break
    case 6: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[7],objGsController.table[7],objGsController.table[7],objGsController.table[7],objGsController.table[18]); break
    case 8: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[8],objGsController.table[8],objGsController.table[8],objGsController.table[8],objGsController.table[18]); break
    case 10: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[8],objGsController.table[9],objGsController.table[9],objGsController.table[9],objGsController.table[18]); break
    case 12: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[10],objGsController.table[10],objGsController.table[10],objGsController.table[10],objGsController.table[18]); break
    case 14: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[11],objGsController.table[11],objGsController.table[11],objGsController.table[11],objGsController.table[18]); break
    case 16: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[12],objGsController.table[12],objGsController.table[12],objGsController.table[12],objGsController.table[18]); break
    case 18: draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[13],objGsController.table[13],objGsController.table[13],objGsController.table[13],objGsController.table[18]); break
    default: draw_set_color(objGsController.settings[1]);
    }
     if (argument5 == 1)
        {
        if (argument6 == 1)
            {
            num++;
                if (objGsController.table[25] == 1)
                    {
                    draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[26],objGsController.table[26],objGsController.table[26],objGsController.table[26],1); 
                     }
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
             num++
             draw_text(argument0,skip,string(num) + ". "); //Loop through all the EVEN indexes for the names only   
            }
                 if (objGsController.table[25] == 1)
                {
                 draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[26],objGsController.table[26],objGsController.table[26],objGsController.table[26],1); 
                }
            draw_text(argument0+objGsController.table[3,2],skip,ds_list_find_value(name_list,global.lista));//Loop through all the EVEN indexes for the names only
        }
        else
        {
        
    if (objGsController.table[25] == 1)
    {
    draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[26],objGsController.table[26],objGsController.table[26],objGsController.table[26],1); 
    }
    draw_text(argument0,skip,ds_list_find_value(name_list,global.lista)); //Loop through all the EVEN indexes for the names only
}}

skip2 = argument1
for (global.listb=1; global.listb<(objGsController.settings[16]*2) global.listb+=2;) //<< Notice we start on 1 and incriment by 2 to get only ODD lines.
{
    skip2+=argument3;
    if (objGsController.table[19] == 1)
        {
        switch(global.listb)
        {
        case 1: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[4],objGsController.table[4],objGsController.table[4],objGsController.table[4],objGsController.table[20]); break
        case 3: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[5],objGsController.table[5],objGsController.table[5],objGsController.table[5],objGsController.table[20]); break
        case 5: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[6],objGsController.table[6],objGsController.table[6],objGsController.table[6],objGsController.table[20]); break
        case 7: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[7],objGsController.table[7],objGsController.table[7],objGsController.table[7],objGsController.table[20]); break
        case 9: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[8],objGsController.table[8],objGsController.table[8],objGsController.table[8],objGsController.table[20]); break
        case 11: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[8],objGsController.table[9],objGsController.table[9],objGsController.table[9],objGsController.table[20]); break
        case 13: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[10],objGsController.table[10],objGsController.table[10],objGsController.table[10],objGsController.table[20]); break
        case 15: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[11],objGsController.table[11],objGsController.table[11],objGsController.table[11],objGsController.table[20]); break
        case 17: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[12],objGsController.table[12],objGsController.table[12],objGsController.table[12],objGsController.table[20]); break
        case 19: draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[13],objGsController.table[13],objGsController.table[13],objGsController.table[13],objGsController.table[20]); break
        default: draw_set_color(objGsController.settings[1]);
        }
        if (objGsController.table[27] == 1)
        {
        draw_rectangle_color(argument0+argument2+objGsController.table[21],skip2+objGsController.table[22],argument0+argument2+objGsController.table[23],skip2+objGsController.table[24],objGsController.table[28],objGsController.table[28],objGsController.table[28],objGsController.table[28],1);
        }
    }
    draw_text(argument0+argument2,skip2,ds_list_find_value(name_list,global.listb)); //Loop through all the ODD indexes for the scores only.
}
}
