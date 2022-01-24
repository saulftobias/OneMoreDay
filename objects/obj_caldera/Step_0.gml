/// @description Cosas referentes a interaccionar con el cld
// You can write your code in this editor

if (keyboard_check_pressed(global.KEY_BOILER))
	show_caldera = !show_caldera;
	
if(!show_caldera) exit; 

#region Mouse Slot
mousex = device_mouse_x_to_gui(0); //posicion del mouse relativa a la vista
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer)*scale; // separacion entre celdas (pixeles por celda)
var cell_ybuff = (cell_size + y_buffer)*scale;

var i_mousex = mousex - slots_x; //posicion del mouse en el cldentario
var i_mousey = mousey - slots_y; //posicion del mouse en el cldentario

var nx = i_mousex div cell_xbuff; //slot especifico seleccionado por el raton
var ny = i_mousey div cell_xbuff;

//Actualizar seleccion solo si el raton esta en el cldentario
if(nx >= 0 and nx < cld_slots_width and ny >= 0 and ny < cld_slots_height) {
	
	//evitar que se cambie la seleccion si clicko entre los bordes del slot
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_ybuff); 
	
	//posicion del mouse en el slot
	if((sx < cell_size*scale) and (sy < cell_size*scale)) {
		m_slotx = nx;
		m_sloty = ny; 
	}
} 

//Set Selected Slot to Mouse Position
selected_slot = min(cld_slots - 1 , m_slotx + (m_sloty*cld_slots_width)); //Indice del slot seleccionado 
#endregion

//Pickup Item

var cld_grid = ds_caldera;
var ss_item = cld_grid[# 0, selected_slot]; //item seleccionado

if(pickup_slot != -1) {
	//apilar items
	if(mouse_check_button_pressed(mb_left)) {
		if(ss_item == item.none) { 
			//caso con el slot vacio
			cld_grid[# 0, selected_slot] = cld_grid[# 0, pickup_slot]; //pongo el slot vacion con la seleccion
			cld_grid[# 1, selected_slot] = cld_grid[# 1, pickup_slot];
			
			cld_grid[# 0, pickup_slot] = item.none; //elimino de la posicion anterior
			cld_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
			
		} else if (ss_item == cld_grid[# 0, pickup_slot]) {
			//compruebo que los slots origen y destino sean diferentes para stackear
			if(selected_slot != pickup_slot) {
				cld_grid[# 1, selected_slot] += cld_grid[# 1, pickup_slot]; //stackeo 
				cld_grid[# 0, pickup_slot] = item.none; //elimino de la posicion anterior
				cld_grid[# 1, pickup_slot] = 0;
			}
			
			pickup_slot = -1;
		} else {
			//si son diferentes items hago swap
			var ss_item_num = cld_grid[# 1, selected_slot];
			
			cld_grid[# 0, selected_slot] = cld_grid[# 0, pickup_slot]; //pongo el slot vacion con la seleccion
			cld_grid[# 1, selected_slot] = cld_grid[# 1, pickup_slot];
			
			cld_grid[# 0, pickup_slot] = ss_item; //elimino de la posicion anterior
			cld_grid[# 1, pickup_slot] = ss_item_num;
			 
			//pickup_slot = -1;
		}
	}
} 
else if(ss_item != item.none) {
	if(mouse_check_button_pressed(mb_right)) { 
		pickup_slot = selected_slot;
	}
}