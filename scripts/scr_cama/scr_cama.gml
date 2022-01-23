switch(argument0) {
	case 0: 
		global.CAMA = false;
		global.PAUSE = false;
		break;
	case 1:
		show_debug_message("a mimir");
		global.HORA = 0;
		global.DIAS = global.DIAS + 1;
		
		global.CANSANCIO += 40;
		if (global.CANSANCIO > 100) { global.CANSANCIO = 100;}
		
		global.HAMBRE -= 30;
		if (global.HAMBRE < 0) { global.HAMBRE = 0;}
		
		global.CAMA = false;
		global.PAUSE = false;
		break;
}