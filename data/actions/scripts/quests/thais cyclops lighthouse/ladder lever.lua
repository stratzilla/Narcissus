local holePos = {x=32225,y=32276,z=8}
	
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		local v = getTileItemById(holePos, 9021)
			doTransformItem(v.uid, 369)
	else
		local v = getTileItemById(holePos, 369)
			doTransformItem(v.uid, 9021)
	end
end
