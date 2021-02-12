/// @description
//gm live
if global.game_paused
{
	exit;
}

if (live_call()) return live_result; 
timer_init("attack_length");
if timer_get("attack_length") = -1 timer_set("attack_length",sprite_get_number(oPlayer.sprite_index)+10); //duration of attack = animation length
if timer_get("attack_length") = 0 or !(instance_exists(oPlayer)){
	instance_destroy();  
}
	
image_angle = direction;

// collision code new
if (place_meeting(x,y,pShootable)) //Make sure at least 1 object is colliding
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
	scrFreezeScreen(100); 
	
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
	instance_destroy();
	//play enemy sound
}	

		

	

