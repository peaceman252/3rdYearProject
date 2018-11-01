//set sprite and sprite index
if (jumping || falling)
{
    sprite_index = spr_player_jump;
    image_speed = .35;
}

if (falling)
{
    sprite_index = spr_player_fall;
    image_speed = .15;
}

if (!jumping && !falling)
{
    switch (state)
    {
        case "standing":
            sprite_index = spr_player_stand;
            image_speed = 0.3;
        break;
        
        case "walking":
            sprite_index = spr_player_walk;
            image_speed = 0.75;
        break;
        
        case "running":
            sprite_index = spr_player_run;
            image_speed = 2;
        break;
        
        case "ducking":
            sprite_index = spr_player_duck;
            image_speed = 0.5;
        break;
    }
}

switch (dir)
{
    case "left":
        image_xscale = -1;
    break;
    
    case "right":
        image_xscale = 1;
    break;
}
