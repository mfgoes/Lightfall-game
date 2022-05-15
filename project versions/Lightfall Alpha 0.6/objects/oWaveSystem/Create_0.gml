function wc() constructor {
	var cur;
	for(var i = 0; i < argument_count; i++) {
		cur=argument[i]
		pos[i]=cur[0]
		enemy[i]=cur[1]
	}
	pos_checks=i
}
#macro wave_create new wc // this is just to make it easier to write
room_cleared=false
current_wave=0
current_wave_check=-1
waves = ds_list_create()
switch(room) {
	case(rSpawnRoom):
		ds_list_add(waves,
			wave_create([3,oEnemyMelee]),
			wave_create([2,oEnemyMelee]),
			wave_create([0,oEnemyMelee],[1,oEnemy_Bat_Modified],[2,oEnemy_Bat_Modified])
		)
		break
}