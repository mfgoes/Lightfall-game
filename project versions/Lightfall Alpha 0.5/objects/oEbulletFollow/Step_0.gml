event_inherited();

if (live_call()) return live_result;

timer_init("follow_player");
timer_init("poof_trail");
timer_init("poof_trail_close");

#region projectile follows player
	if timer_get("follow_player") <= 0 {
		timer_set("follow_player",20);
	}
	if timer_get("follow_player") = 1 && instance_exists(oPlayer) {
		//lerp direction and new direction
		dir_new = (point_direction(x,y,oPlayer.x, oPlayer.y-5)) 
		//direction = dir_new; 
	}	
	direction = lerp(direction,dir_new,0.3); 
#endregion

//particle effects
if timer_get("poof_trail") <= 1 {
	dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 0.4;
	timer_set("poof_trail",8+choose(1,4));
}
