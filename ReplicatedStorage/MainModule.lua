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

return module
