switch(argument0) {
	case 0: 
		global.SALIDA = false;
		global.PAUSE = false;
		break;
	case 1:
		show_debug_message("a salir");
		global.CANSANCIO -= 40;
		global.CANSANCIO -= 20;
		if (global.CANSANCIO < 0) {global.CANSANCIO = 0;}
		global.SALIDA = false;
		global.PAUSE = false;
		break;
}