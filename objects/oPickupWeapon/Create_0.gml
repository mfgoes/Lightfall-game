/// @description Initialize pickup variables

/*
Weapon types
0 = Bow (no longer available. to do: replace)
1 = Fast Gun
2 = Heavy Gun
3 = Explosive Gun
4 = Bazooka
*/

// Weapon-related properties
startAmmo = 10;       // Ammo count at first spawn 

// Timers and countdowns
alarm[0] = 10;

// Movement properties
hsp = random_range(1,-2);  // Horizontal speed
vsp = random_range(-3,-5); // Vertical speed

// Player interaction properties
nearby = false;      // Check if player is in proximity
flash = 4;           // Flashing frequency or intensity (not clear without more context)
adjusted = false;    // Indicates if position has been adjusted

// Visual effects
xVar = 0;            // Horizontal wobble variable
yVar = 0;            // Vertical wobble variable
xDist = 0;           // Distance from the player on the X-axis
image_speed = 0;     // Sprite animation speed
depth += 50;         // Ensure the object renders behind the player
wobble_triggered = false;  // Flag to track if the wobble effect has started
hover_timer = 0; 

//instance_create_depth(x,y,depth+10,)