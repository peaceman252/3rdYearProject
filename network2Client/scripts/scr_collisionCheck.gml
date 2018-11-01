//horizontal collisions
var hspd_final = hspd + hspd_carry;
hspd_carry = 0;
if (place_meeting(x+hspd_final, y, obj_block))
{
    while (!place_meeting(x+sign(hspd_final), y, obj_block))
    {
        x += sign(hspd_final);
    }
    hspd_final = 0;
    hspd = 0;
}

//set our horizontal position
x += hspd_final;

//vertical collisions
if (place_meeting(x, y+vspd, obj_block))
{
    while (!place_meeting(x, y+sign(vspd), obj_block))
    {
        y += sign(vspd);
    }
    vspd = 0;
}

//set our vertical position
y += vspd;
