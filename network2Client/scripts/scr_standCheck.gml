//determine if we're standing
if ((!leftKey && !rightKey) || (leftKey && rightKey)) && (!jumping && !falling)
{
    if (duckKey)
    {
        state = "ducking";
    }
    else
    {
        state = "standing";
    }
    
    //let's slow down our movement when no keys are being pressed
    if (dir == "left")
    {
        if (hspd < 0)
        {
            hspd += fric;
        }
        else
        {
            hspd = 0;
        }
    }
    if (dir == "right")
    {
        if (hspd > 0)
        {
            hspd -= fric;
        }
        else
        {
            hspd = 0;
        }
    }
}
