/// @description makes user go to the next room if all enemies are dead. 
image_speed = 0;
image_index = 0;

locked = true;
open_timer = 30; //how long to open the door
auto_open = false; //if true, don't require pressing open

nearby = false;
hover = 0;
depth = layer_get_depth("Player");
show_hint = false; //put on if player presses W or E. 
timer_counter = 0; 

//generate small light
if instance_exists(obj_Aura_Control) {
	instance_create_depth(x,y,depth,oLightSmall); 
}