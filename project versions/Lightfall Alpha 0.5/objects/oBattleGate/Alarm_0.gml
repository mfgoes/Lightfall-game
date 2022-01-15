/// @desc create gate controller

// detect closest gate
other_gate = instance_nearest_notme(x,y,oBattleGate);
var x_avg = round((x + other_gate.x) / 2)+sprite_width/2;
var y_avg = round((y + other_gate.y) / 2)-TILE_SIZE*4; //play with this later

// create controller
if !place_meeting(x_avg,y_avg,oEnemyGateControl ) {
	var spawner = instance_create_depth(x_avg,y_avg,depth,oEnemyGateControl );
	spawner.gate_left = self; 
	spawner.gate_right = other_gate;
	if other_gate = self with(spawner) instance_destroy();  //if no match, delete. 
}


