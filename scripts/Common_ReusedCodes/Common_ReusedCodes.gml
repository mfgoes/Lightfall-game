//simple snippets for reused codes (mostly regarding the player


//COMBAT RELATED
function player_hurt_by_enemy() {
	hp -= other.damage;
	flash = 3;
	gunkickx += sign(x - other.x) * 5; //from pos enemy to pos player
	ScreenShake(3, 2);
						
	//create blood particles
	instance_create_depth(x,y,depth-5,oParticleBlood);
						
	if hp < 1
		KillPlayer();
	//play hurt sound
	var sound = choose(Realistic_Punch_2_1,Realistic_Punch_2_2,Realistic_Punch_2_3,Realistic_Punch_2_4);
	audio_sound_gain(sound, 0.8, 0);
	if !audio_is_playing(sound)
		audio_play_sound(sound, 10, 0);	
}

function player_dodge_success() {
if !audio_is_playing(snDashDodge)
	audio_sound_gain(snDashDodge,0.4,1);
	audio_play_sound(snDashDodge, 10, 0);
	
	//to do: make dramatic dodge particles here
}


//BASIC / GRAVITY / MISC	
function VerticalCollision(){ 
	var grv = 0.2;
	vsp = vsp + grv;
	if (place_meeting(x,y+vsp, oWallParent)) or (place_meeting(x,y+vsp,oPlatformParent))
	{
		vsp = 0;	
	}
	y = round(y + vsp);
	if vsp > 10 vsp = 10;
}

//reusable vertical collisions (for enemies)
/// @function			sprite_offset_cleanup(); 
/// @description		sets all enemy off to bottom center

function sprite_offset_cleanup(){
	sprite_index = spriteIdle; 
	sprite_set_offset(spriteIdle,sprite_width/2,sprite_height);
	sprite_set_offset(spriteWalk,sprite_width/2,sprite_height);
	sprite_set_offset(spriteJump,sprite_width/2,sprite_height);
	sprite_set_offset(spriteDie,sprite_width/2,sprite_height);
	sprite_set_offset(spriteAttack,sprite_width/2,sprite_height);
	sprite_set_offset(spriteMelee,sprite_width/2,sprite_height);
}