switch(argument0) {
	case 0: 
		global.CAMA = false;
		global.PAUSE = false;
		break;
	case 1:
	
		if (global.DIAS_GANAR == global.DIAS) {
		//ganar
		}
	
	
		with(obj_control) {
			spawnRoom = rm_habitacion; //Tiene que ser el dormitorio
			spawnX = 64; // Posicion de la cama
			spawnY = 336;
			dormido = true;
			doTransition = true;
		}
	
		if (global.HAMBRE <= 0 or global.FRIO <= 0) {
			global.MUERTE = true;
		} 
	
		show_debug_message("a mimir");
		global.HORA = 0;
		global.DIAS = global.DIAS + 1;
		
		global.CANSANCIO += 35;
		if (global.CANSANCIO > 100) { global.CANSANCIO = 100;}
		
		global.HAMBRE -= 20;
		if (global.HAMBRE < 0) { global.HAMBRE = 0;}
		
		global.CAMA = false;
		global.PAUSE = false;
		break;
}