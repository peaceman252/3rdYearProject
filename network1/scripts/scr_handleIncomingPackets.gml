var buffer = argument[0];
var socket = argument[1];
var msgId = buffer_read(buffer, buffer_u8);

switch (msgId)
{
    case 1://latency request
        var time = buffer_read(buffer, buffer_u32);
        buffer_seek(global.buffer, buffer_seek_start, 0);
        buffer_write(global.buffer, buffer_u8, 1);
        buffer_write(global.buffer, buffer_u32, time);
        //send back to player who sent this message
        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
    break;
    
    case 2://registration request
        var playerUsername = buffer_read(buffer, buffer_string);
        var passwordHash = buffer_read(buffer, buffer_string);
        var response = 0;
        
        //check if player already exists
        ini_open("users.ini");
        var playerExists = ini_read_string("users", playerUsername, "false");
        if (playerExists == "false")
        {
            //register a new player
            ini_write_string("users", playerUsername, passwordHash);
            response = 1;
            scr_showNotification("A new player has registered!");
        }
        ini_close();
        //send response to client
        buffer_seek(global.buffer, buffer_seek_start, 0);
        buffer_write(global.buffer, buffer_u8, 2);
        buffer_write(global.buffer, buffer_u32, response);
        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
    break;
    
    case 3://login request
        var pId = buffer_read(buffer, buffer_u32);
        var playerUsername = buffer_read(buffer, buffer_string);
        var passwordHash = buffer_read(buffer, buffer_string);
        var response = 0;
        
        //check if player exists
        ini_open("users.ini");
        var playerStoredPassword = ini_read_string("users", playerUsername, "false");
        if (playerStoredPassword != "false")
        {
            if (passwordHash == playerStoredPassword)
            {
                response = 1;
                
                with (obj_player)
                {
                    if (playerIdentifier == pId)
                    {
                        playerName = playerUsername;
                    }
                }
            }
        }
        ini_close();
        
        //send a response
        buffer_seek(global.buffer, buffer_seek_start, 0);
        buffer_write(global.buffer, buffer_u8, 3);
        buffer_write(global.buffer, buffer_u32, response);
        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
    break;
    
    case 6://player joining game
        var pId = buffer_read(buffer, buffer_u32);
        var pName = "";
        
        with (obj_player)
        {
            if (playerIdentifier == pId)
            {
                playerInGame = !playerInGame;
                pName = playerName;
            }
        }
        
        //tell other players about this change
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 6);
                buffer_write(global.buffer, buffer_u32, pId);
                buffer_write(global.buffer, buffer_string, pName);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
                }
        }
        
        //tell me about other players
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
           
            if (storedPlayerSocket != socket)
            {
                var player = noone;
                
                with (obj_player)
                {
                    if (self.playerSocket == storedPlayerSocket)
                    {
                        player = id;
                    }
                }
                
                if (player != noone)
                {
                    if (player.playerInGame)
                    {
                        buffer_seek(global.buffer, buffer_seek_start, 0);
                        buffer_write(global.buffer, buffer_u8, 6);
                        buffer_write(global.buffer, buffer_u32, player.playerIdentifier);
                        buffer_write(global.buffer, buffer_string, player.playerName);
                        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
                
                    }
                }
            }
        }
    break;
    
    case 7://player movment
         var pId = buffer_read(buffer, buffer_u32);
         var xx = buffer_read(buffer, buffer_f32);
         var yy = buffer_read(buffer, buffer_f32);
         var spriteNumber = buffer_read(buffer, buffer_u8);
         var imageIndex = buffer_read(buffer, buffer_u8);
         var dir = buffer_read(buffer, buffer_u8);
         
        //tell other players about this change
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 7);
                buffer_write(global.buffer, buffer_u32, pId);
                buffer_write(global.buffer, buffer_f32, xx);
                buffer_write(global.buffer, buffer_f32, yy);
                buffer_write(global.buffer, buffer_u8, spriteNumber);
                buffer_write(global.buffer, buffer_u8, imageIndex);
                buffer_write(global.buffer, buffer_u8, dir);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    /*case 8://chat
        var pId = buffer_read(buffer, buffer_u32);
        var text = buffer_read(buffer, buffer_string);
        
        //tell other players about this change
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 8);
                buffer_write(global.buffer, buffer_u32, pId);
                buffer_write(global.buffer, buffer_string, text);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        } 
    break;*/
    case 9://door
        var doorColour = buffer_read(buffer, buffer_u8);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 9);
                buffer_write(global.buffer, buffer_u8, doorColour);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    case 10://key
        var keyColour = buffer_read(buffer, buffer_u8);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 10);
                buffer_write(global.buffer, buffer_u8, keyColour);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    case 11://gate 1
        var openClose = buffer_read(buffer, buffer_u8);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 11);
                buffer_write(global.buffer, buffer_u8, openClose);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    case 12://gate 2
        var openClose2 = buffer_read(buffer, buffer_u8);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 12);
                buffer_write(global.buffer, buffer_u8, openClose2);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    case 13://gate 3
        var openClose3 = buffer_read(buffer, buffer_u8);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 13);
                buffer_write(global.buffer, buffer_u8, openClose3);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    /*case 14://moving platform
        var platformColour = buffer_read(buffer, buffer_u8);
        var xPosition = buffer_read(buffer, buffer_f32);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 14);
                buffer_write(global.buffer, buffer_u8, platformColour);
                buffer_write(global.buffer, buffer_f32, xPosition);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;
    
    case 15://moving platform
        var platformColour = buffer_read(buffer, buffer_u8);
        var yPosition = buffer_read(buffer, buffer_f32);
        
        for (var i = 0; i < ds_list_size(global.players); i++)
        {
            var storedPlayerSocket = ds_list_find_value(global.players, i);
            
            if (storedPlayerSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 15);
                buffer_write(global.buffer, buffer_u8, platformColour);
                buffer_write(global.buffer, buffer_f32, yPosition);
                network_send_packet(storedPlayerSocket, global.buffer, buffer_tell(global.buffer));
            }
        }
    break;*/
    
}
