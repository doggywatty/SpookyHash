/// @description Update NekoPresence so async events will execute.

np_update();
var _state = string_concat("Crates: ", global.destroyedcount, "/", global.cratecount, " / Gems: ", bit_count(global.gems));

if (room == PatchPerilousRoute || room == PatchPerilousRoute2)
	_state = string_concat("Candy: ", global.collect);

if (!scr_hudroom())
	_state = "";

switch (room)
{
	case Init:
	case Logos:
		details = "Get ready for…";
		break;
	case Titlescreen:
		details = "Noise's Halloween Bash!";
		break;
	case PatchPerilousRoute:
	case PatchPerilousRoute2:
	case Jeg:
		details = "In a secret...";
		break;
	default:
		if (array_find_pos(global.levelrooms, room) != -1)
			details = string_concat("Pumpkins: ", global.pumpkintotal, " / Candy: ", global.collect);
		
		break;
}

var _smallimage = "";
var _smalltext = "";
np_setpresence(_state, details, "icon", _smallimage);
np_setpresence_more(_smalltext, "The Noise!", true);
