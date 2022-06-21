/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if hp <= 0 {
	if instance_exists(oLevelEnd) oLevelEnd.boss_defeated = true;
}
