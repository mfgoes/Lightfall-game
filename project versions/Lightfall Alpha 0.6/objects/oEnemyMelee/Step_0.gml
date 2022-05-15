/// @description genearlised multi-enemy state changes (Dec 2021)

//if (live_call()) return live_result; 
#region gravity + basic + timers
if global.game_paused
{
exit;
}
//event_inherited(); //inherits gravity code and pause code

v+=grv
if instance_exists(target) {
	var dis_from_target=point_distance(x,y,target.x,y)
	var dis_min=25
	var plr_dir = sign(target.x-x)
	if plr_dir==0 { plr_dir=1 }
	if atk_anim_p==0 {
		if dis_from_target>dis_min or atk_delay_timer>0 {
			var mov_spd=0.5
			h=lerp(h,atk_delay_timer<=0 ? plr_dir*mov_spd : plr_dir*mov_spd*-0.5,0.1)
			if h!=0 {
				last_faced=sign(h)*-1	
			}
			image_xscale=sign(h)*-1
			if image_xscale==0 { image_xscale=1 }
			var dis = point_distance(x,y,target.x,target.y)
			if dis<=leap_min_dis and dis>=40 {
				if place_meeting(x,y+5,class_wall) { leap_timer++ }
				if leap_timer>=leap_goal {
					leap_timer=0
					h_leap=plr_dir*leap_horizontal_str
					image_xscale=plr_dir*-1
					v_leap=-leap_str
					v=0
					h=0
				}
			}
			if abs(h_leap)<=0.5 {
				if !place_meeting(x+h,y,class_wall) {
					x+=h
				}else {
					h=0
				}
			}
			atk_timer=0
		}else {
			h=0
			leap_timer=0
			if atk_delay_timer<=0 {
				atk_timer++	
				if atk_timer>=30 {
					atk_anim_p=1	
					dir_atk=plr_dir
					image_xscale=plr_dir*-1
				}
			}
		}
	}
	if !place_meeting(x+h_leap,y,class_wall) {
		h_leap=lerp(h_leap,0,0.05)
		x+=h_leap
	}else {
		h_leap=0
	}
	if !place_meeting(x,y+v,class_wall) {
		y+=v
	}else {
		while(!place_meeting(x,y+sign(v),class_wall)) {
			y+=sign(v)	
		}
		v=0
		v_leap=0
		if place_meeting(x,y+1,class_wall) { image_xscale=sign(h)*-1 image_xscale=image_xscale==0 ? last_faced : image_xscale }
	}
	if !place_meeting(x,y+v_leap,class_wall) {
		y+=v_leap
	}else {
		v_leap=0
	}
	
	if atk_anim_p==1 {
		image_xscale=dir_atk*-1
		atk_anim_x=lerp(atk_anim_x,dir_atk*anim_x_length,0.2)
		atk_check=true
		if abs(atk_anim_x-dir_atk*anim_x_length)<1 { atk_anim_p=2 }
	}else if atk_anim_p==2 {
		if atk_check=true {
			atk_check=false
			if place_meeting(x+atk_anim_x*3,y,target) {
				atk_delay_timer=45
				with(oPlayer) {
					hp-=other.damage;
					flash = 3;
					gunkickx += sign(x - other.x)*5; //from pos enemy to pos player
					ScreenShake(3,2);
					if hp < 1 KillPlayer();
					//play sound
					audio_sound_gain(snFootstep4,0.8,0);
					if !audio_is_playing(snFootstep4) audio_play_sound(snFootstep4,10,0);
				}
			}
		}
		atk_anim_x=lerp(atk_anim_x,0,0.25)
		if abs(atk_anim_x)<0.05 { atk_delay_timer=atk_delay_goal atk_anim_x=0 atk_anim_p=0 }
	}
}
show_debug_message(string(x) + " " + string(atk_anim_x) + " " + string(sprite_index))
atk_delay_timer--