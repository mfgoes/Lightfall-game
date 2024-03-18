/// @desc setup damage here
damage = 1;
flash = 10; 
rot = 0; 
alarm[0] = 0; //disables all spikes. 
disabled = false; 

if instance_exists(oPlayer) {
	if depth < oPlayer.depth {
	depth = oPlayer.depth+100; 
	}
}
	