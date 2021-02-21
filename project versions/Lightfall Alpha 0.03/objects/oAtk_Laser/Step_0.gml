/// @description
//gm live
if global.game_paused
{
	exit;
}

if (live_call()) return live_result; 
timer_init("attack_length");
timer_init("animation_length"); 

if timer_get("animation_length") = -1 {
	timer_set("animation_length",30); //length of animation
	timer_set("attack_length",3);
}

//destroy instance
if timer_get("animation_length") = 0 or !(instance_exists(oPlayer)){
	instance_destroy();  
}
	
image_angle = direction;

// collision code new
if (place_meeting(x,y,pShootable)) && timer_get("attack_length") > 0  //Make sure at least 1 object is colliding
{
	var _list = ds_list_create();
	var _num = collision_rectangle_list(bbox_left,bbox_top, bbox_right,bbox_bottom, pShootable, false, true, _list, false);
	if _num > 0
	    {
	    for (var i = 0; i < _num; ++i;) {
			with (_list[| i])
		    {
		    hp-=1; //does 1 damage
			flash = 3;
			
			//set recoil
			stunned = 20; //round(random_range(20,40));
			ScreenShake(3,5);
			}
		}
	    }
	if (place_meeting(x,y,oEnemyParent)) {
		audio_sound_gain(snHitEnemy,0.2,0);
		if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,5,0); }
	
	//freeze frame
	scrFreezeScreen(10); 
	
	//generate particles
	repeat(3) {
		with(instance_create_layer(x+lengthdir_x(4,direction),y,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-2,2)
			image_xscale = choose (1.3,-1.3);
			image_yscale = choose (1,-1);
		}
	}
		
	ds_list_destroy(_list);	

	//set position
	x = follow.x+lengthdir_x(x_shift,direction);
	y = follow.y+3;
}	
		
// animation
if img_index < 4 {
	img_index+=0.5; //image speed
}
	

