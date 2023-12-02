/// @description makes user go to the next room if all enemies are dead. 
image_speed = 0;
image_index = 0;

locked = true;
open_timer = 30; //how long to open the door
auto_open = false; //if true, don't require pressing open

nearby = false;
hover = 0; //to do: delete this if not used
depth = layer_get_depth("Player");
show_hint = false; //put on if player presses W or E. 
timer_counter = 0; 

//generate small light
if instance_exists(obj_Aura_Control) {
	instance_create_depth(x,y,depth,oLightSmall); 
}

//effects
glow_timer = 0; 
prevTextX = x; // Store the starting x position
prevTextY = y; // Store the starting y position
lerpFactor = 0; // Initialize lerp factor
transitionSpeed = 0.05; // Speed of the transition (adjust as needed)
previousNearby = nearby;  // Or false if you want to default to a specific state
