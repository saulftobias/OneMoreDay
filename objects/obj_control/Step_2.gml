/// @description pausa el juego

if (keyboard_check_pressed(vk_escape)) {
	global.MENU	 = !global.MENU;
	global.PAUSE = !global.PAUSE;
}

if (global.MUERTE) {
	global.PAUSE = true;
}