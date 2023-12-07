///@desc init

dir = 0; 
spd = 0;
vsp = 0; 
damage = 1; //does 1 damage
explodes = false;
splash = false; 
destroy_sound = statue_stomp_02; //sound it makes when destroyed
collision_wall = false; //rename to 'can_collide'
alarm[1] = 20; //enable collisions
alarm[0] = 140; //destroy self

//visuals
image_speed = 0;
image_angle = choose(0,90,180,270); 
falling = false; //true if going downwards