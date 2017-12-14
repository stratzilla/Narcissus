local upFloorIds = {3678, 5543, 1386}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(upFloorIds, item.itemid) == TRUE then
		fromPosition.y = fromPosition.y + 1
		fromPosition.z = fromPosition.z - 1
	elseif item.actionid == 9800 then		--Draw wells
		fromPosition.z = fromPosition.z + 1		
	else
		fromPosition.z = fromPosition.z + 1
	end
	doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end