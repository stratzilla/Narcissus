local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState= {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
        local cycmsg = 'You now got 5 extra premium points!'
        local noimsg = 'I only exchange game tokens!'
        local deny      =       'You need 50 game tokens to get 5 premium points'
		local pid = getPlayerAccountId(cid)


--------------------MESSAGES------------------------------------------------------------------------------
    if msgcontains(msg, 'help') or msgcontains(msg, 'trade') then
                selfSay('I can exchange 50 game {tokens} for 5 premium points.', cid)
        
        elseif msgcontains(msg, 'tokens') then
        selfSay('Do you want to exchange 50 game tokens for 5 premium points {yes}?', cid)
        talkState[talkUser] = 1
    
                
-------------GETTING METALS FROM HIM-------------------
        
        -- Royal Steel
        elseif talkState[talkUser] == 1 then
                if msgcontains(msg, 'yes') then
                        if doPlayerTakeItem(cid, 6527, 50) == true then
                                db.executeQuery("UPDATE `accounts` set `premium_points`=`premium_points` + '5' WHERE `id` = '"..pid.."' ;")
                                selfSay(cycmsg, cid)
                                talkState[talkUser] = 0
                        else
                                selfSay(noimsg, cid)
                                talkState[talkUser] = 0
                        end
                else
                        selfSay(deny, cid)
                        talkState[talkUser] = 0
                end         
        end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())