/// @description reset cooldowns
//optimize per click later
if instance_exists(oPlayerWeapon) {
if primary_cooldown < primary_cooldown_max primary_cooldown++;
if secondary_cooldown < secondary_cooldown_max secondary_cooldown ++;
if third_cooldown < third_cooldown_max third_cooldown ++;
if roll_cooldown < roll_cooldown_max roll_cooldown ++;
}