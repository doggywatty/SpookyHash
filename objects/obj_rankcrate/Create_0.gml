startdepth = depth;
hsp = 0;
vsp = 0;
grav = 0.5;
var _gw = get_game_width();
var _gh = get_game_height();
middlex = _gw / 2;

switch (type ?? ranks.perfect)
{
	case ranks.perfect:
		x = middlex;
		y = -100;
		vsp = 8;
		break;
	case ranks.good:
		x = 16;
		break;
	case ranks.meh:
		x = _gw - 16;
		break;
}

if (type == ranks.good || type == ranks.meh)
{
	y = _gh + 64;
	var _motion = calculate_projectile_motion(x, y, middlex, 365, grav, 48);
	hsp = _motion.hsp;
	vsp = _motion.vsp;
}
