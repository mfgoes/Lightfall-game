/// @description changes the animation for player. 
function KillPlayer() {
	if instance_exists(oPlayerWeapon) with (oPlayerWeapon) instance_destroy();
	dd = instance_change(oPlayerDead,true);
	/*with (dd) {
		Load_CharacterData(0); //was: oPlayer.current_character
	}*/
	
	//fly in direction after getting killed
	direction = point_direction(other.x,other.y,x,y); 
	hsp = lengthdir_x(6,direction);
	vsp =lengthdir_y(4,direction)-2;
	if (sign(hsp) !=0) image_xscale = sign(hsp);

	global.kills -= global.killsthisroom;
	global.exp_points -= global.exp_points_thisroom;
}
