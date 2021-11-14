/// @description check connections
var target = instance_nearest_notme(x,y,oEnemySpawnerNew);

if target.shared_right = true && target.x > x{
	target.shared_left = true;
}
//with(target) instance_destroy(); 

if shared_left = true && shared_right = true {
	instance_destroy();
}