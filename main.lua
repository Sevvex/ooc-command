local lastOOCMessage = nil
local oocCooldown = 5
local lastOOCTime = 0

function onCommandReceived(command, ...)
    if command == "/ooc" then
        local message = table.concat({...}, " ")
        local currentTime = os.time()
        
        if message == lastOOCMessage and (currentTime - lastOOCTime) < oocCooldown then
            return
        end
        
        lastOOCMessage = message
        lastOOCTime = currentTime
        

        TriggerServerEvent('ooc:sendMessage', message)
    end
end


RegisterCommand('ooc', function(source, args)
    onCommandReceived('/ooc', unpack(args))
end, false)
