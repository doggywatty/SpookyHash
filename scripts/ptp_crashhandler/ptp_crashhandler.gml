//PADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGP
exception_unhandled_handler(function(_ex)
{
	var _date = date_current_datetime();
	var _day = date_get_day(_date);
	var _month = date_get_month(_date);
	var _year = date_get_year(_date);
	var _hour = date_get_hour(_date);
	var _minute = date_get_minute(_date);
	var _osver = os_get_name();
	var _hardwareinfo = os_get_info();
	var _memory = os_get_installed_memory();
	var _processor = os_get_processor_info();
	var _graphicsdevice = _hardwareinfo[? "video_adapter_description"];
	var _videomemory = _hardwareinfo[? "video_adapter_dedicatedvideomemory"];
	
	if (os_type == os_linux || os_type == os_macosx)
	{
		_graphicsdevice = _hardwareinfo[? "gl_renderer_string"];
		_videomemory = -1;
	}
	
	var _processorwords = string_split(_processor, " ", true);
	_processor = "";
	
	for (var i = 0; i < array_length(_processorwords); i++)
	{
		_processor += _processorwords[i];
		
		if (i < (array_length(_processorwords) - 1))
			_processor += " ";
	}
	
	var _dir = $"{working_directory}CrashReport.txt";
	
	if (file_exists(_dir))
		file_delete(_dir);
	
	var _report = "";
	_report += "--BEGIN ERROR REPORT--\r\n";
	_report += "\r\n";
	_report += $"Generated at {string_padzeros(_day)}/{string_padzeros(_month)}/{_year} {string_padzeros(_hour)}:{string_padzeros(_minute)}\r\n";
	_report += $"Game Version: {game_display_name} {global.gamever}{is_latest() ? "" : " (Outdated)"}\r\n";
	_report += $"Operating System: {_osver}\r\n";
	_report += $"Processor: {_processor}\r\n";
	_report += $"Graphics Device: {_graphicsdevice}\r\n";
	_report += $"Physical Memory: {ceil(_memory / 1074000)} GB\r\n";
	
	if (_videomemory != -1)
		_report += $"Video Memory: {ceil(_videomemory / 1074000000)} GB\r\n";
	
	_report += "\r\n#################\r\n";
	var _longmessagelines = string_split(_ex.longMessage, "\n");
	var _startnewlines = false;
	
	for (var i = 0; i < (array_length(_longmessagelines) - 1); i++)
	{
		_report += _longmessagelines[i];
		
		if (string_pos(":", _longmessagelines[i]) > 0)
			_startnewlines = true;
		
		if (i < (array_length(_longmessagelines) - 2))
		{
			if (_startnewlines)
				_report += "\r\n";
			else
				_report += " ";
		}
	}
	
	_report += "\r\n#################\r\n";
	_report += "\r\n--END ERROR REPORT-";
	var _crashcomments = ["Well this is awkward.", "Whoops.", "My bad.", "Umm, why'd that happen?"];
	var _finalstr = "";
	_finalstr += $"// {_crashcomments[irandom(array_length(_crashcomments) - 1)]}\r\n";
	_finalstr += "\r\n";
	_finalstr += $"--{game_display_name} has Crashed!--\r\n";
	_finalstr += "\r\n";
	_finalstr += $"{game_display_name} has stopped running because it encountered a problem.\r\n";
	_finalstr += "If you wish to report this, please select \"Yes\" to copy the crash report\r\nand let us (PTPTeam Jr) know in any way you can.\r\n";
	_finalstr += "If possible, please include a description of what you were doing when the error occured.\r\n";
	_finalstr += "You can contact us on Twitter @ptpteamjr or on Bluesky @ptpteamjr.com.\r\n";
	_finalstr += "Alternatively, you may also send the crash report in the discussion section of the games itch.io page.\r\n";
	_finalstr += "\r\n";
	_finalstr += "\r\n";
	_finalstr += _report;
	_finalstr += "\r\n";
	_finalstr += "\r\n";
	_finalstr += "Do you want to copy this report?";
	var _file = file_text_open_write(_dir);
	file_text_write_string(_file, _finalstr);
	file_text_close(_file);
	show_debug_message(_report);
	
	if (show_question(_finalstr))
		clipboard_set_text(_report);
	
	ds_map_destroy(_hardwareinfo);
});
