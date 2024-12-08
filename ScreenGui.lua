local rs = game:GetService("ReplicatedStorage")
local remote = rs:WaitForChild("WaterballEvent")

remote.OnServerEvent:Connect(function()
	script.Parent.CD.Visible = true
	script.Parent.CD:TweenSize(UDim2.new(0, 0,0.072, 0), "In", "Linear", 3, true) -- 3 is cd timer
	wait(3) -- also here 3 cd
	script.Parent.CD.Visible = false
	script.Parent.CD:TweenSize(UDim2.new(0.099, 0,0.072, 0), "In", "Linear", .01, true) 
end)