/// @desc spawn enemies 
var padding = 16; //cut from spawn region
var xpos = random_range(x_pos1+padding,x_pos2-padding);	
var xpos = (round(xpos/16) * 16); 
var ypos = collision_line_first(xpos,y,xpos,y+200,oWall,0,0).bbox_top //spawn on top of the ground

#region spawn enemies one by one
	spawn = grid_wave[# grid_x, grid_y];
	if spawn != 0 && grid_y < grid_y_max { //only spawn new guys if enemy is still alive. 
		dd = instance_create_depth(xpos,ypos,depth,oSpawnAnimation);
		dd.spawn_type = spawn;
		grid_y+=1;
		alarm[2] = 20;

		if instance_exists(oGame) {
		global.wavetotal++;
		}
		else exit; 
	}
	else exit;
#endregion