/// @Gestiona el consumo de combustibles
// You can write your code in this editor
var inv_grid = ds_caldera;


//Recorro los 3 slots de la caldera
for (var i = 0; i < cld_slots; i += 1) {
	
	//El primer slot con items es el que utilizo
	if (inv_grid[# 1, i] > 0) {
		global.CALDERA = true;
		sprite_index = spr_caldera;
		//Resto el item a utilizar
		inv_grid[# 1, i] -= 1;
		//Aplico los cambios surtidos por el item
		switch (inv_grid[# 0, i]) {
			case(item.wood):
				if (global.FRIO < 90) {
					global.FRIO += 35;
				} else {global.FRIO = 100}
				 
				alarm[0] = room_speed * tiempoMadera;
				break;
		
			case(item.coal):
				if (global.FRIO < 90) {
					global.FRIO += 30;
				} else {global.FRIO = 100}
				alarm[0] = room_speed * tiempoCarbon;
				break;
		
			case(item.straw):
				if (global.FRIO < 90) {
					global.FRIO += 10;
				} else {global.FRIO = 100}
				alarm[0] = room_speed * tiempoCarbonVegetal;
				break;
		}
		break;
	} else {
		global.CALDERA = false;
		sprite_index = spr_caldera_off;
		alarm[0] = room_speed;
	}
}