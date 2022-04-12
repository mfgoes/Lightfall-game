/// @description Set boss_defeated to true; 
// Inherit the parent event
event_inherited();
if hp<= 0 &&  instance_exists(oLevelEnd) {
	oLevelEnd.boss_defeated = true;
}
