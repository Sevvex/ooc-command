local players = {}


function sendMessageToNearbyPlayers(player, message)
    local playerId = GetPlayerIdentifiers(player)[1] 
    local playerCoords = GetEntityCoords(GetPlayerPed(player))

    for _, id in ipairs(GetPlayers()) do
        if id ~= player then
            local targetCoords = GetEntityCoords(GetPlayerPed(id))
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, targetCoords.x, targetCoords.y, targetCoords.z)

            if distance < 50.0 then
                TriggerClientEvent('chat:addMessage', id, {
                    args = { "OOC [" .. playerId .. "]: " .. message }
                })
            end
        end
    end
end

RegisterCommand('ooc', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message and message ~= "" then
        sendMessageToNearbyPlayers(source, message)
    end
end, false)
