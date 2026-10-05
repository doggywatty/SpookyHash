if (in_saveroom($"{real(id)}_ARROW", global.respawnroom))
{
	if (!in_saveroom($"{real(id)}_NITRO", global.respawnroom))
	{
		with (instance_create_depth(x, y, z, obj_destroyablenitro))
		{
			arrowid = other.id;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
	}
	
	instance_destroy(id, false);
}
