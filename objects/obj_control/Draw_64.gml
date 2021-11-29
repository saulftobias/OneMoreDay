/// @description Fundido negro entre habitaciones 
// You can write your code in this editor
if(doTransition) {
	//Handle balack fade
	if(room != spawnRoom) {
		blackAlpha += 0.1;
		if(blackAlpha >= 1) { room_goto(spawnRoom) }
	} else {
		blackAlpha -= 0.1;
		if(blackAlpha <= 0) { doTransition = false; }
	}
	
	//Fade negro
	c = c_black;
	draw_set_alpha(blackAlpha);
	draw_rectangle_colour(0, 0, guiWidth, guiHeigth, c, c, c, c, false); 
	draw_set_alpha(1); 
}