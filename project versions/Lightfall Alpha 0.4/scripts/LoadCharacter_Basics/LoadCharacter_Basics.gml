// Create event for every character. These are the default values. 
function LoadCharacter_Basics(){
	grv = 0.32; //gravity
	hsp = 0;
	vsp = 0;
	grounded = false; //check if on ground fast 
	hascontrol = true;
	coyote_time = 10; //for coyote jump
	jump_speed = 6.5;
	jumps = 0; //double jumps
	jumps_max = 2;
	air_shot = false; //allows char to temporarily hover in the air
	slowmotion = 0.4; //delete later. 
	speedRoll = 5.0;
	distanceRoll = 170;
	facing_direction = 0; //the last walked in direction
		
	//grappling hook
	grappleX = 0;
	grappleY = 0;
	ropeX = x;
	ropeY = y;
	ropeAngleVelocity = 0; //decide to carry momentum with this later
	ropeAngle = point_direction(grappleX,grappleY, x,y);
	ropeLength = point_distance(grappleX,grappleY,x,y);
	canrope = 0; //allows rope controls
	
	//delete later*
	using_ability = 0;
	current_weapon = 0; //0 = bow, 1 = regular
	gunkickx = 2;
	gunkicky = 0;
	flash = 0; 
	
	//simplify cooldown script calling
	enum cooldown_ability { 
		  none = 0,
		  primary = 1,	 
		  secondary = 2, 
		  third = 3,	 
		  special = 4
	}
}