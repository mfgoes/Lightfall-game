/// @description Equip gun
global.hasgun = true;
instance_create_layer(oPlayer.x,oPlayer.y,layer,oWeaponPlayer);
audio_play_sound(snEquip,0,0);
instance_destroy(); 