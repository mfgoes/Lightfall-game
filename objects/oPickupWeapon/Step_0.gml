/// @description Handle pickup interactions, movement, and visual effects

// Exit if the game is paused
if global.game_paused { exit; }

// Movement & Physics
hsp *= 0.6;  // Horizontal friction
x += hsp;    // Update x position
VerticalCollision();  // Handle vertical collisions

// Player Proximity & Interaction
nearby = (distance_to_object(oPlayer) < TILE_SIZE && !instance_exists(oText));
if keyboard_check(ord("E")) && nearby 
{
    with (oPlayerWeapon) 
    {
        current_weapon = other.current_weapon; 
        var weapon_struct = global.weapon_list[oPlayerWeapon.current_weapon];
        show_debug_message("picked up a " + string(weapon_struct.weapon_name) + "!");
        
        // Display ammo toast
        dd = instance_create_depth(x, y-45, depth, oToastUI);
        dd.str = "+" + string(other.startAmmo); 
        dd.toast_type = variant.upgrade;
        ammo_basic = other.startAmmo;
    }
    
    // Create dust upon destruction
    repeat(5) 
    {
        var dd = instance_create_depth(x + random_range(-sprite_width/2.5, sprite_width/2.5), y - random_range(0, sprite_height/4), depth + 1, oDust);
        dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 0.5; dd.image_speed = 1.5; dd.life = 30;
        if random(1) < 0.4 { dd.col_start = c_yellow; }
    }
    
    // Play sounds & destroy
    audio_play_sound(snd_button2, 2, 0, 0.5);
    audio_play_sound(snClick, 3, 0, 0.24);
    instance_destroy();
}

// Visual Effects
wobble_effect(); // Apply wobble effect when touched
