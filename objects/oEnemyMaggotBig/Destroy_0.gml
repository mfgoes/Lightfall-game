/// @description Create baby maggots at the death location of an enemy
// Ensure that the location where the baby maggots are to be created is free
var spawn_amount = choose(3,4,5); 
var ram_x; 
var spaceAvailable; 

//live
if (live_call()) return live_result; 

// Loop to create 3 baby maggots
for (var i = 0; i < spawn_amount; i++) {
    ram_x = random_range(-20, 20); // Randomize the x-offset for each baby maggot
    spaceAvailable = !place_meeting(x + ram_x, y, oWallParent); // Check if the space is free of obstacles

    // Only create a baby maggot if the space is free
    if (spaceAvailable) {
        dd = instance_create_depth(x + ram_x, y, depth, oEnemyMaggotBaby);
		dd.hsp = random_range(-3,3); 
		dd.vsp = random_range(-3,0); 
		randomize(); 
    }
}
