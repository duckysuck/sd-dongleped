RegisterNetEvent('sd-dongle:server:buyshit', function(ped)
    local player = Ox.GetPlayer(source)
    if not source or not player or not ped then return end
    local cash = exports.ox_inventory:GetItem(source, 'money', returnsCount)

    if cash >= Config.Shop[ped].price then
        exports.ox_inventory:RemoveItem(source, 'money', Config.Shop[ped].price)
        exports.ox_inventory:AddItem(source, Config.Shop[ped].item, 1)
    else
        TriggerClientEvent('ox_lib:notify', source, 'Not enough '..Config.Shop[ped].type, 'error')
    end
end)
