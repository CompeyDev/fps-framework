local GunHandler = game.ReplicatedStorage:WaitForChild("Groza") --gun model
local Viewmodel = game.ReplicatedStorage:WaitForChild("Viewmodel") --viewmodel arms


--importing mainmodule
local MainModule = require(game.ReplicatedStorage.MainModule)

Viewmodel.Parent = game.Workspace.Camera
