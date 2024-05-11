/// @desc setup damage here
damage = 1;
flash = 10; 
rot = 0; 
alarm[0] = 0; //disables all spikes. 
disabled = false; 

sprite_set_offset(sprite_index, sprite_get_width(sprite_index)/2, sprite_get_width(sprite_index)/2);


if instance_exists(oPlayer) {
	if depth < oPlayer.depth {
	depth = oPlayer.depth+100; 
	}
}
	