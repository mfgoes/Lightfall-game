/// @description check connections
var target = instance_nearest_notme(x,y,oEnemySpawnerNew);
n_pos1 = target.x_pos1;
n_pos2 = target.x_pos2;

if x_pos2 = n_pos1 {
	shared_gate = true; //if sharing with one on the left
	//target.shared_gate = true; 	
	if target.x > x {
		shared_right = true;
		//target.shared_left = true;
		alarm[2] = 20;
	}
}

//with(target) instance_destroy(); 