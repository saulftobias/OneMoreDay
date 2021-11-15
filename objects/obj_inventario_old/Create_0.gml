/// @description Creacion del inventario de la partida
// You can write your code in this editor
#macro INVENTORY_SLOTS 15
sprite_index = spr_inventario;
image_speed = 0;
image_index = 0;
rowLength = 6;
inventory = array_create(INVENTORY_SLOTS, -1);
randomize();
inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 0;
