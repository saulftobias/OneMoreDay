/// @description Hambre
// You can write your code in this editor
if (global.HAMBRE > 0 && !global.PAUSE) {
	global.HAMBRE = global.HAMBRE - 10;
}
alarm[1] = room_speed * TiempoHambre;
