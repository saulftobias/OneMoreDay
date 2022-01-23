switch(argument0) {
	case 0: 
		global.SALIDA = false;
		global.PAUSE = false;
		break;
	case 1:
		show_debug_message("a salir");
		
		with(obj_control) {
			spawnRoom = rm_entrada; //Tiene que ser el dormitorio
			spawnX = 64; // Posicion de la cama
			spawnY = 336;
			dormido = true;
			doTransition = true;
		}
		
		if (global.DIAS_GANAR == global.DIAS) {
			global.WIN = true;
		}
		
		if (global.CANSANCIO  <= 0) {
			global.MUERTE = true;
		}
		
		if (global.CANSANCIO < 40) {
			if (random_range(0,1) == 1) global.MUERTE = true;
		}
		
		if (global.HAMBRE <= 0 or global.FRIO <= 0) {
			global.MUERTE = true;
		}
		
		global.CANSANCIO -= 45;
		global.HAMBRE -= 25;
		if (global.HAMBRE < 0) { global.HAMBRE = 0;}
		global.HORA = 0;
		global.DIAS = global.DIAS + 1;
		

		
		with(obj_inventario) {
			repeat(3 + global.MULT_DIF){
				var xx = 0; repeat(inv_slots) {
					if (ds_inventory[# 0, xx] = item.none) {
						ds_inventory[# 0, xx] = irandom_range(1, item.height-1);
						ds_inventory[# 1, xx] = irandom_range(1, 4);
						break;
					}
					xx += 1;
				}
			}
		}

		if (global.CANSANCIO < 0) {global.CANSANCIO = 0;}
		global.SALIDA = false;
		global.PAUSE = false;
		break;
}