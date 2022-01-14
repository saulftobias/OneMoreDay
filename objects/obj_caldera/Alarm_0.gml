/// @Gestiona el consumo de combustibles
// You can write your code in this editor
var inv_grid = ds_caldera;


//Recorro los 3 slots de la caldera
for (var i = 0; i < cld_slots; i += 1) {
	
	//El primer slot con items es el que utilizo
	if (inv_grid[# 1, i] > 0) {
		encendida = true;
		//Resto el item a utilizar
		inv_grid[# 1, i] -= 1;
		//Aplico los cambios surtidos por el item
		switch (inv_grid[# 0, i]) {
			case(item.wood):
				global.FRIO += 10;
				alarm[0] = room_speed * tiempoMadera;
				break;
		
			case(item.tomato):
				global.FRIO += 10;
				alarm[0] = room_speed * tiempoCarbon;
				break;
		
			case(item.carrot):
				global.FRIO += 10;
				alarm[0] = room_speed * tiempoCarbonVegetal;
				break;
		}
		break;
	} else {
		encendida = false;
		alarm[0] = room_speed * 2;
	}
}