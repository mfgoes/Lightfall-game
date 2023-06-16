/// @description angle weapon

//test if closest object works
if(live_call()) return live_result;

handleShooting();
click_dir = sign(mouse_x - oPlayer.x); 
if click_dir = 0 click_dir = 1; 

ShootingAnimation();