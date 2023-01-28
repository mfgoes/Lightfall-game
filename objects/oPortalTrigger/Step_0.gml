/// @description check if can open

if instance_exists(oWaveSystem) {
	if ds_list_size(oWaveSystem.waves)<oWaveSystem.current_wave && !instance_exists(oEnemyParent){ 
		//show text: level cleared!
		other.image_index = 1;
		other.locked = false; 
		}
}

