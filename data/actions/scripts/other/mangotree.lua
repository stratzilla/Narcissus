function onUse(cid, item, frompos, item2, topos)
            doPlayerAddItem(cid,5097,math.random(5))
            doTransformItem(item.uid, 5156)
      return true
end