/// @desc spawn enemies
if global.game_paused
{
	exit;
}

//generate in gate zone 
{
	var xpos = random_range(x_pos1,x_pos2);	
	var xpos = (round(xpos/16) * 16); 
	//randomize();
}


if spawn_amount > 0 { //only spawn new guys if enemy is still alive. 
	var ypos = collision_line_first(xpos,0,xpos,room_height,oWall,0,0) //spawn on top of the ground
	dd = instance_create_depth(xpos,ypos.bbox_top,depth,oSpawnAnimation);
	dd.spawn_type = oDummyEnemy; //oEnemyRangedGeneric
	
	//make more enemies
	alarm[0] = round(spawn_timer+random(20));
	spawn_amount -=1;
}