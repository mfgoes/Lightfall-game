/// @description Load character data
init_variables_player();

ammo_basic = 41; //quick shots
ammo_heavy = 20; //the strong bow attack	


//load archer character (make this changeable in the future)
LoadAssets_Archer();

//load input controls
PlayerInput(); 
state = PlayerStateFree;


//GENERATE OTHER OBJECTS RELATED TO PLAYER
//create player weapon
if !instance_exists(oPlayerBow) instance_create_depth(x,y,depth-10,oPlayerBow);
//if !instance_exists(oPlayerTorch) instance_create_depth(x,y,depth,oPlayerTorch); //to do: check if right layer exists
//if !instance_exists(oPlayerLightBulb) instance_create_depth(x,y,depth,oPlayerLightBulb); //to do: check if right layer exists