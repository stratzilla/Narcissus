local eWeps = {8906, 8907, 8909, 8908, 7840, 7839, 7850, 7838, 7840, 7839, 7850, 7838, 7758, 7777, 7868, 7883, 7757, 7776, 7867, 7882, 7756, 7775, 7866, 7881, 7755, 7774, 7865, 7880, 7754, 7773, 7864, 7879, 7753, 7772, 7863, 7878, 7744, 7763, 7854, 7869, 7745, 7764, 7855, 7870, 7746, 7765, 7856, 7871, 7747, 7766, 7857, 7872, 7748, 7767, 7858, 7873, 7749, 7768, 7859, 7874, 7750, 7769, 7860, 7875, 7751, 7770, 7861, 7876, 7752, 7771, 7862, 7877}

function onCombat(cid, target)													--while player has combat status
local rightItem = getPlayerSlotItem(cid, 5)										--item held in the right hand
local leftItem = getPlayerSlotItem(cid, 6)										--item held in the left hand
	if isInArray(eWeps, rightItem.itemid) then									--check if player has an enchanted weapon in right hand
		if getItemAttribute(rightItem.uid, "charges") <= 1 then
		if rightItem.itemid == 7744 or  rightItem.itemid == 7763 or  rightItem.itemid == 7854 or  rightItem.itemid == 7869 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2383)
			elseif rightItem.itemid == 7745 or  rightItem.itemid == 7764 or  rightItem.itemid == 7855 or  rightItem.itemid == 7870 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7383)
			elseif rightItem.itemid == 7746 or  rightItem.itemid == 7765 or  rightItem.itemid == 7856 or  rightItem.itemid == 7871 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7384)
			elseif rightItem.itemid == 7747 or  rightItem.itemid == 7766 or  rightItem.itemid == 7857 or  rightItem.itemid == 7872 then
				ddoRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7406)
			elseif rightItem.itemid == 7748 or  rightItem.itemid == 7767 or  rightItem.itemid == 7858 or  rightItem.itemid == 7873 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7402)
			elseif rightItem.itemid == 7749 or  rightItem.itemid == 7768 or  rightItem.itemid == 7859 or  rightItem.itemid == 7874 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2429)
			elseif rightItem.itemid == 7750 or  rightItem.itemid == 7769 or  rightItem.itemid == 7860 or  rightItem.itemid == 7875 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2430)
			elseif rightItem.itemid == 7751 or  rightItem.itemid == 7770 or  rightItem.itemid == 7861 or  rightItem.itemid == 7876 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7389)
			elseif rightItem.itemid == 7752 or  rightItem.itemid == 7771 or  rightItem.itemid == 7862 or  rightItem.itemid == 7877 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7380)
			elseif rightItem.itemid == 7753 or  rightItem.itemid == 7772 or  rightItem.itemid == 7863 or  rightItem.itemid == 7878 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2454)
			elseif rightItem.itemid == 7754 or  rightItem.itemid == 7773 or  rightItem.itemid == 7864 or  rightItem.itemid == 7879 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2423)
			elseif rightItem.itemid == 7755 or  rightItem.itemid == 7774 or  rightItem.itemid == 7865 or  rightItem.itemid == 7880 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2445)
			elseif rightItem.itemid == 7756 or  rightItem.itemid == 7775 or  rightItem.itemid == 7866 or  rightItem.itemid == 7881 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7415)
			elseif rightItem.itemid == 7757 or  rightItem.itemid == 7776 or  rightItem.itemid == 7867 or  rightItem.itemid == 7882 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 7392)
			elseif rightItem.itemid == 7758 or  rightItem.itemid == 7777 or  rightItem.itemid == 7868 or  rightItem.itemid == 7883 then
				doRemoveItem(rightItem.uid)
				doPlayerAddItem(cid, 2391)
			end
			return true
		end
	elseif isInArray(eWeps, leftItem.itemid) then								--check if player has an enchanted weapon in left hand
		if getItemAttribute(leftItem.uid, "charges") <= 1 then
		if leftItem.itemid == 7744 or  leftItem.itemid == 7763 or  leftItem.itemid == 7854 or  leftItem.itemid == 7869 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2383)
			elseif leftItem.itemid == 7745 or  leftItem.itemid == 7764 or  leftItem.itemid == 7855 or  leftItem.itemid == 7870 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7383)
			elseif leftItem.itemid == 7746 or  leftItem.itemid == 7765 or  leftItem.itemid == 7856 or  leftItem.itemid == 7871 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7384)
			elseif leftItem.itemid == 7747 or  leftItem.itemid == 7766 or  leftItem.itemid == 7857 or  leftItem.itemid == 7872 then
				ddoRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7406)
			elseif leftItem.itemid == 7748 or  leftItem.itemid == 7767 or  leftItem.itemid == 7858 or  leftItem.itemid == 7873 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7402)
			elseif leftItem.itemid == 7749 or  leftItem.itemid == 7768 or  leftItem.itemid == 7859 or  leftItem.itemid == 7874 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2429)
			elseif leftItem.itemid == 7750 or  leftItem.itemid == 7769 or  leftItem.itemid == 7860 or  leftItem.itemid == 7875 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2430)
			elseif leftItem.itemid == 7751 or  leftItem.itemid == 7770 or  leftItem.itemid == 7861 or  leftItem.itemid == 7876 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7389)
			elseif leftItem.itemid == 7752 or  leftItem.itemid == 7771 or  leftItem.itemid == 7862 or  leftItem.itemid == 7877 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7380)
			elseif leftItem.itemid == 7753 or  leftItem.itemid == 7772 or  leftItem.itemid == 7863 or  leftItem.itemid == 7878 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2454)
			elseif leftItem.itemid == 7754 or  leftItem.itemid == 7773 or  leftItem.itemid == 7864 or  leftItem.itemid == 7879 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2423)
			elseif leftItem.itemid == 7755 or  leftItem.itemid == 7774 or  leftItem.itemid == 7865 or  leftItem.itemid == 7880 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2445)
			elseif leftItem.itemid == 7756 or  leftItem.itemid == 7775 or  leftItem.itemid == 7866 or  leftItem.itemid == 7881 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7415)
			elseif leftItem.itemid == 7757 or  leftItem.itemid == 7776 or  leftItem.itemid == 7867 or  leftItem.itemid == 7882 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 7392)
			elseif leftItem.itemid == 7758 or  leftItem.itemid == 7777 or  leftItem.itemid == 7868 or  leftItem.itemid == 7883 then
				doRemoveItem(leftItem.uid)
				doPlayerAddItem(cid, 2391)
			end
			return true
		end
	else																		--else do nothing
		return true
	end
return true
end