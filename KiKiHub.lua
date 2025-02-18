local ui, frame, UIS, dragging, lastPos = Instance.new("ScreenGui"), Instance.new("Frame"), game:GetService("UserInputService"), false, nil
ui.Parent, frame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"), ui
frame.BackgroundColor3, frame.BorderSizePixel, frame.Position, frame.Size, frame.BackgroundTransparency = Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.3, 0, 0.2, 0), UDim2.new(0.4, 0, 0.4, 0), 0.2

local border = Instance.new("Frame", frame)
border.Size = UDim2.new(1, 0, 1, 0)
border.Position = UDim2.new(0, 0, 0, 0)
border.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
border.BorderSizePixel = 0

local innerBorder = Instance.new("Frame", frame)
innerBorder.Size = UDim2.new(1, -4, 1, -4)
innerBorder.Position = UDim2.new(0, 2, 0, 2)
innerBorder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
innerBorder.BorderSizePixel = 0

frame.InputBegan:Connect(function(i) 
    if i.UserInputType == Enum.UserInputType.MouseButton1 then 
        dragging = true
        lastPos = UIS:GetMouseLocation() 
    end 
end)

frame.InputEnded:Connect(function(i) 
    if i.UserInputType == Enum.UserInputType.MouseButton1 then 
        dragging = false
    end 
end)

UIS.InputChanged:Connect(function(i) 
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then 
        local delta = UIS:GetMouseLocation() - lastPos
        frame.Position = UDim2.new(0, frame.Position.X.Offset + delta.X, 0, frame.Position.Y.Offset + delta.Y)
        lastPos = UIS:GetMouseLocation()
    end 
end)
