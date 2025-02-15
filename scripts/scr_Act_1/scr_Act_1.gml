function scr_Act_1(argument0, argument1) {
	if (argument0 == "Bone")
	{
		if (argument1 == "Check")
		{
			Gaster.Dialog = "Bone 1 ATK 1 DEF\nA living bone\nstuck on the\nground.";
		}
		else if (argument1 == "Translate")
		{
			enemies[selection[0] - 1].font = fnt_determination;
			enemies[selection[0] - 1].commands = ["Check", "Feed", "Compliment"];
		}
		else if (argument1 == "Feed")
		{
			obj_textbox.Dialog = "* Papyrus gives some of his\n  Spaghetti to the bone enemy.";
			if (enemies[selection[0] - 1].Dialog == "I want some\nfood right\nnow.")
			{
				enemies[selection[0] - 1].sprite_index = spr_Bone_Happy;
				enemies[selection[0] - 1].Dialog = "Thank you\nPapyrus!";
				enemies[selection[0] - 1].Spare = true;
				enemies[selection[0] - 1].Attacks = [""];
			}
			else
			{
				enemies[selection[0] - 1].TempDialog = "I am not\nhungry right\nnow.";
			}
		}
		else if (argument1 == "Compliment")
		{
			obj_textbox.Dialog = "* Papyrus tells to the bone enemy\n  that it'll be a perfect special\n  attack.";
			if (enemies[selection[0] - 1].Dialog == "I want some\nfood right\nnow.")
			{
				enemies[selection[0] - 1].TempDialog = "I can't be\na perfect attack\nwhen I am\nhungry.";
			}
			else
			{
				enemies[selection[0] - 1].sprite_index = spr_Bone_Happy;
				enemies[selection[0] - 1].Dialog = "Thank you\nPapyrus!";
				enemies[selection[0] - 1].Spare = true;
				enemies[selection[0] - 1].Attacks = [""];
			}
		}
	}


}
