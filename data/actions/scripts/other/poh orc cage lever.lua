local stonePos = {x=32780,y=32231,z=8}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1946 then
		doCreateItem (387, 1, stonePos)
	else
		local h = getTileItemById(stonePos, 387)
		doRemoveItem(h.uid)
	end
	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end