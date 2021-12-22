if glow_alpha = 0.35 or glow_alpha = 0.1 { //opacity range
	glow_direction = -glow_direction;
	}
glow_alpha -= 0.002*glow_direction;
gpu_set_blendmode(bm_add);
draw_sprite_ext(sPortalGlow,0,x,y,0.8,1,0,c_white,glow_alpha);
gpu_set_blendmode(bm_normal);
draw_self();
