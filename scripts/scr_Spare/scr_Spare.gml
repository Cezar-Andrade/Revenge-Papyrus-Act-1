function scr_Spare(argument0) {
	if (argument0.Spare)
	{
		argument0.Fuck_Off = 0;
		audio_play_sound(snd_spared, 1, false);
		obj_textbox.Dialog = "* Papyrus spared " + string_lower(argument0.name) + " enemy.";
		for (var i = selection[0] - 1; i < array_length_1d(enemies); i++)
		{
			if (i + 1 < array_length_1d(enemies))
			{
				enemies[i] = enemies[i + 1];
			}
		}
		var aux = [];
		for (var i = 0; i < array_length_1d(enemies) - 1; i++)
		{
			aux[i] = enemies[i];
		}
		enemies = aux;
	}
	else
	{
		obj_textbox.Dialog = "* Papyrus tried to spare " + string_lower(argument0.name) + " enemy.\n* But it failed, its name wasn't yellow.";
	}


}
