event_inherited(); 

if instance_exists(oPlayer) {
x = oPlayer.x;
y = oPlayer.y;

	if obj_Aura_Control.ambient_alpha >= 0.94 {
		y = -1000;
	}
}
else exit;