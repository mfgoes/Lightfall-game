/// @desc generate walls
if instance_number(object_index) > 1 {
	if touched_gate = true {
		if stack_num > 0 {
			//vary X pos
			instance_create_depth(x,y+sprite_height-(stack_num*sprite_height),depth,oBattleGateWall);	
			stack_num--; 
			gate_active = true;
		}
	}
	if touched_gate = true && gate_active = false { //if you defeat the enemies
		with(collision_line(x,y,x,y+sprite_height-200,oBattleGateWall,0,0)) {
			instance_destroy();
		}
	
	}
}