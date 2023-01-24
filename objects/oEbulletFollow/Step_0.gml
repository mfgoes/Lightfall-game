event_inherited();
if (live_call()) return live_result;

if !instance_exists(oPlayer) {
	target = id;
}

if global.game_paused
{
	spd = 0;
	alarm[0] = 100;
} else spd = spd_saved; 


timer_init("follow_player");
timer_init("poof_trail");
timer_init("poof_trail_close");

#region projectile follows player
	if timer_get("follow_player") <= 0 {
		timer_set("follow_player",20);
		dir_new = point_direction(x,y,target.x,target.y);
		if dir = 0 dir = dir_new;
	}
	if timer_get("follow_player") = 1 && instance_exists(oPlayer) {
		//determine new directions
		if abs(target.x-x) > 10 x_new = sign(target.x-x)*pivot_spd;  //check if worth changing direction, then change direction
		dir_new = point_direction(x,y,target.x,target.y-10);
	}
	
	//lerp correct way. 
	if dir_new > 90 && dir_new < 270  
		dir = lerp(dir,dir_new,pivot_spd);
	else if dir_new > 90 && dir_new < 270
		dir = lerp(dir,-dir_new,pivot_spd);

	var x_new_main = lengthdir_x(spd,dir);
	var y_new_main = lengthdir_y(spd,dir + random_range(-15,15));  //spd * sign(target.y-y) * pivot_spd; 
	
	//double check for walls to avoid them on edges
	if collision_line(x,y,target.x,target.y+10,oWallParent,0,0) && distance_to_object(target) < TILE_SIZE*2 {
			//x+= x_new_main; // + x_new;
			if place_meeting(x+x_new_main,y,oWallParent) x+=0;
			y+= y_new_main; // + y_new;
			
			
	} else {
		x+= x_new_main; // + x_new;
		y+= y_new_main; // + y_new;
	}

		
#endregion

//particle effects
if timer_get("poof_trail") <= 1 {
	dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 0.4;
	timer_set("poof_trail",8+choose(1,4));
}

timer_init("collision_wall"); 
#region relative wall collision
	//enable wall collisions
	if timer_get("collision_wall") < 0 && collision_wall = false {
		timer_set("collision_wall",60);
	}
	if timer_get("collision_wall") = 1 {
		collision_wall = true;	
	}
#endregion
