local Turn = 1
local cd = false
local canAttack = false
local cdTime = 1
local dmg = 15
local sound = game.SoundService.SoundGroup.Whack
local ulting = script.Parent:WaitForChild("Ulting").Value


script.Parent.Activated:Connect(function()
	
	if cd == false and canAttack == false and ulting == false then
		cd = true
		canAttack = true
		
		local hum = script.Parent.Parent.Humanoid
		local anim = hum:LoadAnimation(script.Parent.Attack1)
		if Turn == 1 then
			anim:Play()
			sound:Play()
			if anim.Stopped then
				task.wait(cdTime)
				cd = false
				canAttack = false
			end
		end
		
	end
		
	
end)

script.Parent.noodle.Hitbox.Touched:Connect(function(hit)
	
	if hit.Parent:FindFirstChild("Humanoid") then
		
		if canAttack == true then
			hit.Parent.Humanoid:TakeDamage(dmg)
			canAttack = false

			local plr = game.Players:GetPlayerFromCharacter(script.Parent.Parent)
			plr.leaderstats.SLAP.Value += 1
		end
	end
end)