/// @description Frio
// You can write your code in this editor
if (!global.CALDERA) {
	if (global.FRIO > 0 && !global.PAUSE) {
		if(global.FRIO < 10) {
			global.FRIO = global.FRIO - 10;
		}
		 else {
			global.FRIO = 0;
		 }
	}
}
alarm[2] = room_speed * TiempoFrio;
