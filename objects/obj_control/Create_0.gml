/// @description Insert description here
// You can write your code in this editor
debug = false;
randomize();
room_goto(rm_comedor); 

guiWidth = display_get_gui_width();
guiHeigth = display_get_gui_height();  
blackAlpha = 0; 

spawnRoom = -1; 
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
doTransition = false; 
