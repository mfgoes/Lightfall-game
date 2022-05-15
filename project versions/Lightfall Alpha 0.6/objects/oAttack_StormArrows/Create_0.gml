/// @description attack settings
dist = 60; //spread radius
duration = 60; //how long to do attack
alarm[0] = duration;

//create arrow batch (more in step event)
instance_create_depth(x,y-80,depth,oStormArrowDown);
instance_create_depth(x-40,y-40,depth,oStormArrowDown);
instance_create_depth(x+40,y-40,depth,oStormArrowDown);
instance_create_depth(x+20,y,depth,oStormArrowDown);
instance_create_depth(x-20,y,depth,oStormArrowDown);

