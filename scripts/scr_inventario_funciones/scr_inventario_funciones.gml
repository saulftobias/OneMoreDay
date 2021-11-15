// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InventorySearch(rootObject, itemType) {
	for (var i = 0; i < INVENTORY_SLOTS; i += 1) {
		if (rootObject.inventory[i] == itemType)
			return(i);
	}
	return(-1); 
}

function InventoryRemove(rootObject, itemType) {
	var slot = InventorySearch(rootObject, itemType);
	if (slot != -1) {
		with (rootObject) inventory[slot] = -1;
		return true;
	}
	else return false;
}

function InventoryAdd(rootObject, itemType) {
	var slot = InventorySearch(rootObject, -1);
	if (slot != -1) {
		with (rootObject) inventory[slot] = itemType;
		return true;
	}
	else return false;
}