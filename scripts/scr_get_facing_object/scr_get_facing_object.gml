function scr_get_facing_object(obj) {
	var tx = x;
	
	switch (direction) {
	case 0:
		tx += 16;
		break;
	case 180:
		tx -= 16;
		break;
	}
	
	return instance_place(tx, y, obj);
}