RegisterNetEvent('sd-dongle:server:buyshit', function(source)
    local player = Ox.GetPlayer(source)
    if not source or not player then return end
    local cash = exports.ox_inventory:GetItem(source, 'money', returnsCount)

    if (exports.ox_inventory:GetItem(cash).count < Config.Shop[source].price) then
        exports.ox_inventory:RemoveItem(source, 'money', Config.Shop[source].price)
        exports.ox_inventory:AddItem(source, Config.Shop[source].item, 1)
        TriggerClientEvent('ox_lib:notify', source, {title = 'Purchased '..Config.Shop[source].label, type = 'success'})
    else
        TriggerClientEvent('ox_lib:notify', source, {title = 'Not enough '..Config.Shop[source].type, type = 'error'})
    end
end)

