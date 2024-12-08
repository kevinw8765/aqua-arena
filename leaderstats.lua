game.Players.PlayerAdded:Connect(function(plr)
	
	local leaderstats = Instance.new("Folder")
	leaderstats.Parent = plr
	leaderstats.Name = "leaderstats"	
	
	local slaps = Instance.new("IntValue")
	slaps.Parent = leaderstats
	slaps.Name = "SLAP"
	slaps.Value = 0
	
end)