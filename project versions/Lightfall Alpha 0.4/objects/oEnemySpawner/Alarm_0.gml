/// @description spawn enemy
if global.game_paused
{
	exit;
}


if x_pos1 = 0 //generate randomly close to player (move this later)
{
	var xpos = x + random_range(-120,120); //variation for where to spawn enemies
	var xpos = (round(xpos/32) * 32); 
}
else //generate in gate zone 
{
	var xpos = random_range(x_pos1,x_pos2);	
	var xpos = (round(xpos/16) * 16); 
}


if spawn_amount > 0 && oLevelEnd.boss_defeated = false { //only spawn new guys if enemy is still alive. 
	randomize();
	
	var closest_wall = collision_line_first(xpos,0,x+xpos,room_height,oParPlatform,0,0) //improve this later to create objects in closer proximity
	if closest_wall !=noone {
		dd = instance_create_depth(xpos,closest_wall.bbox_top,depth,oSpawnAnimation);
		dd.spawn_type = spawn_type;
	}
	else { //if no platforms nearby, check for normal walls 
		var closest_wall = collision_line_first(xpos,0,x+xpos,room_height,oWall,0,0) //improve this later to create objects in closer proximity
		if closest_wall !=noone {
			dd = instance_create_depth(xpos,closest_wall.bbox_top,depth,oSpawnAnimation);
			dd.spawn_type = spawn_type;
		}	
		else instance_create_depth(x,y,depth,oSpawnAnimation);
	}
	
	alarm[0] = round(spawn_timer+random(40));
	spawn_amount -=1;
}