/// @description Frio
// You can write your code in this editor
if (global.CALDERA) {
	if (global.FRIO < 100 && !global.PAUSE)
		global.FRIO = global.FRIO + 10;
} else {
	if (global.FRIO > 0 && !global.PAUSE)
		global.FRIO = global.FRIO - 10;
}
alarm[2] = room_speed * TiempoFrio;
