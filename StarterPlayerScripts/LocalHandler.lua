local GunModel = game.ReplicatedStorage:WaitForChild("Groza") --gun model
local Viewmodel = game.ReplicatedStorage:WaitForChild("Viewmodel") --viewmodel arms


--importing mainmodule
local MainModule = require(game.ReplicatedStorage.MainModule)

Viewmodel.Parent = game.Workspace.Camera

game:GetService("RunService").RenderStepped:Connect(function(dt)
    MainModule.update(Viewmodel, dt)
end)

MainModule.weldgun(GunModel) --importing weldgun function
MainModule.equip(Viewmodel, GunModel, AnimationsFolder.Hold) --call hold animation function with animation


 game.GetService("UserInputService").InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isPlayerHoldingMouse = true --shoot on user input
      end
 end)
  
 game.GetService("UserInputService").InputEnded:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isPlayerHoldingMouse = false --stop shooting when mouse released
      end
 end)

 local IsPlayerHoldingMouse --make the gun shoot lol
 local CanFire = true
 local Delay = 0.1 
  
 game.GetService("RunService").Heartbeat:Connect(function(dt)
      if IsPlayerHoldingMouse then
        if CanFire then
          CanFire = false
          
          MainModule.cast(GunModel, game.Players.LocalPlayer:GetMouse().Hit.Position, 60)
          
          wait(Delay)
          CanFire = true
        end
      end
 end)  
