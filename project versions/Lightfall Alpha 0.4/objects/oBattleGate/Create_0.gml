/// @description init
gate_active = false; //activate when player enters the arena
touched_gate = false; 

//search for nearest object
xx = x;
x -= 10000;
other_gate = instance_nearest(xx, y, object_index);
x += 10000;

stack_num = 4; 