local ui, frame, UIS, dragging, lastPos = Instance.new("ScreenGui"), Instance.new("Frame"), game:GetService("UserInputService"), false, nil
ui.Parent, frame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"), ui
frame.BackgroundColor3, frame.BorderSizePixel, frame.Position, frame.Size, frame.BackgroundTransparency = Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.3, 0, 0.2, 0), UDim2.new(0.4, 0, 0.4, 0), 0.2

-- Border frames
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

-- Minimize, Maximize, Close buttons
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -30, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minimizeBtn.BorderSizePixel = 0

local maximizeBtn = Instance.new("TextButton", frame)
maximizeBtn.Size = UDim2.new(0, 30, 0, 30)
maximizeBtn.Position = UDim2.new(1, -60, 0, 0)
maximizeBtn.Text = "⬜"  -- Icon for "Maximize"
maximizeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
maximizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
maximizeBtn.BorderSizePixel = 0

local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -90, 0, 0)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BorderSizePixel = 0

-- Close the frame when "X" is clicked
closeBtn.MouseButton1Click:Connect(function()
    ui:Destroy()  -- This will remove the entire UI, including the frame
end)

-- Minimize the frame (hide it) when "-" is clicked
minimizeBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Double Maximize: First click maximizes, second click restores
local isMaximized = false
maximizeBtn.MouseButton1Click:Connect(function()
    if isMaximized then
        frame.Size = UDim2.new(0.4, 0, 0.4, 0)  -- Restore to original size
        maximizeBtn.Text = "⬜"  -- Reset the button to the maximize icon
    else
        frame.Size = UDim2.new(0.8, 0, 0.8, 0)  -- Maximize the frame
        maximizeBtn.Text = "↔"  -- Change the icon to indicate it's maximized
    end
    isMaximized = not isMaximized  -- Toggle the maximized state
end)

-- Drag functionality
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
