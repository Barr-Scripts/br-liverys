QBCore = nil
       
TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)

RegisterCommand('livery', function(source, args, raw)
  local PlayerData = QBCore.Functions.GetPlayerData()
  local coords = GetEntityCoords(GetPlayerPed(-1))
  local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
  if tonumber(args[1]) ~= nil and PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "doctor" and GetVehicleLiveryCount(vehicle) - 1 >= tonumber(args[1]) then
      QBCore.Functions.Progressbar("loading_livery", "Loading Livery", math.random(2000, 2000), false, true, {
          disableMovement = false,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
      }, {}, {}, {}, function()
      SetVehicleLivery(vehicle, tonumber(args[1]))
      end)
  end
end)
