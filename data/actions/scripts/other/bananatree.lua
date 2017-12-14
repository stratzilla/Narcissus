function onUse(cid, item, frompos, item2, topos)
            doPlayerAddItem(cid,2676,math.random(5))
            doTransformItem(item.uid, (item.itemid - 2))
      return true
end