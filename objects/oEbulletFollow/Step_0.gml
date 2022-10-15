event_inherited();

if !instance_exists(oPlayer) {
	target = id;
}

timer_init("follow_player");
timer_init("poof_trail");
timer_init("poof_trail_close");
var pivot1 = 0.3; 
var pivot = 2; //in pixels
var x_new_main =  sign(target.x-x);
var y_new_main =  sign(target.y-y) * pivot1; 

//change animation 
image_xscale = sign(target.x-x); 


#region projectile follows player
	if timer_get("follow_player") <= 0 {
		timer_set("follow_player",20);
	}
	if timer_get("follow_player") = 1 && instance_exists(oPlayer) {
		//determine new directions
		if abs(target.x-x) > 10 x_new = sign(target.x-x)*pivot1;  //check if worth changing direction, then change direction
		y_new = sign(target.y-y)*0.75;
		
		}
	
	x+= x_new_main + x_new;
	y+= y_new_main + y_new;
	
	//double check for walls
	if collision_line(x,y,target.x,target.y,oWallParent,0,0) or place_meeting(x+sign(x_new)*5,y,oWallParent) {
			if target.y < y y-=1;
	}

		
#endregion

//particle effects
if timer_get("poof_trail") <= 1 {
	dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 0.4;
	timer_set("poof_trail",8+choose(1,4));
}
