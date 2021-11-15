/// @description Movimientos
// You can write your code in this editor
if keyboard_check(vk_right) {
	direction = 0;
	speed = v;
}

if keyboard_check(vk_left) {
	direction = 180;
	speed = v;
}

if keyboard_check(vk_nokey){
	speed = 0;
}


//Animacion movimiento

if speed > 0 {
	image_speed = 1;
}
else {
	image_speed = 0;
	image_index = 0;
}

//Selector sprite

switch (direction) {
	case 0:
		sprite_index = spr_prueba_player_rigth;
		break;
	case 180:
		sprite_index = spr_prueba_player_left;
		break;
}