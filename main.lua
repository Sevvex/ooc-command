local lastOOCMessage = nil
local oocCooldown = 5
local lastOOCTime = 0

function sendMessageToNearbyPlayers(player, message)
    print("Message to nearby players: " .. message)
end

function onCommandReceived(player, command, ...)
    if command == "/ooc" then
        local message = table.concat({...}, " ")
        local currentTime = os.time()
        
        if message == lastOOCMessage and (currentTime - lastOOCTime) < oocCooldown then
            return
        end
        
        lastOOCMessage = message
        lastOOCTime = currentTime
        
        sendMessageToNearbyPlayers(player, message)
    end
end
