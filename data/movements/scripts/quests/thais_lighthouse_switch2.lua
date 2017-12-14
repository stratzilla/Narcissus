function onStepOut(cid, item, position, fromPosition)
	local pos = {x=32233,y=32276,z=9}
	local v = getTileItemById(pos, 1387)
	doTransformItem(v.uid, 424)
	doTransformItem(item.uid, item.itemid + 1)
end