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
		with (instance_create_layer(x,y,"Bullets",oAtk_Melee)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			direction = oWeaponPlayer.image_angle; //oPlayer.facing_direction;
			x_shift = 5;
			image_angle = direction; follow = oPlayer;
			//x_shift = oWeaponPlayer.flip_weapon * 10;
		}
	if timer_get("generate attack") = -1 {
		//gunkickx = lengthdir_x(-2,oWeaponPlayer.image_angle-180);
		timer_set("generate attack",3);
		
		
		}
	}
	else gunkickx = 0;
}

