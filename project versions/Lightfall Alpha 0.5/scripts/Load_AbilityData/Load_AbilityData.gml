///@description Load_AbilityData(character); 
///@param character = argument0;
//Dated version of ability loading (2020 v1.0)
function Load_AbilityData(argument0){
	CooldownData = [
	//Archer character
	[sWeaponBow_Placeholder,2, 60, 120, 30, //cooldown times
	oArrow, oAtk_Laser, oArrow_Triple, oAtk_Laser,  //each cooldown has a unique projectile
	0, 10, 15, 2],
	
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

