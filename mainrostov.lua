local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZeroTracer"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Главный фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 531, 0, 22)
MainFrame.Position = UDim2.new(0.534, 0, 0.064, 0)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0
MainFrame.Parent = ScreenGui

local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(0)
UICorner1.Parent = MainFrame

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Color = Color3.new(0, 0, 0)
UIStroke1.Thickness = 0
UIStroke1.Transparency = 0
UIStroke1.Parent = MainFrame

-- Фрейм меню
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 531, 0, 295)
MenuFrame.Position = UDim2.new(0, 0, 1, 0)
MenuFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
MenuFrame.BackgroundTransparency = 0
MenuFrame.Visible = false
MenuFrame.Parent = MainFrame

local MenuFrameUICorner = Instance.new("UICorner")
MenuFrameUICorner.CornerRadius = UDim.new(0)
MenuFrameUICorner.Parent = MenuFrame

local MenuFrameUIStroke = Instance.new("UIStroke")
MenuFrameUIStroke.Color = Color3.new(0, 0, 0)
MenuFrameUIStroke.Thickness = 0
MenuFrameUIStroke.Transparency = 0
MenuFrameUIStroke.Parent = MenuFrame

-- Фрейм для чекбоксов
local ChFrame = Instance.new("Frame")
ChFrame.Name = "ChFrame"
ChFrame.Size = UDim2.new(0, 512, 0, -1)
ChFrame.Position = UDim2.new(0.017, 0, 0.125, 0)
ChFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ChFrame.Parent = MenuFrame

-- Фрейм для бота
local FrameBot = Instance.new("Frame")
FrameBot.Name = "FrameBot"
FrameBot.Size = UDim2.new(0, 531, 0, 258)
FrameBot.Position = UDim2.new(0, 0, 0.125, 0)
FrameBot.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FrameBot.Visible = false
FrameBot.Parent = MenuFrame

-- Кнопка открытия/закрытия
local OpenCloseButton = Instance.new("TextButton")
OpenCloseButton.Name = "OpenCloseButton"
OpenCloseButton.Size = UDim2.new(0, 22, 0, 22)
OpenCloseButton.Position = UDim2.new(0, 0, 0, 0)
OpenCloseButton.BackgroundTransparency = 1
OpenCloseButton.TextSize = 14
OpenCloseButton.TextColor3 = Color3.new(1, 1, 1)
OpenCloseButton.Text = "▼"
OpenCloseButton.Font = Enum.Font.SourceSans
OpenCloseButton.Parent = MainFrame

-- Название
local NameLabel = Instance.new("TextLabel")
NameLabel.Name = "NameLabel"
NameLabel.Size = UDim2.new(0, 200, 0, 22)
NameLabel.Position = UDim2.new(0.1, 0, 0, 0)
NameLabel.BackgroundTransparency = 1
NameLabel.TextSize = 16
NameLabel.TextColor3 = Color3.new(1, 1, 1)
NameLabel.Text = "RostovCheat  ///   Powered by WizoXU"
NameLabel.Font = Enum.Font.SourceSans
NameLabel.Parent = MainFrame

-- Кнопка Bot
local BotButton = Instance.new("TextButton")
BotButton.Name = "BotButton"
BotButton.Size = UDim2.new(0, 22, 0, 22)
BotButton.Position = UDim2.new(0, 0, 0, 0)
BotButton.BackgroundTransparency = 1
BotButton.TextSize = 14
BotButton.TextColor3 = Color3.new(1, 1, 1)
BotButton.Text = "Bot"
BotButton.Font = Enum.Font.SourceSans
BotButton.Parent = MenuFrame

local BotUICorner = Instance.new("UICorner")
BotUICorner.CornerRadius = UDim.new(0.3, 0)
BotUICorner.Parent = BotButton

-- Кнопка AutoFarm
local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Size = UDim2.new(0, 22, 0, 22)
AutoFarmButton.Position = UDim2.new(0, 0, 0, 0)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
AutoFarmButton.BackgroundTransparency = 1
AutoFarmButton.TextSize = 14
AutoFarmButton.TextColor3 = Color3.fromRGB(0, 110, 255)
AutoFarmButton.Text = ""
AutoFarmButton.Font = Enum.Font.SourceSans
AutoFarmButton.Parent = FrameBot

local AutoFarmUICorner = Instance.new("UICorner")
AutoFarmUICorner.CornerRadius = UDim.new(0.8, 0)
AutoFarmUICorner.Parent = AutoFarmButton

-- Текст AutoFarm
local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Name = "AutoFarmLabel"
AutoFarmLabel.Size = UDim2.new(0, 52, 0, 31)
AutoFarmLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
AutoFarmLabel.BackgroundTransparency = 1
AutoFarmLabel.TextSize = 18
AutoFarmLabel.TextColor3 = Color3.new(1, 1, 1)
AutoFarmLabel.Text = "AutoFarm"
AutoFarmLabel.Font = Enum.Font.SourceSans
AutoFarmLabel.Parent = AutoFarmButton

-- Перетаскивание главного фрейма
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Перетаскивание MenuFrame
local frameDragging = false
local frameDragInput, frameDragStart, frameStartPos

local function updateFrame(input)
    local delta = input.Position - frameDragStart
    MenuFrame.Position = UDim2.new(frameStartPos.X.Scale, frameStartPos.X.Offset + delta.X, frameStartPos.Y.Scale, frameStartPos.Y.Offset + delta.Y)
end

MenuFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        frameDragging = true
        frameDragStart = input.Position
        frameStartPos = MenuFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                frameDragging = false
            end
        end)
    end
end)

MenuFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        frameDragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == frameDragInput and frameDragging then
        updateFrame(input)
    end
end)

-- Анимация обводки
local speed = 1.5
local waveCount = 3

local function updateStrokeColor()
    local time = tick() * speed
    local waveValue = 0
    for i = 1, waveCount do
        waveValue = waveValue + math.sin(time + i * math.pi/waveCount)
    end
    waveValue = waveValue / waveCount
    local normalizedValue = (waveValue + 1) / 2
    MenuFrameUIStroke.Color = Color3.new(normalizedValue, normalizedValue, normalizedValue)
end

RunService.Heartbeat:Connect(function()
    updateStrokeColor()
end)

-- Функции кнопок
OpenCloseButton.MouseButton1Click:Connect(function()
    MenuFrame.Visible = not MenuFrame.Visible
    if MenuFrame.Visible then
        OpenCloseButton.Text = "▼"
    else
        OpenCloseButton.Text = "►"
    end
end)

BotButton.MouseButton1Click:Connect(function()
    FrameBot.Visible = not FrameBot.Visible
    if FrameBot.Visible then
        BotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    else
        BotButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

-- AutoFarm функция
local autoTeleportEnabled = false
local isRunning = false
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local positions = {
    Vector3.new(5144.60595703125, 87.04823303222656, 1120.1256103515625),
    Vector3.new(5070.3623046875, 94.11610412597656, 1124.9158935546875)
}

local function safeTeleport(position)
    if not character or not humanoidRootPart then
        character = player.Character
        if character then
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        else
            return false
        end
    end

    pcall(function()
        humanoidRootPart.CFrame = CFrame.new(position)
    end)
    return true
end

local function findProximityPrompts()
    local foundPrompts = {}
    local descendants = workspace:GetDescendants()
    for _, obj in ipairs(descendants) do
        if obj:IsA("ProximityPrompt") and obj.Enabled then
            table.insert(foundPrompts, obj)
        end
    end
    return foundPrompts
end

local function activateNearestPrompt()
    local prompts = findProximityPrompts()
    local closestPrompt = nil
    local closestDistance = math.huge

    for _, prompt in ipairs(prompts) do
        local promptPart = prompt.Parent
        if promptPart and promptPart:IsA("Model") then
            promptPart = promptPart.PrimaryPart
        end

        if promptPart and promptPart:IsA("BasePart") then
            local distance = (humanoidRootPart.Position - promptPart.Position).Magnitude
            if distance <= prompt.MaxActivationDistance and distance < closestDistance then
                closestDistance = distance
                closestPrompt = prompt
            end
        end
    end

    if closestPrompt then
        pcall(function()
            closestPrompt:InputHoldBegin()
            task.wait(0.2)
            closestPrompt:InputHoldEnd()
        end)
        return true
    end
    return false
end

local function waitAndActivatePrompt(waitTime)
    local activated = false
    local startTime = tick()
    while tick() - startTime < waitTime do
        if activateNearestPrompt() then
            activated = true
            break
        end
        task.wait(0.5)
    end
    return activated
end

local function teleportationCycle()
    if isRunning then return end
    isRunning = true

    while autoTeleportEnabled do
        if safeTeleport(positions[1]) then
            task.wait(2)
            waitAndActivatePrompt(3)
            task.wait(1)
        end

        if not autoTeleportEnabled then break end

        if safeTeleport(positions[2]) then
            task.wait(2)
            waitAndActivatePrompt(3)
            task.wait(1)
        end

        if not autoTeleportEnabled then break end
        task.wait(3)
    end

    isRunning = false
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
    if autoTeleportEnabled then
        task.wait(2)
        teleportationCycle()
    end
end)

AutoFarmButton.MouseButton1Click:Connect(function()
    autoTeleportEnabled = not autoTeleportEnabled
    if autoTeleportEnabled then
        AutoFarmButton.Text = "✓"
        teleportationCycle()
    else
        AutoFarmButton.Text = ""
    end
end)