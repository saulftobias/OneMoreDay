global.INPUTTING	= false;

display_set_gui_size(global.VIEW_WIDTH, global.VIEW_HEIGTH);

enum menu_page2 {
	main, settings, audio, controls, dificulty, graphics, n_menu_pages
}

enum menu_element_type2 {
	script_runner, page_transfer, slider, shift, toggle, input
}

// MENU PAGES
ds_menu_salir = scr_create_menu_page(
	["DESEA DORMIR?",		menu_element_type2.toggle,	scr_cama,		0,	["NO","SI"]]
);


page = 0;
menu_pages	= [ds_menu_salir]; 

var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++;
}

