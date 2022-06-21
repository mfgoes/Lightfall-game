/// @desc destroyaudio_sound_gain(a,0.2,0);
var a = snSpawnGeneric;
audio_sound_gain(a,0.3,0);
audio_sound_pitch(a,choose(0.9,0.95,1));
audio_play_sound(a,0,0);
instance_destroy();

