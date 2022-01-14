/// @description Paso del tiempo
// You can write your code in this editor
global.HORA = global.HORA + 1;
if (global.HORA == 12) {
	global.HORA = 0;
	global.DIAS = global.DIAS + 1;
	global.CANSANCIO = global.CANSANCIO - 30;
} else {
	alarm[0] = room_speed * TiempoDia;
}