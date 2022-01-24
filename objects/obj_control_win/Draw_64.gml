if(!global.WIN) exit;

var gwidth	 = global.VIEW_WIDTH, gheight  = global.VIEW_HEIGTH;


var ds_grid  = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 32,	x_buffer = 16;
var start_y  = (gheight / 2) - ((((ds_height - 1) / 2) * y_buffer)), start_x = gwidth / 2;


// Draw Pause MENU "BACK"
var c = c_black;
draw_rectangle_color(0, 0, gwidth, gheight, c, c, c, c, false);


// Draw Elements on Left Side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo, xx;

var yy = 0;
repeat(ds_height) {
	lty = start_y + (yy * y_buffer);
	c = c_white;
	xo = 0;
	
	if(yy == menu_option[page]) {
		c = c_orange;
		xo = -(x_buffer/2);
	}
	xx = yy*(-50);
	
	draw_text_color(870, 200, "LA GUERRA A TERMINADO", c_white, c_white, c_white, c_white, 1);
	draw_text_color(860, 250, "HAS SOBREVIVIDO :)", c_white, c_white, c_white, c_white, 1);
	draw_text_color(ltx + xo + 100 + xx, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	yy++;
}

// Draw Dividing Line
//draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);

// Draw Elements on Rigth side

draw_set_halign(fa_left);


var rtx = start_x + x_buffer, rty;

yy = 0;
repeat(ds_height) {
	rty = start_y + (yy * y_buffer);
	
	switch (ds_grid [# 1, yy]) {
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = " << ";
			var right_shift = " >> ";
			var c = c_white;
			
			if (current_val == 0) left_shift = "";
			if (current_val == array_length(ds_grid[# 4, yy]) - 1) right_shift = "";
			
			if(global.INPUTTING && yy == menu_option[page]) {c = c_yellow;}
			
			draw_text_color(rtx, rty, left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);
			break;
		
		case menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			var c = c_white;
			
			if(global.INPUTTING && yy == menu_option[page]) {c = c_yellow;}
			draw_line_width(rtx, rty, rtx + len, rty, 2);
			draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", c, c, c, c, 1);
			break;
			
		case menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			var c = c_white;
			
			if(global.INPUTTING && yy == menu_option[page]) {c = c_yellow;}
			if (current_val == 0) {
				c1 = c;
				c2 = c_gray;
			} else {
				c1 = c_gray;
				c2 = c;
			}
			draw_text_color(150, 200, "Saliendo de casa conseguiras mas objetos pero perderas estamina", c_white, c_white, c_white, c_white, 1);
			draw_text_color(rtx, rty, "NO", c1, c1, c1, c1, 1);
			draw_text_color(rtx + 64, rty, "SI", c2, c2, c2, c2, 1);
			break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			var c = c_white
			
			switch(current_val) {
				case vk_up:		string_val = "UP KEY";		break;
				case vk_left:	string_val = "LEFT KEY";	break;
				case vk_right:	string_val = "RIGTH KEY";	break;
				case vk_down:	string_val = "DOWN KEY";	break;
				case ord("I"):	string_val = "I";			break;
				default:		string_val = chr(current_val);	break;
			}
			if(global.INPUTTING && yy == menu_option[page]) {c = c_yellow;} 
			draw_text_color(rtx, rty, string_val, c, c, c, c, 1);
			
			break;
	}
	yy++;
}

draw_set_valign(fa_top);