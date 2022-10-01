/// @description gravity and death
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if hp <= 0 {	//be more dramatic here
	if instance_exists(oLevelEnd) oLevelEnd.boss_defeated = true;
	ScreenShake(4,50);
}
