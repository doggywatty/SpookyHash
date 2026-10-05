/*
	Thank you
	https://github.com/SoupTaels/UTDR-SoupGen/blob/main/UTDR%20Textbox%20Gen/scripts/GMLive_noDeactivate/GMLive_noDeactivate.gml
*/

// Prevents the common mistake of accidentally deactivating GMLive, breaking live-reloading
// If you know what you're doing, you can get rid of this
function instance_deactivate_all_hook(_notme) {
	instance_deactivate_all(_notme);
	instance_activate_object(obj_gmlive);
}

function instance_deactivate_layer_hook(_layer) {
	instance_deactivate_layer(_layer);
	instance_activate_object(obj_gmlive);
}

function instance_deactivate_object_hook(_object) {
	instance_deactivate_object(_object);
	instance_activate_object(obj_gmlive);
}

function instance_deactivate_region_hook(_left, _top, _width, _height, _inside, _notme) {
	instance_deactivate_region(_left, _top, _width, _height, _inside, _notme);
	instance_activate_object(obj_gmlive);
}