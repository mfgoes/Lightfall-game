draw_self();
if boss_defeated = true {
	glow_alpha -= 0.01*glow_direction;
	if glow_alpha = 0.6 or glow_alpha = 0.1 { //opacity range
		glow_direction = -glow_direction;
	}
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sPortalGlow,0,x,y,2,1,0,c_blue,glow_alpha);
	gpu_set_blendmode(bm_normal);
}
