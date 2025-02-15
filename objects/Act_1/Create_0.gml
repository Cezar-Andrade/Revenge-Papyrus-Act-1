/// @description 
timer = 0;
choice = 0;
char = 0;
skip = false;
Dialog = "";
Display = "";
Aim = 320;
damage = [-1, 0, 0];
depth = -1200;
globalvar status;
globalvar state;
globalvar enemies;
globalvar Invulnerability;
status = "Overworld";
state = "None";
Invulnerability = -1;
audio_play_sound(msc_overworld_1, 2, false);