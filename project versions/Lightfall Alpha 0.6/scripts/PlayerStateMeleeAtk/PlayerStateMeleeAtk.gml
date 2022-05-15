// Each unique ability could have its own script (to simlify coding). Consider reusability in the future. 
function PlayerStateMeleeAtk(){
	timer_init("generate attack")
	sprite_index = spriteMelee; 
	image_speed = 1;
	//hsp = 0;
	var slowwalk = 0; 
	var move = key_right - key_left;
	hsp = (move * slowwalk) + gunkickx;
	vsp = (vsp + grv);
	using_ability = 1;
	//create projectile
	if image_index = 1
	{
		audio_sound_gain(snDartGun2,0.1,0);
			audio_sound_pitch(snDartGun2,choose(0.95,1));
			audio_play_sound(snDartGun2,2,0);
			
			
		with (instance_create_layer(x,y,"Bullets",oAtk_Laser)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			direction = oPlayerWeapon.image_angle; //oPlayer.facing_direction;
			x_shift = 5;
			image_angle = direction; follow = oPlayer;
			//x_shift = oPlayerWeapon.flip_weapon * 10;
		}
	if timer_get("generate attack") = -1 {
		//gunkickx = lengthdir_x(-2,oPlayerWeapon.image_angle-180);
		timer_set("generate attack",3);
		}
	}
	else gunkickx = 0;
}

