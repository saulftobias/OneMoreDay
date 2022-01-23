/// @description Paso del tiempo
// You can write your code in this editor
if (!global.PAUSE) {
	global.HORA = global.HORA + 1;
}
if (global.HORA == 12) {
	
	if (global.CANSANCIO = 0 or global.HAMBRE = 0 or global.FRIO = 0) {
	
		//PARTIDA PERDIDA
	} 
	
	//LLAMAR MENU
	
	global.HORA = 0;
	global.DIAS = global.DIAS + 1;
	global.CANSANCIO = global.CANSANCIO - 30;
	
	spawnRoom = rm_habitacion; //Tiene que ser el dormitorio
	spawnX = 64; // Posicion de la cama
	spawnY = 336;
	dormido = true;
	doTransition = true;
	
	
	alarm[0] = room_speed * TiempoDia;
} else {
	alarm[0] = room_speed * TiempoDia;
}
