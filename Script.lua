game.ReplicatedStorage.Replicate.OnServerEvent:Connect(function(plr, tool)
	plr.Backpack:ClearAllChildren()
	if plr.Character:FindFirstChildOfClass("Tool") then
		plr.Character:FindFirstChildOfClass("Tool"):Destroy()
	end
	tool:Clone().Parent = plr.Backpack
end)