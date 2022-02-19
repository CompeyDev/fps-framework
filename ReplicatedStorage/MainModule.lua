local module = {}

function module.update(viewmodel, dt)
  viewmodel.HumanoidRootPart.CFrame = game.Workspace.Camera.CFrame --makes it so the viewmodel tracks the camera
end  

return module
