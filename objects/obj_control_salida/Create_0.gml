global.INPUTTING	= false;


display_set_gui_size(global.VIEW_WIDTH, global.VIEW_HEIGTH);

enum menu_page1 {
	main, settings, audio, controls, dificulty, graphics, n_menu_pages
}

enum menu_element_type1 {
	script_runner, page_transfer, slider, shift, toggle, input
}

// MENU PAGES
ds_menu_salir = scr_create_menu_page(
	["DESEA SALIR?",		menu_element_type.toggle,	scr_salida,		0,	["NO","SI"]]
);


page = 0;
menu_pages	= [ds_menu_salir]; 

var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++;
}

