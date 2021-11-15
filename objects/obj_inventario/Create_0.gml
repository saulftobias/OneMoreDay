/// @description Cosas generales del inventario
// You can write your code in this editor
depth = -1;
scale = 2;
show_inventory = true;

inv_slots = 17; //numero de slots del inventario
inv_slots_width = 8; //numero de slots por fila
inv_slots_height = 3; //numero de slots por columna

x_buffer = 2; //separacion horizontal entre slots
y_buffer = 4; //separacion vertical entre slots

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;
inv_UI_width = 288; //ancho de la interfaz del inventario 288
inv_UI_heigth = 192; //alto de la interfaz del inventario 192

spr_inv_UI = spr_inventario_ui;
spr_inv_items = spr_inventrario_items;

spr_inv_items_columns = sprite_get_width((spr_inv_items)/cell_size); //numero de columnas del sprite de los items
spr_inv_items_rows = sprite_get_height((spr_inv_items)/cell_size);

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_heigth * 0.5 * scale);

//panel superior del inventario
info_x = inv_UI_x + (9 * scale); //son 9 pixeles de offset en el sprite
info_y = inv_UI_y + (9 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40*scale);

//Player info
//0 = GOLD
//1 = SILVER
//2 = BRONZE
//3 = NAME

ds_player_info = ds_grid_create(2, 4); 
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0,99);
ds_player_info[# 1, 1] = irandom_range(0,99);
ds_player_info[# 1, 2] = irandom_range(0,99);
ds_player_info[# 1, 3] = "Player";

//Inventario
//0 = ITEM
//2 = NUMBER

ds_inventory = ds_grid_create(2, inv_slots);

//Items

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
	heigth		= 17, //numero de items
}

ds_inventory[# 0, 0] = item.bucket;
ds_inventory[# 1, 0] = 1;


var yy = 0; repeat(inv_slots) {
	ds_inventory[# 0, yy] = irandom_range(1, item.heigth-1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy += 1;
}










