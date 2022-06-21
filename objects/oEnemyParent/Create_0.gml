/// @desc init
//state enums for simple enemies
enum enemy_states { 
  idle,
  patrol,
  approach,
  attack,
  lunge //new. used for melee enemy 
}
current_state = enemy_states.idle;

//generate spawn visual
instance_create_depth(x,y,depth,oSpawnAnimation);
alarm[0] = 50;
y = -1000;


#region animation 
	//define sprites (load flazas arrays and enums in the future (phase 3)
	spriteIdle =	sprite_index;
	spriteWalk =	sprite_index;
	spriteJump =	sprite_index;
	spriteDie  =	sprite_index;
	spriteAttack  =	sprite_index
	spriteMelee  =	sprite_index
	attack_anim_end = 0;
	mask_index =	sprite_index;
	image_alpha = 0.1; //fade in
	atk_anim_x = 0 // for melee attacks
#endregion

#region general stats
	hp = 4; hp_max = hp;
	flash = 0;
	vsp = 0; //gravity is declared in VerticalCollision() because it's basically global.
	walk_spd = 1;
	can_blink = true; //can blink if required. 
	approach_spd = 1.2;
	wander_range = 80; //maximum patrol area
	reload_spd = 55;
	hsp = walk_spd;
	hitfrom = 0;
	size = 1;
	afraid_of_heights = true;
	patrol_dir = choose(1,-1); //which direction to walk into
	patrol_xstart = xstart; patrol_ystart = ystart;
	grounded = false;
	stunned = 5; //prevents enemy from walking (start with 5 to create a tiny break) 

	if instance_exists(oPlayer) target = oPlayer; else target = id; 

	//attacking variables
	sight_range = 80 + round(random_range(5,10)); //when to detect player
	gunkickx = 0;
	atk_range = 35; //closest distance for attacks
	wander_range = 50; 
	damage = 1;
	alerted = 0; //if player has already been sighted by this unit.
#endregion
