/// @description Insert description here

draw_sprite_stretched(
	spr_inventario_hueco,
	0,
	x-6,
	y-6,
	12+rowLength*36,
	12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36
);

for (var i = 0; i < INVENTORY_SLOTS; i += 1) {
	var xx = x + (i mod rowLength) * 36 + 2;
	var yy = y + (i div rowLength) * 36 + 2;
	draw_sprite(spr_inventario_slot, 0, xx, yy)
	
	if (inventory[i] != -1) {
		draw_sprite(spr_item, inventory[i], xx, yy);	
	}
}
 
 