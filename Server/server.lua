RegisterCommand('scary', function(source, args)
    local src = source
	local targetId = tonumber(args[1]) 
    if targetId then
      TriggerClientEvent("spawnNPC", targetId, true)
    else
        print("Uso correcto: /scary [IDUSER]")
    end
end)