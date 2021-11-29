/// @description Insert description here
// You can write your code in this editor

TiempoDia = 2;
TiempoHambre = 3;
TiempoFrio = 3;

debug = false;
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


guiWidth = display_get_gui_width();
guiHeigth = display_get_gui_height();  
blackAlpha = 0; 

spawnRoom = -1; 
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
doTransition = false; 
