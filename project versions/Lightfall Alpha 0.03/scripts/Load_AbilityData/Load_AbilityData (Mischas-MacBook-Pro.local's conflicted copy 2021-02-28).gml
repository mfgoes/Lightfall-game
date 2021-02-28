///@description Load_AbilityData(character);
///@param character = argument0;
function Load_AbilityData(argument0){
	/*
	--------- cooldown times
	0 = primary_weapon_image
	1 = time_primary_cooldown; 
	2 = time_secondary_cooldown; 
	3 = time_special_cooldown;
	4 = time_passive_cooldown;
	---------
	5 = primary_projectile
	6 = secondary_projectile
	7 = special_projectile
	8 = passive_projectile (if applicable)
	---------
	9 = [empty slot] 
	10 = weapon_speed_min (if using bow) 
	11 = weapon_speed_max;
	12 = weapon_accuracy;
	
	this script replaces "character_weapons" + migrates cooldown code from create event. 
	character_weapons = [sWeaponBow_Placeholder,0,10,3,2,oArrow, oAtk_Laser, oAtk_Laser] 
	
	//cooldowns
	roll_cooldown = 30; roll_cooldown_full = roll_cooldown; //1second. Replace with deltatime later. Replace with 'cooldown_ability1, etc. 
	primary_cooldown = 15; //aka firing delay
	secondary_cooldown = 35;
	third_cooldown = 60;
	current_weapon = 0; //0 = bow, 1 = regular
	*/
	
	CooldownData = [
	//Archer character
	[sWeaponBow_Placeholder,15, 60, 120, 30, //cooldown times
	oArrow, oAtk_Laser, oAtk_Special, oAtk_Laser,  //each cooldown has a unique projectile
	0, 3, 10, 2],
	
	//Char 2
	[sGun,15, 35, 60, 30, 
	oBullet_Parent, oAtk_Laser, oAtk_Laser, oAtk_Laser, 
	0, 3, 10, 2],
	
	//Char 3
	[sGun,15, 35, 60, 30, 
	oBullet_Parent, oAtk_Laser, oAtk_Laser, oAtk_Laser, 
	0, 3, 10, 2]	
	];
}

