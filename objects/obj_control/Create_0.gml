/// @description Insert description here
// You can write your code in this editor

TiempoDia = 1;
TiempoHambre = 30;
TiempoFrio = 3;

debug = true;
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

global.ITEMS_DROP = 5; //TODO Dificultades facil 5 hard 3
global.MULT_DIF = 3; //Dificultades Facil 3 dif 1


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
	none		= 0,
	tomato		= 1,
	potato		= 2,
	carrot		= 3,
	artichoke	= 4,
	chilli		= 5,
	gourd		= 6,
	corn		= 7,
	wood		= 8,
	stone		= 9,
	bucket		= 10,
	chair		= 11, 
	picture		= 12,
	axe			= 13,
	potion		= 14,
	starfish	= 15,
	mushroom	= 16,
	height		= 17,
}
