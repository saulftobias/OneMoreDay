/// @description Insert description here
// You can write your code in this editor

TiempoDia = 4;
TiempoHambre = 10;
TiempoFrio = 8;

global.DIAS_GANAR = random_range(15, 25);
//global.DIAS_GANAR = 3;

randomize();
room_goto(rm_comedor); 
alarm[0] = room_speed * TiempoDia;
alarm[1] = room_speed * TiempoHambre;
alarm[2] = room_speed * TiempoFrio;
global.DIAS = 1;

global.HORA = 0;
global.HAMBRE = 100;
global.CANSANCIO = 100;
global.FRIO = 100;
global.CALDERA = 0;
global.SONIDO = true;

global.ITEMS_DROP = 5; //TODO Dificultades facil 5 hard 3
global.MULT_DIF = 1; //Dificultades Facil 3 dif 1

audio_play_sound(snd_hollow, 10, true);

guiWidth = display_get_gui_width();
guiHeigth = display_get_gui_height();  
blackAlpha = 0; 

dormido = false;
spawnRoom = -1; 
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
doTransition = false; 

//---------Items
enum item {
	none		 = 0,
	straw		 = 1,
	wood		 = 2,
	coal		 = 3,
	raw_meat	 = 4,
	cooked_meat  = 5,
	expired_meat = 6,
	can		     = 7,
	apple		 = 8,
	soup		 = 9,
	height		 = 10,
}
