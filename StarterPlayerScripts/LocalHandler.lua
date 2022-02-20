local GunModel = game.ReplicatedStorage:WaitForChild("Groza") --gun model
local Viewmodel = game.ReplicatedStorage:WaitForChild("Viewmodel") --viewmodel arms


--importing mainmodule
local MainModule = require(game.ReplicatedStorage.MainModule)

Viewmodel.Parent = game.Workspace.Camera

game:GetService("RunService").RenderStepped:Connect(function(dt)
    MainModule.update(Viewmodel, dt)
end)

MainModule.weldgun(GunModel) --importing weldgun function
