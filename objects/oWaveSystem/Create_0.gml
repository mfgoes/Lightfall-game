function enemy_wave() constructor {
    // struct members
    positions = array_create(argument_count); //choose from spawn points
    enemies = array_create(argument_count);   //choose from object types
    count = argument_count;					  //how many arguments = how many spawns per wave
    
    // set array values
    for (var i = 0; i < argument_count; i++) {
        var current_enemy = argument[i];
        pos[i] = current_enemy[0];
        enemy[i] = current_enemy[1];
    }    
	pos_checks=i
}

#macro wave_create new enemy_wave // this is just to make it easier to write
room_cleared=false
current_wave=0
current_wave_check=-1
waves = ds_list_create()
if disabled = false switch(room) {
	case(rTestHTML2):
		ds_list_add(waves,
			wave_create([1,oEnemyMelee])
			,
			wave_create([2,oEnemyMelee]),
			wave_create([0,oEnemyMelee],[1,oEnemy_Mage],[2,oEnemy_Boss])
		)
	break;
	
	case(rLevel1):
		ds_list_add(waves,
			wave_create([2,oEnemyChonkyDasher],[1,oEnemy_Mage],[2,oEnemyChonkyDasher]),
			wave_create([0,oRockBug],[1,oEnemyMelee]),
			wave_create([2,oEnemyMelee]),
			wave_create([0,oEnemy_Mage],[1,oEnemy_Mage],[2,oEnemyMelee])
		)
	break;
	case(rLevel2):
		ds_list_add(waves,
			wave_create([2,oEnemy_Bat_Modified],[1,oEnemy_Bat_Modified],[2,oEnemy_Bat_Modified]),
			wave_create([0,oRockBug],[1,oEnemyMelee]),
			wave_create([2,oEnemyMelee]),
			wave_create([0,oEnemy_Mage],[1,oEnemy_Mage],[2,oEnemyMelee])
		)
	break;
	case(rLevel3):
		ds_list_add(waves,
			wave_create([0,oEnemy_Boss]),
		)
	break;
}