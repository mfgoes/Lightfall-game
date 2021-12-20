/// @description init
gate_active = false; //activate when player enters the arena
touched_gate = false; 
stack_num = 8; 

text_debug = "nul";


other_gate = instance_nearest_notme(x,y,oBattleGate); //old code. may detect incorrect gate. 
//connect proper gate in GateControl object. 

x_avg = round((x + other_gate.x) / 2)+sprite_width/2;
y_avg = round((y + other_gate.y) / 2);

//re-edit this later? 
if !place_meeting(x_avg,y_avg,oEnemyGateControl ) {
	spawner = instance_create_depth(x_avg,y_avg,depth,oEnemyGateControl );
	spawner.gate_left = self; 
	spawner.gate_right = other_gate;
	if other_gate = self with(spawner) instance_destroy();  //if no match, delete. 
}


