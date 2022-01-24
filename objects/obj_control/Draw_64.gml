/// @description Fundido negro entre habitaciones 
// You can write your code in this editor

if(doTransition) {
	
	//Handle balack fade
	if(room != spawnRoom or dormido) {
		blackAlpha += 0.02;
		if(blackAlpha >= 1) { 
			
			room_goto(spawnRoom);
			dormido = false;
			
		}
	} else {
		blackAlpha -= 0.02;
		if(blackAlpha <= 0) { doTransition = false; }
	}
	
	//Fade negro
	c = c_black;
	draw_set_alpha(blackAlpha);
	draw_rectangle_colour(0, 0, guiWidth, guiHeigth, c, c, c, c, false); 
	draw_set_alpha(1); 
}

draw_set_color(c_white);
draw_set_font(fnt_text_24);
draw_sprite_stretched(spr_reloj, global.HORA, 32, 0, 60, 60);
draw_text(108,15,"Dia: " + string(global.DIAS)); 
draw_text(478,15,"Hambre: " + string(global.HAMBRE) + "%"); 
draw_text(758,15,"Cansancio: " + string(global.CANSANCIO) + "%"); 
draw_text(1100,15,"Frio: " + string(global.FRIO) + "%"); 