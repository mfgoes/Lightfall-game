/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//scr_initialize_enemy(); 
event_inherited(); 

// Spawning from wave specific logic
spawn_from_wave = false;
// Set the tint color to a shade of brown
// Randomize the color components for a brown tint
var r = irandom_range(100, 240); // Higher red component
var g = irandom_range(50, 150);  // Moderate green component
var b = irandom_range(25, 60);   // Lower blue component

// Set the tint color to the randomized brown
color_add = make_color_rgb(r, g, b);

hp = choose(1,1,1,2); 
damage = 0.5;
walk_spd = choose(0.5,0.6,0.8,1); 
approach_spd = walk_spd;
leap_str = choose(1,2,3); 

//unique visuals
spriteIdle =	sprite_index;
spriteWalk =	sprite_index;
spriteJump =	sprite_index;
spriteDie  =	sprite_index;
spriteAttack =	sprite_index;
spriteMelee  =	sprite_index;
spriteHit	 =  sprite_index;	
mask_index	 =	sprite_index;