/// @description Insert description here
// You can write your code in this editor

if (instance_exists(oPlayerWeapon)) && startAmmo = -1 {
	var weapon_struct = global.weapon_list[current_weapon];
	startAmmo = weapon_struct.startAmmo;
}