/// @description 
if (status == "Overworld")
{
	timer += 1;
	if (Papyrus.sprite_index == Paps_Down)
	{
		image_index = 1;
		GoTo = [Papyrus.x, Papyrus.y - 70];
	}
	else if (Papyrus.sprite_index == Paps_Up)
	{
		image_index = 3;
		GoTo = [Papyrus.x, Papyrus.y + 40];
	} 
	if (Papyrus.sprite_index == Paps_Left)
	{
		image_index = 2;
		GoTo = [Papyrus.x + 60, Papyrus.y - 70];
	}
	else if (Papyrus.sprite_index == Paps_Right)
	{
		image_index = 0;
		GoTo = [Papyrus.x - 60, Papyrus.y - 70];
	} 
	x += (GoTo[0] - x)/10;
	PosY += (GoTo[1] - (y - 5*sin(degtorad(90/120*(timer - 1)))))/10;
	y = PosY + 5*sin(degtorad(90/120*timer));
}
else if (status == "Start Battle")
{
	image_index = 0;
}
else if (status == "Battle")
{
	timer += 1;
	y = 320 + 5*sin(degtorad(90/120*timer));
}
depth = -y;