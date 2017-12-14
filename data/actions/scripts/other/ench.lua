function onUse(cid, item, fromPosition, itemEx, toPosition) 

--CONFIG 
local config = { 
mana = 300, 
soul = 2, 
messNotEnoughSoul = "You don't have enough soul.", 
messNotEnoughMana = "You don't have enough mana.", 
effect = 12 --you can test effects with !z command (ex. !z 23) 
} 
--/CONFIG 

local array = { [7759] = 8907, [7760] = 8906, [7761] = 8909, [7762] = 8908 } 
local altars = {{7516, 7517, 7518, 7519}, {7504, 7505, 7506, 7507}, {7512, 7513, 7514, 7515}, {7508, 7509, 7510, 7511}} 
local gems = {2149, 2147, 2150, 2146} 
local enchantedGems = {7760, 7759, 7761, 7762}

local weapons = { 
-- {fire, ice, earth, energy} 
[2383] = {7744, 7763, 7854, 7869},
[7383] = {7745, 7764, 7855, 7870},
[7384] = {7746, 7765, 7856, 7871},
[7406] = {7747, 7766, 7857, 7872},
[7402] = {7748, 7767, 7858, 7873},
[2429] = {7749, 7768, 7859, 7874},
[2430] = {7750, 7769, 7860, 7875},
[7389] = {7751, 7770, 7861, 7876},
[7380] = {7752, 7771, 7862, 7877},
[2454] = {7753, 7772, 7863, 7878},
[2423] = {7754, 7773, 7864, 7879},
[2445] = {7755, 7774, 7865, 7880},
[7415] = {7756, 7775, 7866, 7881},
[7392] = {7757, 7776, 7867, 7882},
[2391] = {7758, 7777, 7868, 7883},
[2544] = {7840, 7839, 7850, 7838},
[8905] = {8906, 8907, 8909, 8908},
}

if(item.itemid == 7761 and itemEx.itemid == 9949) then
doTransformItem(itemEx.uid, 9948)
doDecayItem(itemEx.uid)
doRemoveItem(item.uid, 1)
doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
return true
end

if(item.itemid == 7761 and itemEx.itemid == 9954) then
doTransformItem(itemEx.uid, 9953)
doDecayItem(itemEx.uid)
doRemoveItem(item.uid, 1)
doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
return true
end

if(item.itemid == 2147 and itemEx.itemid == 2342) then
doTransformItem(itemEx.uid, 2343)
doDecayItem(itemEx.uid)
doRemoveItem(item.uid, 1)
doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
return true
end

if(item.itemid == 7760 and isInArray({9934, 10022}, itemEx.itemid)) then
doTransformItem(itemEx.uid, 9933)
doRemoveItem(item.uid, 1)
doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
return true
end

if itemEx.itemid == 8905 and isInArray(enchantedGems, item.itemid) then 
for k, v in pairs(array) do 
if item.itemid == k then 
doTransformItem(itemEx.uid, v) 
doRemoveItem(item.uid, 1) 
doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE) 
return TRUE 
end 
end 
elseif isInArray(gems, item.itemid) == TRUE then 
for i=1, #gems do 
if isInArray(altars[i], itemEx.itemid) == TRUE and item.itemid == gems[i] then 
if getPlayerMana(cid) >= config.mana then 
if getPlayerSoul(cid) >= config.soul then
doRemoveItem(item.uid, 1) 
doPlayerAddItem(cid, enchantedGems[i], 1) 
doPlayerAddSoul(cid,-config.soul) 
doPlayerAddMana(cid,-config.mana) 
else 
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, config.messNotEnoughSoul) 
doSendMagicEffect(fromPosition, 2) 
return FALSE 
end 
else 
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, config.messNotEnoughMana) 
doSendMagicEffect(fromPosition, 2) 
return FALSE 
end 
doSendMagicEffect(toPosition, config.effect) 
return TRUE 
end 
end 

else 
for k, v in pairs(weapons) do 
if itemEx.itemid == k then 
for i=1, #enchantedGems do 
if item.itemid == enchantedGems[i] then 
doTransformItem(itemEx.uid, v[i], 1000) 
doRemoveItem(item.uid, 1) 
doSendMagicEffect(fromPosition, config.effect) 
return TRUE 
end 
end 
end 
end 
end 
return TRUE 
end