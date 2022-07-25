local ox_inventory = exports.ox_inventory

RegisterNetEvent('sd-dongle:server:buyshit', function(ped)
    local player = Ox.GetPlayer(source)
    if not source or not Player or not ped then return end
    local cash = ox_inventory:Search(source, 'count', Config.CurrencyItem)
    print(cash)

    if (cash >= Config.Shop[ped].price) then
        ox_inventory:RemoveItem(source, 'money', Config.Shop[ped].price)
        ox_inventory:AddItem(source, Config.Shop[ped].item, 1)
        TriggerClientEvent('ox_lib:notify', source, {title = 'Purchased '..Config.Shop[ped].label, style = {backgroundColor = '#141517', color = '#909296'}, icon = 'circle-check', iconColor = '#48BB78', type = 'success'})
    else
        TriggerClientEvent('ox_lib:notify', source, {title = 'Not enough '..Config.Shop[ped].type, style = {backgroundColor = '#141517', color = '#909296'}, icon = 'ban', iconColor = '#C53030', type = 'error'})
    end
end)

-- Ped creation
local entity = nil

local function dongleman()
	if not entity then
		local ped = CreatePed(4, 'cs_old_man2', -462.795, -66.5747, 44.511, 10.3, true, false)
		entity = NetworkGetNetworkIdFromEntity(ped)
		FreezeEntityPosition(ped, true)
	end
end

AddEventHandler('onResourceStart', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	dongleman()
end)

AddEventHandler('onResourceStop', function(resourceName)
	if entity then if GetCurrentResourceName() ~= resourceName then return end
	local entity = NetworkGetEntityFromNetworkId(ped)
	DeleteEntity(entity); entity = nil
 end
end)
