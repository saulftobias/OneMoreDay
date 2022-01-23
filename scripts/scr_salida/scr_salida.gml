switch(argument0) {
	case 0: 
		global.SALIDA = false;
		global.PAUSE = false;
		break;
	case 1:
		show_debug_message("a salir");
		global.CANSANCIO -= 40;
		global.CANSANCIO -= 20;
		
		with(obj_inventario) {
			repeat(3 + global.MULT_DIF){
				var xx = 0; repeat(inv_slots) {
					if (ds_inventory[# 0, xx] = item.none) {
						ds_inventory[# 0, xx] = irandom_range(1, item.height-1);
						ds_inventory[# 1, xx] = irandom_range(1, 4);
						break;
					}
					xx += 1;
				}
			}
		}

		if (global.CANSANCIO < 0) {global.CANSANCIO = 0;}
		global.SALIDA = false;
		global.PAUSE = false;
		break;
}