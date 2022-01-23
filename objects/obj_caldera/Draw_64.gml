if(!show_caldera or room != rm_entrada or global.PAUSE) exit;

//-------caldera Back
draw_sprite_part_ext(
	spr_cld_UI, 0, cell_size, 0, cld_UI_width, cld_UI_height, 
	cld_UI_x, cld_UI_y, scale, scale, c_white, 1
);

var info_grid = ds_player_info;

draw_set_font(fnt_text_24);
var c = c_black; 
draw_text_color(info_x, info_y, info_grid[# 0, 3] + ": " + info_grid[# 1, 3], c,c,c,c, 1);

//draw_set_font(fnt_small_digits);
//var yy = 0; repeat(3){
//	draw_text_color(
//		info_x + (192*scale) + ((15+18)*scale*yy), info_y, 
//		string(info_grid[# 1, yy]), c,c,c,c, 1
//	);
//	yy += 1;
//}

//------caldera
var ii, ix, iy, xx, yy, sx, sy, iitem, cld_grid;
ii = 0; ix = 0; iy = 0; cld_grid = ds_caldera;

repeat(cld_slots){
	//x,y location for slot
	xx = slots_x + ((cell_size+x_buffer)*ix*scale);
	yy = slots_y + ((cell_size+y_buffer)*iy*scale);
	
	//Item
	iitem = cld_grid[# 0, ii];
	sx = (iitem mod spr_cld_items_columns)*cell_size;
	sy = (iitem div spr_cld_items_columns)*cell_size;
	
	//Draw Slot and Item
	draw_sprite_part_ext(spr_cld_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	//pinto el slot de un modo u otro en funcion de si esta seleccionado
	switch(ii) {
		case selected_slot:
			if(iitem > 0) draw_sprite_part_ext(
				spr_cld_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_cld_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
			break;
			
		case pickup_slot:
			if(iitem > 0) draw_sprite_part_ext(
				spr_cld_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, .2
			); 
			break;
		
		default:
			if(iitem > 0) draw_sprite_part_ext(
				spr_cld_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			break;
	}
	
	//Draw item Number
	if(iitem > 0){
		var number = cld_grid[# 1, ii];
		draw_text_color(xx, yy, string(number), c,c,c,c, 1);
	}
	
	//Increment
	ii += 1;
	ix = ii mod cld_slots_width;
	iy = ii div cld_slots_width;
}
 
/*
//Draw Item Description
var iinfo_grid = ds_items_info, description = "";
iitem = cld_grid[# 0, selected_slot]; 

if (iitem > 0) {
	draw_set_font(fnt_text_12); 
	description = iinfo_grid[# 0, iitem] + ". " + iinfo_grid[# 1, iitem];
	c = c_black;
	draw_text_ext_color(desc_x, desc_y, description, string_height("M"), cld_UI_width*scale - (x_buffer*2), c, c, c, c, 1);
}

*/

if(pickup_slot != -1) {
	//Item
	iitem = cld_grid[# 0, pickup_slot];
	sx = (iitem mod spr_cld_items_columns)*cell_size;
	sy = (iitem div spr_cld_items_columns)*cell_size;
	
	//pinto el item donde este el raton
	draw_sprite_part_ext(
		spr_cld_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 1
	);
	
	var inum = cld_grid[# 1, pickup_slot];
	draw_text_color(mousex + (cell_size*scale), mousey, string(inum), c,c,c,c, 1);
}

