/// @description menú del juego

global.VIEW_WIDTH	= camera_get_view_width(view_camera[0]);
global.VIEW_HEIGTH	= camera_get_view_height(view_camera[0]);

global.PAUSE		 = true;
global.MENU			 = true;
global.SALIDA		 = false;
global.CAMA			 = false;
global.A_LA_CAMA	 = false;
global.MUERTE		 = false;
global.WIN			 = false;
global.KEY_ENTER	 = vk_enter;
global.KEY_INVENTORY = ord("I");
global.KEY_BOILER	 = ord("C");
global.KEY_USAGE	 = ord("U");
global.KEY_INTERACT	 = ord("E");
global.KEY_LEFT		 = vk_left;
global.KEY_RIGHT	 = vk_right;
global.KEY_UP		 = vk_up;
global.KEY_DOWN		 = vk_down;


global.INPUTTING	= false;
global.SONIDO		= 0.5;


display_set_gui_size(global.VIEW_WIDTH, global.VIEW_HEIGTH);

enum menu_page {
	main, settings, audio, controls, dificulty, graphics, n_menu_pages
}

enum menu_element_type {
	script_runner, page_transfer, slider, shift, toggle, input
}

// MENU PAGES
ds_menu_main = scr_create_menu_page(
	["RESUME",		menu_element_type.script_runner,	scr_resume_game],
	["SAVE GAME",	menu_element_type.script_runner,	scr_save_game],
	["RELOAD",		menu_element_type.script_runner,	scr_reload_game],
	["NEW GAME",	menu_element_type.script_runner,	scr_new_game],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT GAME",	menu_element_type.script_runner,	scr_exit_game]
);

ds_settings = scr_create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["DIFFICULTY",	menu_element_type.page_transfer,	menu_page.dificulty],
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_audio = scr_create_menu_page(
	["MASTER",		menu_element_type.slider,			scr_change_volume,		0.5,		[0, 1]],
	//["SOUNDS",	menu_element_type.slider,			scr_change_volume,		0.2,		[0, 1]],
	//["MUSIC",		menu_element_type.slider,			scr_change_volume,		1,			[0, 1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_difficulty = scr_create_menu_page(
	["DIFFICULTY",		menu_element_type.shift,		scr_change_dificulty,	0,		["EASY", "MED", "HARD"]], //TODO cambiar nombres
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_graphics = scr_create_menu_page(
	["RESOLUTION",	menu_element_type.shift,			scr_change_resolution,	1,		["1", "2", "3"]], //TODO poner resoluciones
	//["WINDOW MODE",	menu_element_type.toggle,			scr_change_resolution,	1,		["FULLSCREEN", "WINDOWED"]],  No llega a funcionar bien
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = scr_create_menu_page(
	["LEFT",		menu_element_type.input,			"KEY_LEFT",				vk_left],
	["RIGHT",		menu_element_type.input,			"KEY_RIGHT",			vk_right],
	["INVENTORY",	menu_element_type.input,			"KEY_INVENTORY",		ord("I")],
	["USAGE",		menu_element_type.input,			"KEY_USAGE",			ord("U")],
	["BOILER",		menu_element_type.input,			"KEY_BOILER",			ord("C")],
	["INTERACT",	menu_element_type.input,			"KEY_INTERACT",			ord("E")],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;
menu_pages	= [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_controls, ds_menu_difficulty, ds_menu_graphics]; 

var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++;
}


audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);