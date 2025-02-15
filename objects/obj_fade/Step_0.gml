/// @description 
image_alpha -= 0.05;
if (array_length_1d(expand) > 0)
{
	image_xscale += expand[0];
	image_yscale += expand[1];
}
if (image_alpha <= 0)
{
	instance_destroy();
}