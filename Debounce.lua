local tool = script.Parent

local debounce = false

tool.Activated:Connect(function()
	
	local owner = script.Parent
	tool.noodle.Hitbox.Touched:Connect(function(hit)
		
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= owner then
			
			if debounce == false then
				debounce = true
				script.Parent.Knockback:FireServer(hit.Parent)
				debounce = false
			end
		end
	end)
end)