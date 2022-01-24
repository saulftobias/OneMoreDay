/// @description Hambre
// You can write your code in this editor
if (global.HAMBRE > 0 && !global.PAUSE) {
	if(global.HAMBRE < 10) 
			global.HAMBRE = global.HAMBRE - 10;
		 else
			global.HAMBRE = 0;
}
alarm[1] = room_speed * TiempoHambre;

