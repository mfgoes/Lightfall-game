// Script assets have changed for v2.3.0 see
// This script is for testing the death screen. It activates when you press X. 
function PlayerDieDebug(){
	if keyboard_check_pressed(ord("X")) {
		//kill player
		with(oPlayer) 
			hp = 0; 
			KillPlayer();
	}
}