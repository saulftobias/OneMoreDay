
global.INPUTTING	= false;


display_set_gui_size(global.VIEW_WIDTH, global.VIEW_HEIGTH);

enum menu_pagex {
	main, settings, audio, controls, dificulty, graphics, n_menu_pages
}

enum menu_element_typex {
	script_runner, page_transfer, slider, shift, toggle, input
}

// MENU PAGES
ds_menu_main = scr_create_menu_page(
	["CONTINUAR",		menu_element_type.script_runner,	scr_a_la_cama],
);


page = 0;
menu_pages	= [ds_menu_main]; 

var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++;
}

