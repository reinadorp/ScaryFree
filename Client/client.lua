RegisterNetEvent("spawnNPC")
AddEventHandler("spawnNPC", function(targetId)
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local playerHeading = GetEntityHeading(playerPed)
	
		local forwardVector = GetEntityForwardVector(playerPed)
		local spawnDistance = 0.5 
		local spawnCoords = playerCoords + forwardVector * spawnDistance
	
		local npcModel = Config.Ped
		RequestModel(npcModel)
		while not HasModelLoaded(npcModel) do
			Wait(500)
		end
		local npc = CreatePed(4, npcModel, spawnCoords.x, spawnCoords.y, spawnCoords.z-1.0, playerHeading+180, true, true)
		SetEntityAsMissionEntity(npc, true, true)
		
		if Config.SoundGame then
			PlaySoundFromEntity(-1, Config.Soundonevar, npc, Config.Soundtwovar, 0, 0)
		else

		end

		SetFollowPedCamViewMode(4)
		TaskStandStill(npc, Config.TimePed) 
		Citizen.Wait(Config.TimePed) 
		DeleteEntity(npc)  
		SetFollowPedCamViewMode(0)
	
end)