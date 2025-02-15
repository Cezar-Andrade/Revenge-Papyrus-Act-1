function scr_Bone2(argument0) {
	var count = 0;
	for (var i = 0; i < array_length_1d(enemies); i++)
	{
		if (!enemies[i].Spare and enemies[i].AttackUse == "Bone2")
		{
			count++;
		}
	}
	if (argument0 == 0)
	{
		if (((Act_1.timer - 30)%180 == 0 and count >= 3) or ((Act_1.timer - 30)%150 == 0 and count == 2) or ((Act_1.timer - 30)%120 == 0 and count <= 1))
		{
			var bullet = instance_create_depth(max(min(inst_soul.x, Arena.x + 52), Arena.x - 52), Arena.y + 78, inst_soul.depth - 1, obj_bullet);
			bullet.behavor = 1;
			bullet.sprite_index = spr_BoneSlam;
			bullet.image_speed = 0;
			bullet.image_xscale = 2;
			bullet.image_yscale = 2;
		}
	}
	else if (argument0 == 1)
	{
		if (count >= 3)
		{
			if ((Act_1.timer - 30)%180 == 60)
			{
				var bullet = instance_create_depth(max(min(inst_soul.x, Arena.x + 52), Arena.x - 52), Arena.y + 78, inst_soul.depth - 1, obj_bullet);
				bullet.behavor = 1;
				bullet.sprite_index = spr_BoneSlam;
				bullet.image_speed = 0;
				bullet.image_xscale = 2;
				bullet.image_yscale = 2;
			}
		}
		else
		{
			if ((Act_1.timer - 30)%150 == 75)
			{
				var bullet = instance_create_depth(max(min(inst_soul.x, Arena.x + 52), Arena.x - 52), Arena.y + 78, inst_soul.depth - 1, obj_bullet);
				bullet.behavor = 1;
				bullet.sprite_index = spr_BoneSlam;
				bullet.image_speed = 0;
				bullet.image_xscale = 2;
				bullet.image_yscale = 2;
			}
		}
	}
	else
	{
		if ((Act_1.timer - 30)%180 == 120)
		{
			var bullet = instance_create_depth(max(min(inst_soul.x, Arena.x + 52), Arena.x - 52), Arena.y + 78, inst_soul.depth - 1, obj_bullet);
			bullet.behavor = 1;
			bullet.sprite_index = spr_BoneSlam;
			bullet.image_speed = 0;
			bullet.image_xscale = 2;
			bullet.image_yscale = 2;
		}
	}


}
