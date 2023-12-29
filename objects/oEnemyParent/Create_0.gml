/// @desc init
// Common initialization for all enemy types
scr_initialize_enemy(); 

if (spawn_from_wave) {
    instance_create_depth(x, y, depth, oSpawnAnimation);
    alarm[0] = 40;
    y = -1000;
} //