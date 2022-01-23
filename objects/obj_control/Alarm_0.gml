/// @description Paso del tiempo
// You can write your code in this editor
if (!global.PAUSE) {
	global.HORA = global.HORA + 1;
}
if (global.HORA == 12) {
	
	global.HORA = 0;
	global.DIAS = global.DIAS + 1;
	global.CANSANCIO = global.CANSANCIO - 30;
	
	alarm[0] = room_speed * TiempoDia;
	global.PAUSE = true;
	global.A_LA_CAMA = true;
} else {
	alarm[0] = room_speed * TiempoDia;
}
