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

-- Criar o botão de minimizar em forma de círculo
local circleButton = Instance.new("TextButton")
circleButton.Parent = ui
circleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
circleButton.Size = UDim2.new(0, 50, 0, 50)
circleButton.Position = UDim2.new(0, 10, 0, 10)  -- Posição do botão
circleButton.Text = ""
circleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
circleButton.AutoButtonColor = false
circleButton.Shape = Enum.UIShape.Circle

circleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible  -- Alterna visibilidade
end)

-- Botões de minimizar e fechar
local buttonsFrame = Instance.new("Frame")
buttonsFrame.Parent = frame
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Size = UDim2.new(0, 50, 0, 20)
buttonsFrame.Position = UDim2.new(1, -45, 0, 0)

local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = buttonsFrame
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(0, 0, 0, 0)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
minimizeButton.TextSize = 14
minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = false  -- Minimiza
end)

local closeButton = Instance.new("TextButton")
closeButton.Parent = buttonsFrame
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(0, 20, 0, 0)  
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextSize = 14
closeButton.MouseButton1Click:Connect(function()
    ui:Destroy()  -- Fecha a aplicação
end)

-- Adiciona o botão de minimizar/abrir ao clicar no círculo
circleButton.MouseButton1Click:Connect(function()
    if frame.Visible then
        frame.Visible = false
    else
        frame.Visible = true
    end
end)
