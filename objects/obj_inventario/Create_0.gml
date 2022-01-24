/// @description Cosas generales del inventario
// You can write your code in this editor
depth = -1;
scale = 2;
show_inventory = false;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0; //slot seleccionado
pickup_slot = -1; //item cogido

m_slotx = 0; //posicion del mouse
m_sloty = 0;

x_buffer = 2; //separacion entre slots
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width = 288; //dimensiones del inventario
inv_UI_height = 192;

spr_inv_UI = spr_inventario_ui;
spr_inv_items = spr_inventrario_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale); //posicion del inventario en la gui
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale); //posicion del apartado de info en la gui
info_y = inv_UI_y + (9 * scale);

slots_x = info_x; //posicion de los slots en la gui 
slots_y = inv_UI_y + (40 * scale);

desc_x = info_x; 
desc_y = inv_UI_y + (156*scale);

//---------Player Info 
//0 = GOLD 
//1 = SILVER
//2 = BRONZE
//3 = NAME

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Inventario";

ds_player_info[# 1, 0] = irandom_range(0,99);
ds_player_info[# 1, 1] = irandom_range(0,99);
ds_player_info[# 1, 2] = irandom_range(0,99);
ds_player_info[# 1, 3] = "";

//---------Inventory
//0 = ITEM
//1 = NUMBER

ds_inventory = ds_grid_create(2, inv_slots);



#region Create Items Info Grid
ds_items_info = ds_grid_create(2, item.height);

//--Item Names
var z = 0, i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Straw";
ds_items_info[# z, i++] = "Wood logs";
ds_items_info[# z, i++] = "Coal";
ds_items_info[# z, i++] = "Raw meat";
ds_items_info[# z, i++] = "Cooked meat";
ds_items_info[# z, i++] = "Expired meat";
ds_items_info[# z, i++] = "Can";
ds_items_info[# z, i++] = "Apple";
ds_items_info[# z, i++] = "Soup"; 

//--Item Descriptions
z = 1; i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Low quality fuel";
ds_items_info[# z, i++] = "Mid quality fuel";
ds_items_info[# z, i++] = "High quality fuel";
ds_items_info[# z, i++] = "Raw food, may decrease stamina and hunger";
ds_items_info[# z, i++] = "Cooked food, decreases hunger";
ds_items_info[# z, i++] = "Expired food, decreases hunger, may generate some illnes";
ds_items_info[# z, i++] = "Can of preserves, decreases hunger. Previously was an MP5 or something like that";
ds_items_info[# z, i++] = "Fruit, decreases hunger";
ds_items_info[# z, i++] = "Soup, decreases hunger and decreases cold level"; 

#endregion
/*
var yy = 0; repeat(3) {
	ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	
	yy += 1;
}
*/
ds_inventory[# 0, 0] = item.wood;
ds_inventory[# 1, 0] = 3;
ds_inventory[# 0, 1] = item.apple;
ds_inventory[# 1, 1] = 3;






