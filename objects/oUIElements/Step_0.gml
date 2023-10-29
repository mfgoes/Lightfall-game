/// @description reset cooldowns
//optimize per click later
if instance_exists(oPlayerWeapon) {
if reload_time < reload_time_max reload_time++;
if secondary_cooldown < secondary_cooldown_max secondary_cooldown ++;
if third_cooldown < third_cooldown_max third_cooldown ++;
if roll_cooldown < roll_cooldown_full roll_cooldown ++;
}


//adjust cursor scale when shooting
with(oPlayer) if (key_primary || key_secondary || key_special) {
	other.cursor_scale = 1.5;
}
if cursor_scale > 1 cursor_scale-=0.25;