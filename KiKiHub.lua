local ui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local UIS = game:GetService("UserInputService")
local dragging, lastPos = false, nil

ui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
frame.Parent = ui
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.3, 0, 0.2, 0)
frame.Size = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundTransparency = 0.2

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

-- Botões
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -30, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local maximizeBtn = Instance.new("TextButton", frame)
maximizeBtn.Size = UDim2.new(0, 30, 0, 30)
maximizeBtn.Position = UDim2.new(1, -60, 0, 0)
maximizeBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
maximizeBtn.Text = "+"
maximizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -90, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Ações dos botões
closeBtn.MouseButton1Click:Connect(function()
    ui:Destroy()
end)

minimizeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

maximizeBtn.MouseButton1Click:Connect(function()
    frame.Size = UDim2.new(0.8, 0, 0.8, 0)
end)

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
