optionstack = ds_stack_create();
var _debug = false;

for (var i = 0; i < parameter_count(); i++)
{
	var _param = string_lower(parameter_string(i));
	
	if (_param == "-debug" || _param == "--debug" || _param == "-devmode")
	{
		_debug = true;
		break;
	}
}

if (!_debug)
{
	global.visiblesolids = false;
	instance_destroy();
	exit;
}

function DEBUGMenuItem(_e, _d) constructor
{
//PADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPA
	static draw = function(_x, _y, _a)
	{
		var _c = c_white;
		
		if (_a)
			_c = c_black;
		
		draw_text_colour(round(_x), round(_y), name, _c, _c, _c, _c, 1);
	};
	
//PADDIN
	static jump = function(_h, _f)
	{
		func(_h, _f);
	};
	
//P
	static atk = function(_h, _f)
{
};

name = _e;
func = _d;
parent = noone;
}

function DEBUGFolder(_e, _g) : DEBUGMenuItem(_e) constructor
{
optionselected = 0;
name = _e;
options = _g;
array_foreach(options, function(_f, _h)
	{
		_f.parent = self;
});
static enterfolder = function(_b)
	{
		var _memyselfandi = self;
		
		with (_b)
			ds_stack_push(optionstack, _memyselfandi);
	};
	
//P
	static exitfolder = function(_b)
	{
		if (ds_stack_size(_b.optionstack) > 1)
			ds_stack_pop(_b.optionstack);
		else
			_b.open = false;
	};
	
//PADDINGPAD
	static drawoptions = function()
	{
		var _gy = 32;
		var _maxoptions = 7;
		draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, 220, 32, #D54368, 1);
		draw_text_colour(10, 16, name, c_white, c_white, c_white, c_white, 1);

		for (var _i = 0; _i < array_length(options); _i++)
		{
			var _scrollop = optionselected - 3;

			if (_scrollop < 0)
				_scrollop = 0;

			if (_scrollop > (array_length(options) - _maxoptions))
				_scrollop = array_length(options) - _maxoptions;

			if (_i < _scrollop || (_i - _scrollop) >= _maxoptions)
				continue;

			draw_sprite_stretched_ext(spr_1x1, 0, 0, _gy, 200, 32, (_i == optionselected) ? c_white : c_black, 1);

			if (_i == _scrollop && _i != 0)
				draw_text_colour(100, _gy + 16, "^", c_white, c_white, c_white, c_white, 1);
			else if ((_i - _scrollop) == (_maxoptions - 1) && _i != (array_length(options) - 1))
				draw_text_colour(100, _gy + 16, "v", c_white, c_white, c_white, c_white, 1);
			else
				options[_i].draw(5, _gy + 16, _i == optionselected);
	
			_gy += 32;
		}
	};
	
	static jump = function(_k)
	{
		enterfolder(_k);
	};

static atk = function(_k)
	{
		exitfolder(_k);
	};
	
}

var _roomoptions = array_create(0);

for (var i = 0; room_exists(i); i++)
{
//PADDING
	array_push(_roomoptions, new DEBUGMenuItem(room_get_name(i), function(_f, _j)
	{
		room_goto(asset_get_index(_j.name));
		_f.open = false;
		
		while (ds_stack_size(_f.optionstack) > 1)
			ds_stack_pop(_f.optionstack);
	}));
}

//PADDINGPADDINGPADDINGPADDINGP
var _baseoptions = new DEBUGFolder("DebugJr v0.1", [new DEBUGMenuItem("Toggle Collisions", function(_f)
{
	global.visiblesolids = !global.visiblesolids;
	_f.open = false;
//PADDINGPADDINGP
}), new DEBUGMenuItem("Toggle Noclip", function(_f)
{
	if (instance_exists(obj_jegplayer))
	{
		with (obj_jegplayer)
			noclip = !noclip;
	}
	else if (obj_player.state == pstate.noclip)
	{
		obj_player.state = obj_player.debugstate;
	}
	else
	{
		obj_player.debugstate = obj_player.state;
		obj_player.state = pstate.noclip;
		
		if (!game_paused())
			instance_destroy(obj_optionsmenu);
	}
	
	_f.open = false;
//PADDINGPADDINGPADDINGPADDINGPADDINGPADDINGPA
//PADDING
}), new DEBUGFolder("Go to Room", _roomoptions), new DEBUGMenuItem("Toggle Debug Camera", function(_f)
{
	if (obj_drawcontroller.debugcamcontrols)
	{
		obj_player.state = obj_player.debugstate;
		obj_drawcontroller.debugcam = false;
		obj_drawcontroller.debugcamcontrols = false;
	}
	else
	{
		obj_player.debugstate = obj_player.state;
		obj_player.state = pstate.statedebug;
		obj_drawcontroller.debugcam = true;
		obj_drawcontroller.debugcamcontrols = true;
		
		if (!game_paused())
			instance_destroy(obj_optionsmenu);
	}
	
	_f.open = false;
//PADDINGPADDINGPADDINGPADDINGPADDINGP
//PA
}), new DEBUGMenuItem("Lock/Unlock Camera", function(_f)
{
	if (obj_drawcontroller.debugcam && !obj_drawcontroller.debugcamcontrols)
	{
		obj_drawcontroller.debugcam = false;
		obj_drawcontroller.debugcamcontrols = false;
	}
	else
	{
		if (obj_player.state == pstate.statedebug)
			obj_player.state = obj_player.debugstate;
		
		obj_drawcontroller.debugcam = true;
		obj_drawcontroller.debugcamcontrols = false;
	}
	
	_f.open = false;
//PADDINGPADDINGPADDINGPADDIN
//PA
}), new DEBUGMenuItem("Reset Player", function(_f)
{
	if (room != Titlescreen)
		player_reset(false);
	
	_f.open = false;
//PADDINGPADDINGP
}), new DEBUGMenuItem("Reset Cycle", function(_f)
{
	global.game_cycleF = 0;
	global.game_cycleMS = 0;
	_f.open = false;
//PADDINGPADDINGPADD
}), new DEBUGMenuItem("Give Masks", function(_f)
{
	obj_player.hp = 3;
	_f.open = false;
//PADDINGPADDINGP
}), new DEBUGMenuItem("Destroy Crates", function(_f)
{
	with (obj_destroyablenitroarrow)
	{
		instance_destroy(id, false);
		event_perform(ev_destroy, 0);
	}
	
	instance_destroy(par_crate);
	_f.open = false;
//PADDINGPADDINGPADDINGPA
}), new DEBUGMenuItem("Reveal Map", function(_f)
{
	for (var i = 0; i < array_length(obj_levelmap.visitedrooms); i++)
		obj_levelmap.visitedrooms[i] = true;
	
	_f.open = false;
//PADDINGPADDINGPADDINGPA
}), new DEBUGMenuItem("Toggle GodMode", function(_f)
{
	global.godmode = !global.godmode;
	_f.open = false;
//PADDINGPADDINGP
}), new DEBUGMenuItem("Toggle Switches", function(_f)
{
	global.switchstate = !global.switchstate;
	_f.open = false;
//PADDINGPADDINGP
}), new DEBUGMenuItem("Give All Pumpkins", function(_f)
{
	global.pumpkintotal = 10;
	_f.open = false;
//PADDINGPADDINGPADDIN
}), new DEBUGFolder("Kill Player", [new DEBUGMenuItem("Normal Death", function(_f)
{
	with (obj_player)
		scr_hurtplayer(5);
	
	_f.open = false;
	
	while (ds_stack_size(_f.optionstack) > 1)
		ds_stack_pop(_f.optionstack);
//PADDINGPADDINGPADDINGPADDINGPAD
}), new DEBUGMenuItem("Explosion Death", function(_f)
{
	scr_hurtplayer(5, playerdeaths.gibdeath);
	instance_create_depth(obj_player.x, obj_player.y, 10, obj_explosion);
	_f.open = false;
	
	while (ds_stack_size(_f.optionstack) > 1)
		ds_stack_pop(_f.optionstack);
//PADDINGPADDINGPADDINGPADDINGPADD
}), new DEBUGMenuItem("Fire Death", function(_f)
{
	with (obj_player)
		scr_hurtplayer(5, playerdeaths.firedeath);
	
	_f.open = false;
	
	while (ds_stack_size(_f.optionstack) > 1)
		ds_stack_pop(_f.optionstack);
//PADDINGPADDINGPADDINGPADDI
})]), new DEBUGMenuItem("Give Points", function(_f)
{
	global.collect += 1000;
	_f.open = false;
//PADDINGPADDINGP
}), new DEBUGMenuItem("Rank Test", function(_f)
{
	room_goto(RankRoom);
	obj_player.state = pstate.actor;
	_f.open = false;
//PADDINGPADDIN
//PA
}), new DEBUGMenuItem("Credits Test", function(_f)
{
	room_goto(Credits);
	obj_player.state = pstate.actor;
	_f.open = false;
//PADDINGPADDIN
//PA
}), new DEBUGMenuItem("Evil Teleport", function(_f)
{
	with (obj_deathplatform)
	{
		if (!in_room())
			continue;
		
		obj_player.x = x;
		obj_player.y = y - 30;
	}
	
	_f.open = false;
})]);
_baseoptions.jump(id);
open = false;
depth = -15500;
