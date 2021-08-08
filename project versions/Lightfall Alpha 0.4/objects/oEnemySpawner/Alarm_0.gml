/// @description spawn enemy
if global.game_paused
{
	exit;
}

if spawn_amount > 0 {
	randomize();
	var xpos = random_range(-120,120); //variation for where to spawn enemies
	var xpos = (round(xpos/32) * 32); 
	var closest_wall = collision_line_first(x+xpos,0,x+xpos,room_height,oParPlatform,0,0) //improve this later to create objects in closer proximity
	if closest_wall !=noone {
		dd = instance_create_depth(x+xpos,closest_wall.bbox_top,depth,oSpawnAnimation);
		dd.spawn_type = spawn_type;
	}
	else { //if no platforms nearby, check for normal walls 
		var closest_wall = collision_line_first(x+xpos,0,x+xpos,room_height,oWall,0,0) //improve this later to create objects in closer proximity
		if closest_wall !=noone {
			dd = instance_create_depth(x+xpos,closest_wall.bbox_top,depth,oSpawnAnimation);
			dd.spawn_type = spawn_type;
		}	
		else instance_create_depth(x,y,depth,oSpawnAnimation);
	}
	
	alarm[0] = round(spawn_timer+random(40));
	spawn_amount -=1;
}

/*old code
/// @description spawn enemy
if spawn_amount > 0 {
	randomize();
	var xpos = random_range(-120,120); //variation for where to spawn enemies
	var xpos = (round(xpos/32) * 32); 
	var closest_wall = collision_line_first(x+xpos,0,x+xpos,room_height,oWall,0,0) //improve this later to create objects in closer proximity
	if closest_wall !=noone {
		dd = instance_create_depth(x+xpos,closest_wall.bbox_top,depth,oSpawnAnimation);
		dd.spawn_type = oEnemyRangedGeneric;
	}
	else instance_create_depth(x,y,depth,oSpawnAnimation);
	//transfer over other attributes later. 
	alarm[0] = spawn_timer;
	spawn_amount -=1;
}
*/
