var _id = async_load[? "id"];

switch (savestate)
{
	case savestates.dumpsave:
		if (_id == asyncsaveid)
		{
			buffer_delete(savebuff);
			savestate = savestates.idle;
			trace("Game Save Status: ", async_load[? "status"]);
		}
		
		break;
	case savestates.loadsave:
		if (_id == asyncloadid)
		{
			var _ini = buffer_read(loadbuff, buffer_string);
			ini_open_from_string(_ini);
			savestr = ini_close();
			buffer_delete(loadbuff);
			savestate = savestates.idle;
			trace("Game Load Status: ", async_load[? "status"]);
		}
		
		break;
	case savestates.dumpconfig:
		if (_id == asyncconfigsaveid)
		{
			buffer_delete(configsavebuff);
			savestate = savestates.idle;
			trace("Config Save Status: ", async_load[? "status"]);
		}
		
		break;
}
