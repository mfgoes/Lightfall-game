/// @description Load character data
init_variables_player();

//load archer character (make this changeable in the future)
InitPlayerSprites();

//load input controls
PlayerInput(); 
state = PlayerStepMovement ;


//GENERATE OTHER OBJECTS RELATED TO PLAYER
//create player weapon
if !instance_exists(oPlayerWeapon) instance_create_depth(x,y,depth+10,oPlayerWeapon); //create weapon
//if !instance_exists(oPlayerTorch) instance_create_depth(x,y,depth,oPlayerTorch); //to do: check if right layer exists
//if !instance_exists(oPlayerLightBulb) instance_create_depth(x,y,depth,oPlayerLightBulb); //to do: check if right layer exists