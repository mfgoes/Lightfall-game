/// @description destroy self
if (hp <= 0) {
	
	audio_sound_gain(snDeath,0.4,0);
	audio_play_sound(snDeath,1,0);
	
	//create dust particles
	repeat(3) {	
		//dust particles
		with(instance_create_layer(x,bbox_bottom-6,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-1,1);
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		
		//create exp
		/*with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oOrb_Mana)) //create exp orb
		//pick up orbs should 'drop' on the floor for a bit before going to the player. Currently they're a bit distracting. 
		{
			hsp = random_range(-3,3);
		}
		*/
	}
	
	if (instance_exists(oPlayer)) {
		global.kills++;	//do we still need these? 
		global.killsthisroom++;
		global.killsthiswave++;
		//global.wavetotal--;
		with(oGame)
			killtextscale = 1.2;
	}
	
	//create dead sprite
	dd = instance_create_depth(x,y+5,depth,oDeadEnemySink);
	dd.sprite_index = spriteDie;
	dd.image_xscale = image_xscale;
	instance_destroy();
	if spawned = true global.enemies_spawned -=1; 
}

//set target
if instance_exists(oPlayer)
	target = oPlayer;
else {
	hsp = 0;
	target = id; 
}
