/// @description progress transition

if (live_call()) return live_result;

//if draw_alpha > 0 draw_alpha -= 0.02;

if(mode !=TRANS_MODE.OFF)
{
	if (mode ==TRANS_MODE.INTRO)
	{
		percent = max(0,percent - max((percent/30),0.05));
	}
	else
	{
		percent = min(percent_target,percent + max(((percent_target - percent)/10),0.03)); //speed of change
	}
	
	if (percent == percent_target) or (percent ==0)
	{
		switch(mode)
		{
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;	
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;	
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;	
			}
		}
		
	}
}