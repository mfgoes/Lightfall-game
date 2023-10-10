// Each unique ability could have its own script (to simlify coding). Consider reusability in the future. 
function PlayerStateSpecialAtk(){
	timer_init("generate attack")
	image_speed = 1;
	//hsp = 0;
	var slowwalk = 0.5; 
	var move = key_right - key_left;
	hsp = (move * slowwalk) + gunkickx;
	vsp = (vsp + grv);
	using_ability = 1;
}