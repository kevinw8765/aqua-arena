local remote = game:GetService("ReplicatedStorage").Windwall

local sound = game:GetService("SoundService").SoundGroup.Whoosh

remote.OnServerEvent:Connect(function(plr, MousePosition)
	
	local windwall = game.ReplicatedStorage:WaitForChild("wall").Plane:Clone()
	windwall.Parent = workspace
	windwall.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-15)
	
	windwall.Rotation = Vector3.new(0,180,0)
	windwall.Touched:Connect(function(hit)
		
		if hit.Name == "Waterball" then
			hit:Destroy()
			sound:Play()
		end
	end)
	task.wait(4)
	windwall.Transparency = 0.75
	task.wait(4)
	windwall.Transparency = 0.9
	windwall:Destroy()	
end)