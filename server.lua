local ox_inventory = exports.ox_inventory

RegisterNetEvent('sd-dongle:server:buyshit', function(ped)
    local player = Ox.GetPlayer(source)
    if not source or not Player or not ped then return end
    local cash = ox_inventory:Search(source, 'count', 'money')
    print(cash)

    if (cash >= Config.Shop[ped].price) then
        ox_inventory:RemoveItem(source, 'money', Config.Shop[ped].price)
        ox_inventory:AddItem(source, Config.Shop[ped].item, 1)
        TriggerClientEvent('ox_lib:notify', source, {title = 'Purchased '..Config.Shop[ped].label, style = {backgroundColor = '#141517', color = '#909296'}, icon = 'circle-check', iconColor = '#48BB78', type = 'success'})
    else
        TriggerClientEvent('ox_lib:notify', source, {title = 'Not enough '..Config.Shop[ped].type, style = {backgroundColor = '#141517', color = '#909296'}, icon = 'ban', iconColor = '#C53030', type = 'error'})
    end
end)
