local debounce = false
local ultChargeTime = 60
local equipped = false
local percent = game.StarterGui.UltimateGUI.Frame.ImageLabel.Percent
local UIS = game:GetService("UserInputService")
local updateUlt = game.ReplicatedStorage.UpdateULT
local sound = game:GetService("SoundService").SoundGroup:WaitForChild("WaterBreathing")
local ulting = script.Parent:WaitForChild("Ulting").Value

script.Parent.Equipped:Connect(function()
	equipped = true
end)
script.Parent.Unequipped:Connect(function()
	equipped = false
end)

UIS.InputBegan:Connect(function(input)
	
	if input.KeyCode == Enum.KeyCode.X and percent.Text == "100%" then
		if debounce == false and equipped == true then
			debounce = true
			local char = script.Parent.Parent
			local hum = char:FindFirstChild("Humanoid")
			local remote = script.Parent.UltimateEvent
			hum.WalkSpeed = 0 	
			hum.UseJumpPower = true
			hum.JumpPower = 0
			local anim = hum.Animator:LoadAnimation(script.Parent:WaitForChild("Ultimate1"))
			anim:Play()
			sound:Play()
			
			anim:GetMarkerReachedSignal("Ready"):Connect(function(parameter)
				remote:FireServer("Ready")
			end)
			task.wait(4.4)
			
			hum.WalkSpeed = 16
			hum.JumpPower = 100
			hum.UseJumpPower = false
			updateUlt:FireServer()
			ulting = false
			task.wait(ultChargeTime)
			debounce = false
			
			
			
		end
	end
end)


