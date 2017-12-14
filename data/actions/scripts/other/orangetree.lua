function onUse(cid, item, frompos, item2, topos)
            doPlayerAddItem(cid,2675,math.random(5))
            doTransformItem(item.uid, 4008)
			--addEvent(doTransformItem, 60000, item.uid, 4006)
      return true
end