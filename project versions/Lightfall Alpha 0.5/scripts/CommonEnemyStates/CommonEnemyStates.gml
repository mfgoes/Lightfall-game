
// Patrol the vicinity and jump over walls when required. 
function scr_state_patrol(){
	var dist_start = round(distance_to_point(patrol_xstart,patrol_ystart));
	if  dist_start > wander_range {
		patrol_dir*=-1; //this currently glitches sometimes
		x+=patrol_dir*4;
	}
	//check tiles down
	var check_tile2 = (collision_point(x + patrol_dir*TILE_SIZE,y+TILE_SIZE*2, oWall,0,0)); //check 2 tiles down
	var check_tile1 = (collision_point(x + patrol_dir*TILE_SIZE,y+TILE_SIZE, oWall,0,0)); //check existing tile
	if !((check_tile1) or (check_tile2)) {
		patrol_dir*= -1;
	}
	if place_meeting(x + hsp, y, oWall)  {
		//check if you can jump up a tile first
		if !collision_point(x + patrol_dir,y-TILE_SIZE-1, oWall,0,0) {  //check tiles up
			y-=TILE_SIZE; //"Jump" up (improve later)
			hsp = walk_spd*patrol_dir;
		}
		if collision_point(x + patrol_dir,y+TILE_SIZE, oWall,0,0) {  //check tiles down
			hsp = walk_spd*patrol_dir;
		}
		x+=patrol_dir*4;
	}
	hsp = walk_spd * patrol_dir;
	x+= hsp;
}
	
//Approach the player
function scr_state_approach(){
	var dir = sign(target.x - x); 
	if !place_meeting(x + dir*approach_spd, y,oWall) {
		hsp = dir*approach_spd; }
	else {
		hsp = 0;}
		
	if place_meeting(x + dir*approach_spd, y, oWall)  {
		if !collision_point(x + dir,y-TILE_SIZE-1, oWall,0,0) {  //check if 2 tiles up is free
			y-=TILE_SIZE; //"Jump" up (improve later)
			hsp = dir*approach_spd;
			//x+=hsp;
		}		
	}		
	if (grounded) {
		x += hsp; //grounded check prevents clipping
		//reset patrol position
		patrol_xstart = x; 
		patrol_ystart = y;  
	}
}
	
//Attack the player (close ranged) 
function scr_state_atk_melee(){
if timer_get("attack_reload") <=0 && flash = 0 { 
	//set attack timer	// && timer_get("attack_prepare") = 1
	timer_set("attack_reload",reload_spd);
	timer_set("anim_prep",reload_spd-5);
	reload_spd = reload_spd_start + irandom(15); 
	atk_anim_x = 5; //start animated
	timer_set("anim_retract",0); //reset retract animation
			
	with(oPlayer) {
		hp-=other.damage;
		flash = 3;
		gunkickx -= sign(other.x - x)*2; //from pos enemy to pos player
		ScreenShake(3,2);
		if hp < 1 KillPlayer();
		//play sound
		audio_sound_gain(snHitEnemy,0.2,0);
		if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
	}
}
}