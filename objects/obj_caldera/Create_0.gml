/// @description Insert description here
// You can write your code in this editor
/// @description Cosas generales del cldentario
// You can write your code in this editor
scale = 2;
show_caldera = false;

encendida = false;
//Tiempos de consumo de combustibles
tiempoMadera = 10;
tiempoCarbon = 4;
tiempoCarbonVegetal = 4;
alarm[0] = room_speed * tiempoMadera;

cld_slots = 3;
cld_slots_width = 3;
cld_slots_height = 1;

selected_slot = 0; //slot seleccionado
pickup_slot = -1; //item cogido

m_slotx = 0; //posicion del mouse
m_sloty = 0;

x_buffer = 2; //separacion entre slots
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

cld_UI_width = 119; //dimensiones del cldentario
cld_UI_height = 82;

spr_cld_UI = spr_caldera_ui;
spr_cld_items = spr_inventrario_items;

spr_cld_items_columns = sprite_get_width(spr_cld_items)/cell_size;
spr_cld_items_rows = sprite_get_height(spr_cld_items)/cell_size;

cld_UI_x = (gui_width * 0.90) - (cld_UI_width * 0.5 * scale); //posicion del inventarioen la gui
cld_UI_y = (gui_height * 0.20) - (cld_UI_height * 0.5 * scale);

info_x = cld_UI_x + (9 * scale); //posicion del apartado de info en la gui
info_y = cld_UI_y + (9 * scale);

slots_x = info_x; //posicion de los slots en la gui 
slots_y = cld_UI_y + (40 * scale);

desc_x = info_x; 
desc_y = cld_UI_y + (156*scale);

//---------Player Info 
//0 = GOLD 
//1 = SILVER
//2 = BRONZE
//3 = NAME

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Caldera";

ds_player_info[# 1, 0] = irandom_range(0,99);
ds_player_info[# 1, 1] = irandom_range(0,99);
ds_player_info[# 1, 2] = irandom_range(0,99);
ds_player_info[# 1, 3] = "";

//---------caldera
//0 = ITEM
//1 = NUMBER

ds_caldera = ds_grid_create(2, cld_slots);



#region Create Items Info Grid
ds_items_info = ds_grid_create(2, item.height);

//--Item Names
var z = 0, i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Wood";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Carrot";


//--Item Descriptions
z = 1; i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Wood";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Victor viñas es un marica dibuja pistolas";

#endregion


ds_caldera[# 0, 0] = item.wood;
ds_caldera[# 1, 0] = irandom_range(1, 4);
ds_caldera[# 0, 1] = item.tomato;
ds_caldera[# 1, 1] = irandom_range(1, 4);
ds_caldera[# 0, 2] = item.carrot;
ds_caldera[# 1, 2] = irandom_range(1, 4);
	







