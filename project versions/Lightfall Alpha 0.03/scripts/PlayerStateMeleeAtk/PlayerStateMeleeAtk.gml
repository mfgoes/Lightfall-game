// Each unique ability could have its own script (to simlify coding). Consider reusability in the future. 
function PlayerStateMeleeAtk(){
	timer_init("generate attack")
	sprite_index = spriteMelee; 
	image_speed = 1;
	hsp = 0;
	vsp = (vsp + grv);
	using_ability = 1;
	//create projectile
	if image_index = 2 {
		with (instance_create_layer(x,y,"Bullets",secondary_projectile)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			direction = oPlayer.facing_direction;
			image_angle = direction; follow = oPlayer;
			x_shift = oWeaponPlayer.flip_weapon * 10;
		}
	timer_set("generate attack",5);
	}
	if timer_get("generate attack") = 0 {hsp = gunkickx; gunkickx = 0;}
	
	
	
}

