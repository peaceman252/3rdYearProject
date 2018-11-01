/* Draw a simple high score table. 

// This sctipt will load a cached high score 

Remember it starts at 0, so EVEN lines are the player names, ODD lines ares the player scores. 
argument0 = X starting location of table.
argument1 = y starting location of table.
argument2 = space between columns
argument3  = spacing between rows.
argument4 = table style to use.
argument5 = Numbered  list on or off 0 off 1 on

example usage gsDrawTable(100,120,200,20,1);

*/

if (argument4 == 1) 
{
    // Plain Table (1)
    if file_exists(objGsController.settings[0])  // Make sure INI file exists, and open it.
    {
    ini_open(objGsController.settings[0]);
    }
    
    skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
    num = 0;

    ls = 0  // Counter for number of rows in INI file
    key = true;
    while (key)
    {
        // We need to get how many rows are in the table so we can draw the correct size table
        if ini_key_exists("HighScores", "Row" + string(ls)) ls++ else key = false;
    }
//ls now holds the number of the LAST key in the ini
for (a=0; a<ls a+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
{
    skip+=argument3; //The spacing bwtween lines
    if (argument5 == 1)
        {
            if (argument6 == 1)
            {
            num++;
                if (num < 10)
                    {
                    draw_text(argument0,skip,string(num) + ". " ); 
                    }
                if (num >= 10 && num < 100)
                    {
                    draw_text(argument0-objGsController.table[3,4],skip,string(num) + ". " );
                    }
                if (num >=100 &&num < 1000)
                    {
                    draw_text(argument0-objGsController.table[3,5],skip,string(num) + ". ");
                    }
                if (num >=1000 &&num < 9999)
                    {
                    draw_text(argument0-objGsController.table[3,6],skip,string(num) + ". " );
                    }
            draw_text(argument0+objGsController.table[3,2],skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN
            }
            else
            {
                num += 1;
                draw_text(argument0-objGsController.table[3,2],skip,string(num)+". ");
                draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN indexes for the names only
            }
        }
        else
        {
        draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN 
        }
}

skip2 = argument1
for (b=1; b<ls b+=2;) //<< Notice we start on 1 and incriment by 2 to get only ODD lines.
{
    skip2+=argument3;
    draw_text(argument0+argument2,skip2,ini_read_string("HighScores","Row"+string(b),"null")); //Loop through all the ODD indexes for the scores only.
}
ini_close(); // Close the INI file since we are done.
}

if (argument4 == 2) {

// Colored Table (2)
    if file_exists(objGsController.settings[0])  // Make sure INI file exists, and open it.
    {
    ini_open(objGsController.settings[0]);
    }
    
    skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
    num = 0;

    ls = 0  // Counter for number of rows in INI file
    key = true;
    while (key)
    {
        // We need to get how many rows are in the table so we can draw the correct size table
        if ini_key_exists("HighScores", "Row" + string(ls)) ls++ else key = false;
    }

skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines

num = 0;
for (a=0; a<ls a+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
{
    skip+=argument3; //The spacing bwtween lines
    switch (a)
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
            num++;
                if (num < 10)
                    {
                    draw_text(argument0,skip,string(num) + ". " ); 
                    }
                if (num >= 10 && num < 100)
                    {
                    draw_text(argument0-objGsController.table[3,4],skip,string(num) + ". " );
                    }
                if (num >=100 &&num < 1000)
                    {
                    draw_text(argument0-objGsController.table[3,5],skip,string(num) + ". ");
                    }
                if (num >=1000 &&num < 9999)
                    {
                    draw_text(argument0-objGsController.table[3,6],skip,string(num) + ". " );
                    }
            draw_text(argument0+objGsController.table[3,2],skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN
            }
            else
            {
                num += 1;
                draw_text(argument0-objGsController.table[3,2],skip,string(num)+". ");
                draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN indexes for the names only
            }
        }
        else
        {
        draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN 
        }
    draw_set_color(objGsController.settings[1]);
}

skip2 = argument1
for (b=1; b<ls b+=2;) //<< Notice we start on 1 and incriment by 2 to get only ODD lines.
{
    switch (b)
    {
    case 1: draw_set_color(objGsController.table[4]); break;
    case 3: draw_set_color(objGsController.table[5]); break;
    case 5: draw_set_color(objGsController.table[6]); break;
    case 7: draw_set_color(objGsController.table[7]); break;
    case 9: draw_set_color(objGsController.table[8]); break;
    case 11: draw_set_color(objGsController.table[9]); break;
    case 13: draw_set_color(objGsController.table[10]); break;
    case 15: draw_set_color(objGsController.table[11]); break;
    case 17: draw_set_color(objGsController.table[12]); break;
    case 19: draw_set_color(objGsController.table[13]); break;
    default: draw_set_color(objGsController.settings[1]);
    } 
    
    skip2+=argument3;
    draw_text(argument0+argument2,skip2,ini_read_string("HighScores","Row"+string(b),'null')); //Loop through all the ODD indexes for the scores only.
    draw_set_color(objGsController.settings[1]);
}
ini_close();
}

if (argument4 == 3) {
// Table with colored cells (3)

    if file_exists(objGsController.settings[0])  // Make sure INI file exists, and open it.
    {
    ini_open(objGsController.settings[0]);
    }
    
    skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
    num = 0;

    ls = 0  // Counter for number of rows in INI file
    key = true;
    while (key)
    {
        // We need to get how many rows are in the table so we can draw the correct size table
        if ini_key_exists("HighScores", "Row" + string(ls)) ls++ else key = false;
    }
skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
num = 0;
for (a=0; a<ls a+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
{
    skip+=argument3; //The spacing bwtween lines
    switch(a)
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
                    draw_text(argument0,skip,string(num) + ". " ); 
                    }
                if (num >= 10 && num < 100)
                    {
                    draw_text(argument0-objGsController.table[3,4],skip,string(num) + ". " );
                    }
                if (num >=100 &&num < 1000)
                    {
                    draw_text(argument0-objGsController.table[3,5],skip,string(num) + ". ");
                    }
                if (num >=1000 &&num < 9999)
                    {
                    draw_text(argument0-objGsController.table[3,6],skip,string(num) + ". " );
                    }
            draw_text(argument0+objGsController.table[3,2],skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN
            }
            else
            {
                num += 1;
                draw_text(argument0-objGsController.table[3,2],skip,string(num)+". ");
                draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN indexes for the names only
            }
        }
        else
        {
         if (objGsController.table[25] == 1)
            {
            draw_rectangle_color(argument0+objGsController.table[14],skip+objGsController.table[15],argument0+objGsController.table[16],skip+objGsController.table[17],objGsController.table[26],objGsController.table[26],objGsController.table[26],objGsController.table[26],1); 
            }   
        draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN 
        }
}

skip2 = argument1
for (b=1; b<ls b+=2;) //<< Notice we start on 1 and incriment by 2 to get only ODD lines.
{
    skip2+=argument3;
    if (objGsController.table[19] == 1)
        {
        switch(b)
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
    draw_text(argument0+argument2,skip2,ini_read_string("HighScores","Row"+string(b),"null")); //Loop through all the ODD indexes for the scores only.
}
ini_close();
}

if (argument4 == 4) {
// Image for BG (4)

    if file_exists(objGsController.settings[0])  // Make sure INI file exists, and open it.
    {
    ini_open(objGsController.settings[0]);
    }
    
    skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
    num = 0;

    ls = 0  // Counter for number of rows in INI file
    key = true;
    while (key)
    {
        // We need to get how many rows are in the table so we can draw the correct size table
        if ini_key_exists("HighScores", "Row" + string(ls)) ls++ else key = false;
    }
skip = argument1 // This is the starting Y location of the table, and will be used to incriment the space between lines
num = 0;
for (a=0; a<ls a+=2;) //<< Notice we are incrimenting by 2 to only get the EVEN lines
{
    skip+=argument3; //The spacing bwtween lines
    draw_sprite(sprTableBack,0,argument0+objGsController.table[29],skip+objGsController.table[30]);
     if (argument5 == 1)
        {
            if (argument6 == 1)
            {
            num++;
                if (num < 10)
                    {
                    draw_text(argument0,skip,string(num) + ". " ); 
                    }
                if (num >= 10 && num < 100)
                    {
                    draw_text(argument0-objGsController.table[3,4],skip,string(num) + ". " );
                    }
                if (num >=100 &&num < 1000)
                    {
                    draw_text(argument0-objGsController.table[3,5],skip,string(num) + ". ");
                    }
                if (num >=1000 &&num < 9999)
                    {
                    draw_text(argument0-objGsController.table[3,6],skip,string(num) + ". " );
                    }
            draw_text(argument0+objGsController.table[3,2],skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN
            }
            else
            {
                num += 1;
                draw_text(argument0-objGsController.table[3,2],skip,string(num)+". ");
                draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN indexes for the names only
            }
        }
        else
        {
        draw_text(argument0,skip,ini_read_string("HighScores","Row"+string(a),'null')); //Loop through all the EVEN 
        }
}

skip2 = argument1
for (b=1; b<ls b+=2;) //<< Notice we start on 1 and incriment by 2 to get only ODD lines.
{
    skip2+=argument3;
    draw_text(argument0+argument2,skip2,ini_read_string("HighScores","Row"+string(b),"null")); //Loop through all the ODD indexes for the scores only.
}
ini_close();
}
