var buffer = argument[0];
var msgId = buffer_read(buffer, buffer_u8);

switch(msgId)
{
    case 1://latency request
        var time = buffer_read(buffer, buffer_u32);
        latency = current_time - time;
    break;
    
    case 2://registration request
        var response = buffer_read(buffer, buffer_u8);
        
        switch(response)
        {
            case 0://failure
                scr_showNotification("Registration failed! Username already exists!");
            break;
            case 1: //success
                room_goto(rm_mainMenu);
            break;
        
        }
    break;
    
    case 3://login request
        var response = buffer_read(buffer, buffer_u8);
        
        switch(response)
        {
            case 0://failure
                scr_showNotification("Login failed! Username doesn't exists or password is incorrect!");
            break;
            case 1: //success
                room_goto(rm_mainMenu);
            break;
        
        }
    break;
    
    case 4://get id
        global.playerId = buffer_read(buffer, buffer_u32);
        scr_showNotification("Our playerId has been recieved!");
    break;
    
    case 5://other player id
        global.pId = buffer_read(buffer, buffer_u32);
        with (obj_remoteplayer)
        {
            if (remotePlayerId == global.pId)
            {
                instance_destroy();
            }
        }
    break;
    
    case 6://other players name + id
        var pId = buffer_read(buffer, buffer_u32);
        var pName = buffer_read(buffer, buffer_string);
        
        var instance = noone;
        
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                instance = id;
            }
        }
        
        if (instance == noone)
        {
            //only if we're in the gameworld
            if (instance_exists(obj_localplayer))
            {
                //create a remote player
                var remotePlayer = instance_create(room_width/2, room_height/2, obj_remoteplayer);
                remotePlayer.remotePlayerId = pId;
                remotePlayer.remotePlayerName = pName;
            }
        }
        else
        {
            with (instance)
            {
                instance_destroy();
            }
        }
    break;
    
    case 7://other player positions
        var pId = buffer_read(buffer, buffer_u32);
        var xx = buffer_read(buffer, buffer_f32);
        var yy = buffer_read(buffer, buffer_f32);
        var spriteNumber = buffer_read(buffer, buffer_u8);
        var imageIndex = buffer_read(buffer, buffer_u8);
        var d = buffer_read(buffer, buffer_u8);
        
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                x = xx;
                y = yy;
                switch (spriteNumber)
                {
                    case 1:
                        sprite_index = spr_player_stand;
                    break;
                    
                    case 2:
                        sprite_index = spr_player_jump;
                    break;
                    
                    case 3:
                        sprite_index = spr_player_duck;
                    break;
                    
                    case 4:
                        sprite_index = spr_player_walk;
                    break;
                    
                    case 5:
                        sprite_index = spr_player_run;
                    break;
                }
                
                image_index = imageIndex;
                
                switch (d)
                {
                    case 1:
                        image_xscale = -1;
                    break;
                    
                    case 2:
                        image_xscale = 1;
                    break;
                }
            }
        }
    break;
    
    /*case 8://chat
        var pId = buffer_read(buffer, buffer_u32);
        var text = buffer_read(buffer, buffer_string);
        
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                //create chat object to follow this player
                var chat = instance_create(x, y, obj_chat);
                chat.text = text;
                chat.owner = id;
            }
        }
    break;*/
    
    case 9://doors
        var doorColour = buffer_read(buffer, buffer_u8);
        
        with (obj_locked)
        {
            switch(doorColour)
            {
                case 1://green
                    if (col == c_green){
                        instance_destroy();
                    }
                break;
            
                case 2://blue
                    if (col == c_blue){
                        instance_destroy();
                    }
                break;
            
                case 3://red
                    if (col == c_red){
                        instance_destroy();
                    }
                break;
            
                case 4://purple
                    if (col == c_purple){
                        instance_destroy();
                    }
                break;
            }
        }
    break;
    
    case 10://keys
        var keyColour = buffer_read(buffer, buffer_u8);
        
        with (obj_key)
        {
            switch(keyColour)
            {
                case 1://green
                    if (col == c_green){
                        instance_destroy();
                    }
                break;
            
                case 2://blue
                    if (col == c_blue){
                        instance_destroy();
                    }
                break;
            
                case 3://red
                    if (col == c_red){
                        instance_destroy();
                    }
                break;
            
                case 4://purple
                    if (col == c_purple){
                        instance_destroy();
                    }
                break;
            }
        }
    break;
    
    case 11://gate
        var openClose = buffer_read(buffer, buffer_u8);
        with (obj_gate1)
        {
            switch(openClose)
            {
                case 1:
                    global.gate1Open = true;
                break;
            
                case 2:
                    global.gate1Open = false;
                break;
            }
        }
    break;
    
    case 12://gate
       var openClose2 = buffer_read(buffer, buffer_u8);
        with (obj_gate2)
        {
            switch(openClose2)
            {
                case 1:
                    global.gate2Open = true;
                break;
            
                case 2:
                    global.gate2Open = false;
                break;
            }
        }
    break;
    
    case 13://gate
        var openClose3 = buffer_read(buffer, buffer_u8);
        with (obj_gate3)
        {
            switch(openClose3)
            {
                case 1:
                    global.gate3Open = true;
                break;
            
                case 2:
                    global.gate3Open = false;
                break;
            }
        }
    break;
    
    /*case 14://moving platform
        var platformColour = buffer_read(buffer, buffer_u8);
        var xPosition = buffer_read(buffer, buffer_f32);
        
        with (obj_platform)
        {
            switch (platformColour)
            {
                case 1://green
                    if (col == c_green){
                        xPosition += (cos(angle) * angleMultiplier);
                        x = xPosition;
                    }
                break;
            
                case 2://blue
                  if (col == c_blue){
                        xPosition += (cos(angle) * angleMultiplier);
                        x = xPosition;
                  }
                break;
            }  
        }
    break;*/
    
    /*case 15://vertical moving platform
        var platformColour = buffer_read(buffer, buffer_u8);
        var yPosition = buffer_read(buffer, buffer_f32);
        
        with (obj_platformV)
        {
            switch (platformColour)
            {
                case 1://green
                    if (col == c_green){
                        //yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                    }
                break;
            
                case 2://blue
                  if (col == c_blue){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                  }
                break;
                
                case 3://red
                    if (col == c_red){
                        //yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                    }
                break;
            
                case 4://purple
                  if (col == c_purple){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                  }
                break;
                
                case 5://aqua
                    if (col == c_aqua){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                    }
                break;
            
                case 6://black
                  if (col == c_black){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                  }
                break;
                
                case 7://dark grey
                    if (col == c_dkgray){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;;
                    }
                break;
            
                case 8://fuchisa
                  if (col == c_fuchsia){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;;
                  }
                break;
                
                case 9://grey
                    if (col == c_gray){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                    }
                break;
            
                case 10://lime
                  if (col == c_lime){
                        //yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;;
                  }
                break;
                
                case 11://light grey
                    if (col == c_ltgray){
                        //yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                    }
                break;
            
                case 12://maroon
                  if (col == c_maroon){
                        //yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                  }
                break;
                
                case 13://navy
                  if (col == c_navy){
                       // yPosition += sin(angle) * angleMultiplier;
                        y = yPosition;
                  }
                break;
            }  
        }
    break;*/
}
