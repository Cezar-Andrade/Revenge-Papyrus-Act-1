/// @description 
if (state == "Enemy Attacking" and Invulnerability <= -1 and Act_1.timer < 560)
{
	audio_play_sound(snd_hurt, 1, false);
	Invulnerability = 90;
	HP -= 30/Papyrus.Def;
	HP = max(HP, 1);
	if (HP <= 1)
	{
		Act_1.timer = 560;
	}
}