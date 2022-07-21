RegisterNetEvent('sd-dongle:server:buyshit', function(ped)
    local player = Ox.GetPlayer(source)
    if not source or not player or not ped then return end
    local cash = player.PlayerData.money[Config.Shop[ped].type]

    if cash >= Config.Shop[ped].price then
        exports.ox_inventory:RemoveItem(source, 'money', 100)
        exports.ox_inventory:AddItem(source, Config.Shop[ped].item, 1)
    else
        TriggerClientEvent('ox_lib:notify', source, 'Not enough '..Config.Shop[ped].type, 'error')
    end
end)
