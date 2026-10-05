if (arrowid != noone)
	add_saveroom($"{real(arrowid)}_NITRO", global.respawnroom);
else
	add_saveroom(id, global.respawnroom);

global.destroyedcount++;
crateeffect(#60E878);
combo();
instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z, obj_explosion);
