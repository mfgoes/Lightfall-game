/// @description init
gate_active = false; //activate when player enters the arena
touched_gate = false; 
stack_num = 8; //height of walls being created 
other_gate = 0;
text_debug = "nul";
move_dir = 0; 

spawner = 0; //parent spawner

if instance_number(object_index) > 1 { //if not the only gate
	alarm[0] = 5;
}
