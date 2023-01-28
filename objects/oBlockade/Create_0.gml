/// @description auto destroy if there are no wave spawners
if !instance_exists(oWaveSystem) 
	instance_destroy(); 

wave_unlock = 0; //determines when it will be destroyed. 
color = c_white; //can be used to differentiate blockades
//ie to expand levels throughout a battle. 