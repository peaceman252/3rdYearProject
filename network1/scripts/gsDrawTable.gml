/* Draw a simple high score table. 

THIS SCRIPT SHOULD BE CALLED AFTER USING gsGet_List!

The ds_list with the scores is stored as

name
score
name 
score

Remember it starts at 0, so EVEN lines are the player names, ODD lines ares the player scores. 
argument0 = X starting location of table.
argument1 = y starting location of table.
argument2 = space between columns
argument3  = spacing between rows.
argument4 = table style to use.
argument5 = Numbered  list on or off 0 off 1 on
argument6 = Use tweening adjustments for non mono spaced fonts

example usage gsDrawTable(100,120,200,20,1,0);

2.1 update - tables have moved to individual scripts to make it easier to modify a singe table type!
This sctips still exists to mitigate making major changes to the core code.
*/

switch(argument4)
    {
    case 1: gsTable1_noScroll(argument0,argument1,argument2,argument3,argument4,argument5,argument6); break;
    case 2: gsTable2(argument0,argument1,argument2,argument3,argument4,argument5,argument6); break;
    case 3: gsTable3(argument0,argument1,argument2,argument3,argument4,argument5,argument6); break;
    case 4: gsTable4(argument0,argument1,argument2,argument3,argument4,argument5,argument6); break; 
    case 5: gsTable1_Scroll(argument0,argument1,argument2,argument3,argument4,argument5,argument6); break; 
    default: gsTable1_noScroll(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
    }
