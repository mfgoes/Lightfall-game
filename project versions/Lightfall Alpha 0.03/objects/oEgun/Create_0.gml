/// @desc 
shoot_range = 200; //how far it can shoot
countdownrate = 40+choose(-2,2,0); 
countdown = countdownrate;
randomize();

if (global.hasgun == false) instance_destroy(); 