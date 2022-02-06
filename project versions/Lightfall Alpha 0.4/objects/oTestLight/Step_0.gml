/// @description Move light with player
event_inherited();
if instance_exists(oPlayer) {
light[| eLight.X] = oPlayer.x;
light[| eLight.Y] = oPlayer.y-10;
}
else {
	x = xprevious;
	y = yprevious; 
}
