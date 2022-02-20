local module = {}

function module.update(viewmodel, dt)
  viewmodel.HumanoidRootPart.CFrame = game.Workspace.Camera.CFrame --makes it so the viewmodel tracks the camera
end  

function module.equip(viewmodel, gun) --equip function so the gun welds to the viewmodel
  local GunHandle = gun.GunComponents.Handle
  local HRP_Motor6D = viewmodel:WaitForChild("HumanoidRootPart").Handle
  
  gun.Parent = viewmodel
  HRP_Motor6D.Part1 = GunHandle
  local Hold = viewmodel.AnimationController:LoadAnimation(hold) --load the hold animation
  Hold:Play()
end  

function module.weldgun(gun)
  local Main = gun.GunComponents.Handle
  
  for i, v in ipairs(gun:GetDescendants()) do
    if v:IsA("BasePart") and v~= Main then -- motor6d if the base part
      local NewMotor = Instance.New("Motor6D") -- define newmotor variable to quickly motor6d the gun
      NewMotor.Name = v.Name -- configure the motor6d
      NewMotor.Part0 = Main
      NewMotor.Part1 = v
      MewMotor.C0 = NewMotor.Part0.CFrame:inverse() * NewMotor.Part1.CFrame
      NewMotor.Parent = Main --end the process
    end
  end
end  

function module.cast --use fastcast for bullet projectiles
  
  local GunBarrel = gun.GunComponents.Barrel
  
  local Bullet = Instance.New("Part")
  Bullet.Size = Vector3.new(1, 1, 5)
  Bullet.Anchored = true
  Bullet.CanCollide = false
  Bullet.Color = Color3.new(219, 239, 0)
  Bullet.Material = Enum.Material.Neon
  Bullet.Parent = game.Workspace -- configure bullet part
  
  Bullet.CFrame = CFrame.new(GunBarrel.Position, endposition)
  
  
  Loop = game:GetService("RunService").RenderStepped:Connect(function(dt)
  Bullet.CFrame *= CFrame.new(0, 0, -velocity, * (dt * 60))
  if (Bullet.Position - GunBarrel.Position).magnitude > 5000 then
        Bullet:Destroy()
        Loop:Disconnect() -- use renderstepped to make it go forward and then destroy it after one point
  end      
  end)
end  

return module
