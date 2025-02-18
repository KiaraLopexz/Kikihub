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

-- Criando os botões de controle
local buttonsFrame = Instance.new("Frame")
buttonsFrame.Parent = frame
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Size = UDim2.new(0, 60, 0, 20)
buttonsFrame.Position = UDim2.new(1, -60, 0, 0)  -- Posiciona os botões no canto superior direito

-- Botão Minimizar
local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = buttonsFrame
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(0, 0, 0, 0)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Botão vermelho
minimizeButton.TextSize = 14
minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Botão Fechar
local closeButton = Instance.new("TextButton")
closeButton.Parent = buttonsFrame
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(0, 25, 0, 0)  -- Ajusta a posição do botão de fechar
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Botão vermelho
closeButton.TextSize = 14
closeButton.MouseButton1Click:Connect(function()
    ui:Destroy()  -- Fecha o Gui completamente
end)
