/// @description Cosas referentes a interaccionar con el inv
// You can write your code in this editor

if (keyboard_check_pressed((ord("I"))))
	show_inventory = !show_inventory;
	
if(!show_inventory) exit; 

#region Mouse Slot
mousex = device_mouse_x_to_gui(0); //posicion del mouse relativa a la vista
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer)*scale; // separacion entre celdas (pixeles por celda)
var cell_ybuff = (cell_size + y_buffer)*scale;

var i_mousex = mousex - slots_x; //posicion del mouse en el inventario
var i_mousey = mousey - slots_y; //posicion del mouse en el inventario

var nx = i_mousex div cell_xbuff; //slot especifico seleccionado por el raton
var ny = i_mousey div cell_xbuff;

//Actualizar seleccion solo si el raton esta en el inventario
if(nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height) {
	
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
selected_slot = min(inv_slots - 1 , m_slotx + (m_sloty*inv_slots_width)); //Indice del slot seleccionado 
#endregion

//Pickup Item

var inv_grid = ds_inventory;
var inv_info = ds_items_info;
var ss_item = inv_grid[# 0, selected_slot]; //item seleccionado

if(pickup_slot != -1) {
	//apilar items
	if(mouse_check_button_pressed(mb_left)) {
		if(ss_item == item.none) { 
			//caso con el slot vacio
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot]; //pongo el slot vacion con la seleccion
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = item.none; //elimino de la posicion anterior
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
			
		} else if (ss_item == inv_grid[# 0, pickup_slot]) {
			//compruebo que los slots origen y destino sean diferentes para stackear
			if(selected_slot != pickup_slot) {
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot]; //stackeo 
				inv_grid[# 0, pickup_slot] = item.none; //elimino de la posicion anterior
				inv_grid[# 1, pickup_slot] = 0;
			}
			
			pickup_slot = -1;
		} else {
			//si son diferentes items hago swap
			var ss_item_num = inv_grid[# 1, selected_slot];
			
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot]; //pongo el slot vacion con la seleccion
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = ss_item; //elimino de la posicion anterior
			inv_grid[# 1, pickup_slot] = ss_item_num;
			 
			//pickup_slot = -1;
		}
	}
} 

//Use item
if (keyboard_check_pressed((ord("U")))) {
	switch (inv_grid[# 0, selected_slot]) {
		case (item.cooked_meat):
			if (global.HAMBRE < 80)
				global.HAMBRE += 20;
			else
				global.HAMBRE = 100;
			break;
		
		case (item.raw_meat):
			if (global.HAMBRE < 95)
				global.HAMBRE += 5;
			else
				global.HAMBRE = 100;
			break;
			
		case (item.expired_meat):
			if (global.HAMBRE < 98)
				global.HAMBRE += 2;
			else
				global.HAMBRE = 100;
			if (global.CANSANCIO > 10)
				global.CANSANCIO -= 10;
			else
				global.CANSANCIO = 0;
			break;
		
		case (item.apple):
			if (global.HAMBRE < 90)
				global.HAMBRE += 10;
			else
				global.HAMBRE = 100;
			break;
		
		case (item.can):
			if (global.HAMBRE < 75)
				global.HAMBRE += 25;
			else
				global.HAMBRE = 100;
			break;
			
		case (item.soup):
			if (global.HAMBRE < 75)
				global.HAMBRE += 15;
			else
				global.HAMBRE = 100;
				
			if (global.FRIO < 85)
				global.HAMBRE += 15;
			else
				global.HAMBRE = 100;
				
			break;
		
		case (item.straw):
			for (var i = 0; i < obj_caldera.cld_slots; i++) {
				if (obj_caldera.ds_caldera[# 0, i] == item.straw)
					obj_caldera.ds_caldera[# 1, i] += 1;
			}
			break;
		
		case (item.coal):
			for (var i = 0; i < obj_caldera.cld_slots; i++) {
				if (obj_caldera.ds_caldera[# 0, i] == item.coal)
					obj_caldera.ds_caldera[# 1, i] += 1;
			}
			break;
			
		case (item.wood):
			for (var i = 0; i < obj_caldera.cld_slots; i++) {
				if (obj_caldera.ds_caldera[# 0, i] == item.wood)
					obj_caldera.ds_caldera[# 1, i] += 1;
			}
			break;
			
		default:
			break;
	
	}
	inv_grid[# 1, selected_slot] -= 1;
	
}

//Delete items when end uses

if (inv_grid[# 1, selected_slot] < 1)
	inv_grid[# 0, selected_slot] = 0;

else if(ss_item != item.none) {
	if(mouse_check_button_pressed(mb_right)) { 
		pickup_slot = selected_slot;
	}
}