damage = 0.1; //does 1 damage
//explodes = false;
//splash = false; 
alarm[0] = 170; //destroy
alarm[1] = 40 + round(random(30)); //change direction + enable damage
alarm[2] = 10; //generate after images

collision_wall = false //if false, ignore walls (making it easier to hit the player)

dir = 0; 
dir_facing = dir; //for changing directions
spd = 0;
image_angle = choose(0,90,180,270);
