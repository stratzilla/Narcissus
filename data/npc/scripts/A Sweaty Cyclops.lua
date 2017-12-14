local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- XVX FORGER START --

function amulet(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,8262) >= 1 and getPlayerItemCount(cid,8263) >= 1 and getPlayerItemCount(cid,8264) >= 1 and  getPlayerItemCount(cid,8265) >= 1 then
        if doPlayerRemoveItem(cid,8262,1) and doPlayerRemoveItem(cid,8263,1) and doPlayerRemoveItem(cid,8264,1) and  doPlayerRemoveItem(cid,8265,1) then
            npcHandler:say('Cling clang!', cid)
            doPlayerAddItem(cid,8266,1)
        end
        else
            npcHandler:say('Lil\' one don\'t have these items!', cid)
    end
end

function obsidian(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2516) >= 1 and getPlayerItemCount(cid,2425) >= 1 then
        if doPlayerRemoveItem(cid,2516,1) and doPlayerRemoveItem(cid,2425,1) then
            npcHandler:say('Cling clang!', cid)
            doPlayerAddItem(cid,5908,1)
        end
        else
            npcHandler:say('Lil\' one don\'t have these items!', cid)
    end
end	

function crude(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2393) >= 1 then
        if doPlayerRemoveItem(cid,2393,1) then
            npcHandler:say('Cling clang!', cid)
            doPlayerAddItem(cid,5892,1)
        end
        else
            npcHandler:say('Lil\' one don\'t have this item!', cid)
    end
end

function soulorb(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	local orbCount = getPlayerItemCount(cid,5944)
        if orbCount >= 1 then
        if doPlayerRemoveItem(cid,5944,orbCount) then
            npcHandler:say('Cling clang!', cid)
            doPlayerAddItem(cid,6529,(orbCount * 2))
        end
        else
            npcHandler:say('Lil\' one don\'t have this item!', cid)
    end
end

function royal(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2487) >= 1 then
        if doPlayerRemoveItem(cid,2487,1) then
            npcHandler:say('Cling clang!', cid)
            doPlayerAddItem(cid,5887,1)
        end
        else
            npcHandler:say('Lil\' one don\'t have this item!', cid)
   end   
end

function hell(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2462) >= 1 then
        if doPlayerRemoveItem(cid,2462,1) then
            npcHandler:say('Cling clang!', cid)
            doPlayerAddItem(cid,5888,1)
        end
        else
            npcHandler:say('Lil\' one don\'t have this item!', cid)
   end   
end

-- XVX FORGER END --

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can forge amulet, obsidian knife, huge chunk of crude iron, and piece of draconian steel!"})

local node1 = keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hum Humm! Welcume lil\' one. Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil\' time to make it unbroken. Yes or no?'})
    node1:addChildKeyword({'yes'}, amulet, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' one got the neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'obsidian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do lil\' one want to trade a dragon shield and an obsidian lance for a obsidian knife?'})
    node2:addChildKeyword({'yes'}, obsidian, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' one got the neccessary items.', reset = true})

local node3 = keywordHandler:addKeyword({'uth\'prta'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do lil\' one want to trade a giant sword?'})
    node3:addChildKeyword({'yes'}, crude, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' one got the neccessary items.', reset = true})
	
local node4 = keywordHandler:addKeyword({'uth\'lokr'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do lil\' one want to trade dragon shield?'})
    node4:addChildKeyword({'yes'}, draconian, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' one got the neccessary items.', reset = true})
	
local node5 = keywordHandler:addKeyword({'soul orb'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Uh. Me can make some nasty lil\' bolt from soul orbs. Lil\' one want to trade all?'})
    node5:addChildKeyword({'yes'}, soulorb, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' got the neccessary items.', reset = true})
	
local node6 = keywordHandler:addKeyword({'uth\'kean'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do lil\' one want to trade crown armor?'})
    node6:addChildKeyword({'yes'}, royal, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' got the neccessary items.', reset = true})
	
local node7 = keywordHandler:addKeyword({'za\'ralator'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do lil\' one want to trade devil helmet?'})
    node7:addChildKeyword({'yes'}, hell, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when lil\' got the neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())