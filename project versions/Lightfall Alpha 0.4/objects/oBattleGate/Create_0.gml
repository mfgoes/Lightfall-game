/// @description init
gate_active = false; //activate when player enters the arena
touched_gate = false; 
stack_num = 8; 

other_gate = instance_nearest_notme(x,y,oBattleGate); //rename other to "neighbour" 

x_avg = round((x + other_gate.x) / 2)+sprite_width/2;
y_avg = round((y + other_gate.y) / 2);

//use ID + coordinates to connect gates
if !place_meeting(x_avg,y_avg,oEnemySpawnerNew) {
	spawner = instance_create_depth(x_avg,y_avg,depth,oEnemySpawnerNew);
	spawner.gate_left = self; 
	spawner.gate_right = other_gate;
	if other_gate = self with(spawner) instance_destroy();  //if no match, delete. 
}


