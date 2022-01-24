
global.INPUTTING	= false;


display_set_gui_size(global.VIEW_WIDTH, global.VIEW_HEIGTH);


// MENU PAGES
ds_menu_main = scr_create_menu_page(
	["REINICIAR",		menu_element_type.script_runner,	scr_new_game],
	["SALIR",			menu_element_type.script_runner,	scr_exit_game]
);


page = 0;
menu_pages	= [ds_menu_main]; 

var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++;
}

