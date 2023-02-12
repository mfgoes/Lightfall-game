/// @description Load character data
LoadCharacter_Basics();

hp = global.player1_health; hp_max = global.player1_hp_max;
mana = global.player1_mana; mana_max = global.player1_mana_max;
	
//load archer character (make this changeable in the future)
LoadAssets_Archer();
//LoadCharacter_Archer();

//load input controls
PlayerInput(); 
state = PlayerStateFree;


//GENERATE OTHER OBJECTS RELATED TO PLAYER
//create player weapon
if !instance_exists(oPlayerWeapon) instance_create_depth(x,y,depth-10,oPlayerWeapon);
//if !instance_exists(oPlayerTorch) instance_create_depth(x,y,depth,oPlayerTorch); //to do: check if right layer exists
//if !instance_exists(oPlayerLightBulb) instance_create_depth(x,y,depth,oPlayerLightBulb); //to do: check if right layer exists