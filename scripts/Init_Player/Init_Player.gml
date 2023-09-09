// Create event for every character. These are the default values. 
function init_variables_player(){
	//relative attributes
	hp = global.player1_health; hp_max = global.player1_stamina_max;
	mana = 10; mana_max = mana; 
	gunkickx = 0;
	gunkicky = 0; 
	walkspd = 2; current_walkspd = 0;
	jump_speed = 5;
	speedRoll = 5.0;	
	roll_cooldown = 0; moveDistanceRemaining = 0;
	roll_cooldown_full = 40;
	distanceRoll = 170;
	canrope = 0; //allows rope controls
	flash = 0; 
	
	//universal attributes
	move_transition=false
	can_move = true; //disable to remove control
	grv = 0.33; //gravity
	hsp = 0;
	vsp = 0;
	grounded = false; //check if on ground fast 
	hascontrol = true;
	coyote_time = 10; //for coyote jump
	jumps = 0; //double jumps
	jumps_max = 2;
	air_shot = false; //allows char to temporarily hover in the air
	slowmotion = 0.4; //delete later. 
	combo_counter = 0;  //goes up with short range attacks

	facing_direction = 0; //the last walked in direction
	dir_prev = 0; //used for shooting while walking
	jump_pad_jump = false;
		
	//grappling hook
	grappleX = 0;
	grappleY = 0;
	ropeX = x;
	ropeY = y;
	ropeAngleVelocity = 0; //decide to carry momentum with this later
	ropeAngle = point_direction(grappleX,grappleY, x,y);
	ropeLength = point_distance(grappleX,grappleY,x,y);

	//simplify cooldown script calling
	enum cooldown_ability { 
		  none = 0,
		  primary = 1,	 
		  secondary = 2, 
		  third = 3,	 
		  special = 4
	}
}