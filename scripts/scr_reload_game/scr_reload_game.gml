global.RELOAD = true;

if (file_exists("saved_player.save")) {
	var _buffer = buffer_load("saved_player.save");
	var _string_player = buffer_read(_buffer, buffer_string);
	buffer_delete( _buffer);
	
	var _loadData = json_parse(_string_player);
	while (array_length(_loadData) > 0) {
		var _loadEmtity = array_pop(_loadData);
		with (obj_player) {
			x = _loadEmtity.x;
			y = _loadEmtity.y;
			image_blend = _loadEmtity.image_blend;
			image_index = _loadEmtity.image_index;
			speed		= _loadEmtity.speed;
			room		=_loadEmtity.room;
		}
	}
} else {global.RELOAD = false;}

if (file_exists("saved_caldera.save")) {
	var _buffer = buffer_load("saved_caldera.save");
	var _string_caldera = buffer_read(_buffer, buffer_string);
	buffer_delete( _buffer);
	
	var _loadData = json_parse(_string_caldera);
	while (array_length(_loadData) > 0) {
		var _loadEmtity = array_pop(_loadData);
		with (obj_caldera) {
			//Coas de calderas no entenderias
		}
	}
} else {global.RELOAD = false;}


if (file_exists("saved_menu.save")) {
	var _buffer = buffer_load("saved_menu.save");
	var _string_menu = buffer_read(_buffer, buffer_string);
	buffer_delete( _buffer);
	
	var _loadData = json_parse(_string_menu);
	while (array_length(_loadData) > 0) {
		var _loadEmtity = array_pop(_loadData);
		with (obj_menu) {
			global.KEY_UP			= _loadEmtity.up;
			global.KEY_DOWN			= _loadEmtity.down;
			global.KEY_LEFT			= _loadEmtity.left;
			global.KEY_RIGHT		= _loadEmtity.right;
			global.KEY_INVENTORY	= _loadEmtity.inventory
		}
	}
} else {global.RELOAD = false;}


if (file_exists("saved_control.save")) {
	var _buffer = buffer_load("saved_control.save");
	var _string_control = buffer_read(_buffer, buffer_string);
	buffer_delete( _buffer);
	
	var _loadData = json_parse(_string_control);
	while (array_length(_loadData) > 0) {
		var _loadEmtity = array_pop(_loadData);
		with (obj_control) {
			global.HORA			= _loadEmtity.hora;
			global.HAMBRE		= _loadEmtity.hambre;
			global.CANSANCIO	= _loadEmtity.cansancio;
			global.DIAS			= _loadEmtity.dia;
			global.FRIO			= _loadEmtity.frio;
		}
	}
} else {global.RELOAD = false;}


if (global.RELOAD) {
	show_debug_message("Player reload: " + _string_player);
	show_debug_message("Caldera reload: " + _string_caldera);
	show_debug_message("Control reload: " + _string_control);
	show_debug_message("Menu reload: " + _string_menu);
	show_debug_message("Game reloaded!");
} else {
	show_debug_message("error mamita")	//TODO cambiar so pelotudo
}