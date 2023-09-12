/// @description Insert description here
// You can write your code in this editor

if (instance_exists(oPlayerWeapon)) {
	var weapon_struct = global.weapon_list[current_weapon];
	startAmmo = weapon_struct.startAmmo;
}