function onStepIn(cid, item, position, fromPosition)
	addEvent(transformBack, 10000, {oldItemID = item.itemid, _position = position})
	if item.itemid == 670 then
		doTransformItem(item.uid, 6594)
	elseif item.itemid >= 6580 and item.itemid <= 6593 then
		doTransformItem(item.uid, item.itemid + 15)
	end
	return true
end

function transformBack(parameters)
	parameters._position.stackpos = 0
	doTransformItem(getThingfromPos(parameters._position).uid, parameters.oldItemID)
	return true
end