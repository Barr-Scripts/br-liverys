ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('livery', function(source, args, raw)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    if tonumber(args[1]) ~= nil and ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.name == 'ambulance' and GetVehicleLiveryCount(vehicle) - 1 >= tonumber(args[1]) then
		SetVehicleLivery(vehicle, tonumber(args[1]))
		TriggerEvent('DoLongHudText', 'Livery Set', 1)
    else
		TriggerEvent('DoLongHudText', 'No such Livery for Vehicle', 2)
    end
end)