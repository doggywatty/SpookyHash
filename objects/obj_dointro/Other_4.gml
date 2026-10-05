with (obj_player)
{
	if (!nointro)
	{
		nointro = true;
		state = playerstate.levelintro;
		sprite_index = spr_player_titlescreenlaunch;
		y -= (global.maxscreenheight * 0.75);
	}
	else
	{
		instance_destroy(other.id);
	}
}
