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

global.enemies_spawned = 0;

#macro wave_create new enemy_wave // this is just to make it easier to write
room_cleared = false
current_wave = 0
current_wave_check = -1
waves = ds_list_create()
if disabled = false switch(room) {
		
	case(rLevel1):	//1,2,3
		ds_list_add(waves,
			wave_create([2,oEnemyMage],[1,oEnemyMelee]),
		)
	break;
	
	case(rLevel2):
		ds_list_add(waves,
			wave_create([2,oEnemyCrow],[1,oEnemyCrow],[1,oEnemyBat]),
			wave_create([2,oEnemyRockBug],[0,oEnemyRockBug]),
		)
	break;
	case(rLevel3):
		ds_list_add(waves,
			wave_create([2,oEnemyCrow],[1,oEnemyMage],[1,oEnemyBat ]),
			wave_create([0,oEnemyMage],[3,oEnemyMage],[3,oEnemyMage]),
			wave_create([5,oEnemyMage],[4,oEnemyBat]),
			
		)
	break;
	
	case(rLevel4):
		ds_list_add(waves,
			wave_create([0,oGoliathBoss]),
		)
	break;
	
	//level 5 = boss level
	
}