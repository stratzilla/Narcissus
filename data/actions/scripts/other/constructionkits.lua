local constructionKits = {[6115] = 6109, [6114] = 6111, [8692] = 8688, [3901] = 1666, [3902] = 1658, [3903] = 1652, [3904] = 1674, [3905] = 1658, [3906] = 3813, [3907] = 3817, [3908] = 1619, [3909] = 1616, [3910] = 1615, [3911] = 1614, [3912] = 3805, [3913] = 3807, [3914] = 3809, [3915] = 1717, [3916] = 1725,  [3917] = 1732, [3918] = 1775, [3919] = 1770, [3920] = 1750, [3921] = 3832, [3922] = 2095, [3923] = 2098, [3924] = 2064, [3925] = 2584, [3926] = 2116, [3927] = 1728, [3928] = 1442, [3929] = 1446, [3930] = 1447, [3931] = 2034, [3932] = 2601, [3933] = 2080, [3934] = 2084, [3935] = 3821, [3936] = 3811, [3937] = 2101, [3938] = 2105}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if fromPosition.x == CONTAINER_POSITION then
		doPlayerSendCancel(cid, "Put the construction kit on the floor first.")
	elseif getTileHouseInfo(fromPosition) == FALSE then
		doPlayerSendCancel(cid,"You may only construct this inside a house.")
	elseif constructionKits[item.itemid] ~= nil then
	
		if item.itemid >= 3915 or item.itemid <= 3917 or item.itemid >= 3919 or item.itemid <= 3921 then
			doRemoveItem(item.uid)
			doCreateItem(constructionKits[item.itemid], 1, toPosition)
		else
		doTransformItem(item.uid, constructionKits[item.itemid])
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		end
	else
		return FALSE
	end
	return TRUE
end