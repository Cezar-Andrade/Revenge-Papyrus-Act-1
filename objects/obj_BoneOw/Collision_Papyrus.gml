/// @description 
if (status == "Overworld")
{
	audio_play_sound(snd_encounter, 1, false);
	instance_destroy();
	status = "Enter Battle";
	Papyrus.image_speed = 0;
	for (var i = 0; i <= (summon - 1); i++)
	{
		enemies[i] = instance_create_layer(x, y, "Instances", obj_BoneBt);
	}
	if (summon == 3)
	{
		enemies[0].GoTo = [540, 200];
		enemies[1].GoTo = [460, 280];
		enemies[2].GoTo = [540, 360];
	}
	else if (summon == 2)
	{
		enemies[0].GoTo = [470, 230];
		enemies[1].GoTo = [470, 330];
	}
	else if (summon == 1)
	{
		enemies[0].GoTo = [470, 280];
	}
}