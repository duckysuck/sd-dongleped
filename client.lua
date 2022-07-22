-- Bank Robbery Triggers

-- do something like when a TriggerClientEvent('sd-dongle:client:SetBankCD', -1, true) when a bank is being robbed
-- do something like TriggerClientEvent('sd-dongle:client:SetBankCD', -1, false) when a bank can be hit again

local CurrentCops = 0
local BankRobberyCD = false

-- Blip Creation

Citizen.CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlip then
	   		info.blip = AddBlipForCoord(info.x, info.y, info.z)
	   		SetBlipSprite(info.blip, info.id)
	   		SetBlipDisplay(info.blip, 4)
	   		SetBlipScale(info.blip, 0.6)	
	   		SetBlipColour(info.blip, info.colour)
	   		SetBlipAsShortRange(info.blip, true)
	   		BeginTextCommandSetBlipName("STRING")
	   		AddTextComponentString('<FONT FACE="Sora">'.. info.title)
	   		EndTextCommandSetBlipName(info.blip)
	 	end
   	end	
end)

RegisterNetEvent('sd-dongle:activity', function()
            local header = {}
            for k, v in pairs(Config.RobberyList) do
                if CurrentCops >= v.minCops then
                    if not v.bank or (v.bank and not BankRobberyCD) then
                        header[#header+1] = {
                            id = v.Header,
                            title = v.Header,
                            description = '✔️ Available',
                        }
                    else
                        header[#header+1] = {
                            id = v.Header,
                            title = v.Header,
                            description = '❌ Not Available',
                        }
                    end
                else
                    header[#header+1] = {
                        id = v.Header,
                        title = v.Header,
                        description = '❌ Not Available',
                        
                    }
                end
            end
            header[#header+1] = {
                id = 'Close (ESC)',
                title = '❌ Close (ESC)',
            }
            lib.registerContext({
                id = 'availablerobberies',
                title = '❗❎ Available Robberies ❎❗',
                options = header
            })
            lib.showContext('availablerobberies')
end)

local itemNames = {}

for item, data in pairs(exports.ox_inventory:Items()) do 
    itemNames[item] = data.label
end

RegisterNetEvent('sd-dongle:buyitems', function(data)
    local header = {}
    for k, v in pairs(Config.Shop) do
        if v.item then
            header[#header+1] = {
                id = v.item.label,
                title = v.item.label,
                description = "Price: "..v.price,
                serverEvent = "sd-dongle:server:buyshit",
                args = k
            }
        end
    end
    header[#header+1] = {
        id = "Close (ESC)",
        title = "❌ Close (ESC)",
    }
    lib.registerContext({
        id = 'robberyitems',
        title = '💲 Special Equipment 💲',
        options = header
    })
    lib.showContext('robberyitems')
end)


-- Ped Creation

function SetupDongleBoss(coords)
    RequestModel(`cs_old_man2`)
    while not HasModelLoaded(`cs_old_man2`) do
    Wait(1)
    end
    donglenpc = CreatePed(2, `cs_old_man2`, coords.x, coords.y, coords.z-1.0, coords.w, false, false)
    SetPedFleeAttributes(donglenpc, 0, 0)
    SetPedDiesWhenInjured(donglenpc, false)
    TaskStartScenarioInPlace(donglenpc, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(donglenpc, true)
    SetBlockingOfNonTemporaryEvents(donglenpc, true)
    SetEntityInvincible(donglenpc, true)
    FreezeEntityPosition(donglenpc, true)
end

function CreatePeds()
    for i = 1, #Config.Peds do
        if Config.Peds[i].type == 'donglenpc' then
            SetupDongleBoss(Config.Peds[i].position, i)
        end
    end
end

CreateThread(function()
    CreatePeds()
end)

RegisterNetEvent('sd-dongle:client:SetBankCD', function(bool)
    BankRobberyCD = bool
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- Target Exports

CreateThread(function()
    exports.qtarget:AddTargetModel('cs_old_man2', {
        options = {
            {
                event = "sd-dongle:activity",
                icon = "fas fa-clock",
                label = "Check Availability",
                num = 1
            },
            {
                event = "sd-dongle:buyitems",
                icon = "fas fa-laptop-code",
                label = "Purchase Equıpment",
                num = 2
            },
        },
        distance = 3
    })
end)
