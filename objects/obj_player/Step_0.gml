/// @description Movimientos
// You can write your code in this editor
if (!global.PAUSE) {
	if keyboard_check(global.KEY_RIGHT) {
		direction = 0;
		speed = v;
	}

	if keyboard_check(global.KEY_LEFT) {
		direction = 180;
		speed = v;
	}

	if keyboard_check(vk_nokey){
		speed = 0;
	}
}


//Animacion movimiento

if speed > 0 {
	image_speed = 1;
	if (!audio_is_playing(snd_andar)) audio_play_sound(snd_andar,10,false);
	
}
else {
	image_speed = 0;
	image_index = 0;
	audio_stop_sound(snd_andar);
}

//Selector sprite

switch (direction) {
	case 0:
		sprite_index = spr_player_rigth;
		break;
	case 180:
		sprite_index = spr_player_left;
		break;
}

//checkeo cambio habitacion

var inst = instance_place(x, y, obj_transition);
if (inst != noone) {
	with(obj_control) {
		if(!doTransition) {
			if (!audio_is_playing(snd_puerta)) audio_play_sound(snd_puerta, 10, false);
			spawnRoom = inst.targetRoom;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			doTransition = true;
		}
	}
}

// Interaccion con elementos
if (keyboard_check_pressed(global.KEY_INTERACT)) {
	var salida	= scr_get_facing_object(obj_puerta_salida);
	var cama	= scr_get_facing_object(obj_cama);
	if (salida) {
		global.SALIDA = true;
		global.PAUSE = true;
		speed = 0;
	} 
	if (cama) {
		global.CAMA = true;
		global.PAUSE = true;
		speed = 0;
	}
}