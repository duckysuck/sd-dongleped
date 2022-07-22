local ox_inventory = exports.ox_inventory

RegisterNetEvent('sd-dongle:server:buyshit', function(ped)
    local player = Ox.GetPlayer(source)
    if not source or not Player or not ped then return end
    local cash = ox_inventory:Search(source, 'count', 'money')
    print(cash)

    if (cash >= Config.Shop[ped].price) then
        ox_inventory:RemoveItem(source, 'money', Config.Shop[ped].price)
        ox_inventory:AddItem(source, Config.Shop[ped].item, 1)
        TriggerClientEvent('ox_lib:notify', source, {title = 'Purchased '..Config.Shop[ped].label, type = 'success'})
    else
        TriggerClientEvent('ox_lib:notify', source, {title = 'Not enough '..Config.Shop[ped].type, type = 'error'})
    end
end)
