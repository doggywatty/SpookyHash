var _discbuff = -2;

if (file_exists(working_directory + "Data/disclaimer.txt"))
	_discbuff = buffer_load(working_directory + "Data/disclaimer.txt");

switch (_discbuff)
{
	case -2:
		discstr = "ERROR: Unable to load disclaimer text\nFile Missing";
		break;
	case -1:
		discstr = "ERROR: Unable to load disclaimer text\nToo low memory?";
		break;
	default:
		discstr = buffer_read(_discbuff, buffer_string);
		buffer_delete(_discbuff);
		break;
}

discanim = 0;
discspin = 0;
discsquash = false;
event_play_oneshot("event:/sfx/misc/disclamerspin");
save_load();
get_changelogs();
get_itch();
