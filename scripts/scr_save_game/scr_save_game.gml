var _saveData_player = array_create(0);
var _saveData_caldera = array_create(0);
var _saveData_menu = array_create(0);
var _saveData_control = array_create(0);

with(obj_player) {
	var _saveEntity_player = 
	{
		obj		: object_get_name(object_index),
		y		: y,
		x		: x,
		room	: room,
		speed	: speed,
		image_index : image_index,
		image_blend : image_blend,
	}
	array_push(_saveData_player, _saveEntity_player);
}
	var _string_player = json_stringify(_saveData_player);
	SaveStringToFile("player", _string_player);

with(obj_caldera) {
	var _saveEntity_caldera = 
	{
		obj	: object_get_name(object_index),
	}
	array_push(_saveData_caldera, _saveEntity_caldera);	
}
	var _string_caldera = json_stringify(_saveData_caldera);
	SaveStringToFile("caldera", _string_caldera);

with(obj_menu) {
	var _saveEntity_menu = 
	{
		obj			: object_get_name(object_index),
		up			: global.KEY_UP,
		down		: global.KEY_DOWN,
		left		: global.KEY_LEFT,
		right		: global.KEY_RIGHT,
		inventory	: global.KEY_INVENTORY,
	}
	array_push(_saveData_menu, _saveEntity_menu);
}
	var _string_menu = json_stringify(_saveData_menu);
	SaveStringToFile("menu", _string_menu);

with(obj_control) {
	var _saveEntity_control = 
	{
		obj			: object_get_name(object_index),
		hora		: global.HORA,
		hambre		: global.HAMBRE,
		cansancio	: global.CANSANCIO,
		dia			: global.DIAS,
		frio		: global.FRIO,
	}
	array_push(_saveData_control, _saveEntity_control);
}
	var _string_control = json_stringify(_saveData_control);
	SaveStringToFile("control", _string_control);


show_debug_message("Player saved: " + _string_player);
show_debug_message("Caldera saved: " + _string_caldera);
show_debug_message("Control saved: " + _string_control);
show_debug_message("Menu saved: " + _string_menu);
show_debug_message("Game saved!");


function SaveStringToFile( _filename, _string) {
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write( _buffer, buffer_string, _string);
	buffer_save( _buffer, ("saved_" + _filename + ".save"));
	buffer_delete( _buffer);
}