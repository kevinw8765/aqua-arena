local remote = game.ReplicatedStorage.WaterballEvent

remote.OnServerEvent:Connect(function(plr, MousePosition)

	local waterBall = game.ReplicatedStorage.Waterball:Clone()
	waterBall.Parent = workspace
	waterBall.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-10)
	 
	
	local NewForce = Instance.new("BodyForce")
	NewForce.Force = Vector3.new(0,workspace.Gravity * waterBall:GetMass(),0)
	NewForce.Parent = waterBall
	
	waterBall.Velocity = CFrame.new(plr.Character.HumanoidRootPart.Position, MousePosition).LookVector * 50
	
	waterBall.Touched:Connect(function(hit)
		
		if hit.Parent:FindFirstChild("Humanoid") and not hit:IsDescendantOf(plr.Character) then
			hit.Parent:FindFirstChild("Humanoid"):TakeDamage(15)
			waterBall:Destroy()
		end
		
	end)
	
	task.wait(7)
	waterBall:Destroy()
end)