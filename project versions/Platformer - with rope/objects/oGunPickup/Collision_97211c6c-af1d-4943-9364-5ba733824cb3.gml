/// @description Equip gun
instance_create_layer(oPlayer.x,oPlayer.y,layer,oGun);
audio_play_sound(snEquip,0,0);
instance_destroy(); 