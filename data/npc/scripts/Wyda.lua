local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function herb(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	local herbCount = getPlayerItemCount(cid,2798)
        if herbCount >= 1 then
        if doPlayerRemoveItem(cid,2798,1) then
            npcHandler:say('Here, take one of my old brooms as a reward.', cid)
            doPlayerAddItem(cid,2551,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

local node1 = keywordHandler:addKeyword({'blood herb'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you have a blood herb for me?'})
    node1:addChildKeyword({'yes'}, herb, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Well go get one then!', reset = true})

npcHandler:addModule(FocusModule:new())