/// @description Insert description here
// You can write your code in this editor
timer_init("spawn");
timer_init("spawn2");

#region spawn arrows
	if timer_get("spawn") <= 0 {
		d1 = instance_create_depth(x+random_range(-dist/2,dist/2),y-100,depth,oStormArrowDown);
		if random(1)<0.3 d1.particles = false; 
		timer_set("spawn",2);
	}
	if timer_get("spawn2") <= 0 {
		d2 = instance_create_depth(x+random_range(-dist,dist),y-80,depth,oStormArrowDown);
		timer_set("spaw2",5);
	}
#endregion
