if(!global.MENU) exit;

input_up_p		= keyboard_check_pressed(global.KEY_UP);
input_down_p	= keyboard_check_pressed(global.KEY_DOWN);
input_enter_p	= keyboard_check_pressed(global.KEY_ENTER);

var ds_grid  = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if (global.INPUTTING) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(global.KEY_RIGHT) - keyboard_check_pressed(global.KEY_LEFT);
			if (hinput != 0) {
				// TODO audio para cuando se este cambiando aqui
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]]) - 1);
			}
			break;
		case menu_element_type.slider:
			var hinput = keyboard_check(global.KEY_RIGHT) - keyboard_check(global.KEY_LEFT);
			if (hinput != 0) {
				ds_grid[# 3, menu_option[page]] += hinput * 0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
			break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(global.KEY_RIGHT) - keyboard_check_pressed(global.KEY_LEFT);
			if (hinput != 0) {
				// TODO audio para cuando se este cambiando aqui
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
			break;
		case menu_element_type.input:	
				var kk = keyboard_lastkey;
				if (kk != vk_enter) {
					// if (kk != ds_grid[# 3, menu_option[page]]) // TODO audio
					ds_grid[# 3, menu_option[page]] = kk;
					variable_global_set(ds_grid[# 2, menu_option[page]], kk);
				}
				
			break;
	}
}
if (!global.INPUTTING) {
	var ochange = input_down_p - input_up_p;
	if (ochange != 0) {
		menu_option[page] += ochange;
		if (menu_option[page] > ds_height - 1) { 
			menu_option[page] = 0;
		} 
		if (menu_option[page] < 0) {
			menu_option[page] = ds_height - 1;
		}
	}
}

if (input_enter_p) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner:	script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer:	page = ds_grid[# 2, menu_option[page]];	break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle:	if (global.INPUTTING) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);}
		case menu_element_type.input:
		
			global.INPUTTING = !global.INPUTTING
			break;
	}
	
	// TODO se puede meter audio a las transiciones si quereis @vitu @ferto
}

