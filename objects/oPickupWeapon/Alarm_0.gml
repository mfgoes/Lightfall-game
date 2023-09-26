/// @description Initialize the startAmmo for the pickup based on global weapon data
if (instance_exists(oPlayerWeapon)) && startAmmo = -1 {
    var weapon_struct = global.weapon_list[current_weapon]; // Retrieve the weapon data for the current weapon from the global list   
    startAmmo = weapon_struct.startAmmo; // Update the startAmmo using the retrieved weapon data
}