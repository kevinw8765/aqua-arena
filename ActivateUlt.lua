local remote = script.Parent:WaitForChild("UltimateEvent")
local hitbox = script.Parent.noodle.Hitbox
hitboxSize = hitbox.Size
hitbox.Size = script.Parent.noodle.Hitbox.CFrame.LookVector * Vector3.new(10,0,0)
local ulting = script.Parent:WaitForChild("Ulting").Value

local debounce = false

remote.OnServerEvent:Connect(function(plr, parameter)
	
	ulting = true
	
	if parameter == "Ready" then
		local char = plr.Character
		local hum = char.HumanoidRootPart
		
		local PF = Instance.new("BodyVelocity", hum)
		PF.MaxForce = Vector3.one*99999999
		PF.P = 10
		PF.Velocity = hum.CFrame.LookVector * 25 * PF.P
		game.Debris:AddItem(PF,.1)
		
		task.wait(1)
		
		hitbox.Touched:Connect(function(hit)
			
			if hit.Parent:FindFirstChild("Humanoid") and ulting and debounce == false then
				debounce = true
				hit.Parent.Humanoid:TakeDamage(50)	
				task.wait(60)
				debounce = false
			else
				return
			end
			
		end)
	end
	hitbox.Size = hitboxSize
	
end)