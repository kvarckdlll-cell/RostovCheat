local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZeroTracer"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

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

local ChFrame = Instance.new("Frame")
ChFrame.Name = "ChFrame"
ChFrame.Size = UDim2.new(0, 512, 0, -1)
ChFrame.Position = UDim2.new(0.017, 0,0.125, 0)
ChFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ChFrame.Parent = MenuFrame

local FrameBot = Instance.new("Frame")
FrameBot.Name = "FrameBot"
FrameBot.Size = UDim2.new(0, 531, 0, 258)
FrameBot.Position = UDim2.new(0, 0, 0.125, 0)
FrameBot.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FrameBot.Visible = false
FrameBot.Parent = MenuFrame

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

local BotButton = Instance.new("TextButton")
BotButton.Name = "BotButton"
BotButton.Size = UDim2.new(0, 67,0, 24)
BotButton.Position = UDim2.new(0.041, 0,0.041, 0)
BotButton.BackgroundTransparency = 0
BotButton.BackgroundColor3 = Color3.new(0.1255, 0.1255, 0.1255)
BotButton.TextSize = 14
BotButton.TextColor3 = Color3.new(1, 1, 1)
BotButton.Text = "Bot"
BotButton.Font = Enum.Font.SourceSans
BotButton.Parent = MenuFrame

local BotUICorner = Instance.new("UICorner")
BotUICorner.CornerRadius = UDim.new(0,3, 0)
BotUICorner.Parent = BotButton

local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Size = UDim2.new(0, 26,0, 26)
AutoFarmButton.Position = UDim2.new(0.019, 0,0.053, 0)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
AutoFarmButton.BackgroundTransparency = 0
AutoFarmButton.TextSize = 14
AutoFarmButton.TextColor3 = Color3.fromRGB(0, 110, 255)
AutoFarmButton.Text = ""
AutoFarmButton.Font = Enum.Font.SourceSans
AutoFarmButton.Parent = FrameBot

local AutoFarmUICorner = Instance.new("UICorner")
AutoFarmUICorner.CornerRadius = UDim.new(0,5, 0)
AutoFarmUICorner.Parent = AutoFarmButton

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

local ButtonVisuals = Instance.new("TextButton")
ButtonVisuals.Name = "ButtonVisuals"
ButtonVisuals.Size = UDim2.new(0, 67,0, 24)
ButtonVisuals.Position = UDim2.new(0.202, 0,0.041, 0)
ButtonVisuals.BackgroundTransparency = 0
ButtonVisuals.BackgroundColor3 = Color3.new(0.1255, 0.1255, 0.1255)
ButtonVisuals.TextSize = 14
ButtonVisuals.TextColor3 = Color3.new(1, 1, 1)
ButtonVisuals.Text = "Visuals"
ButtonVisuals.Font = Enum.Font.SourceSans
ButtonVisuals.Parent = MenuFrame

local VisualsUICorner = Instance.new("UICorner")
VisualsUICorner.CornerRadius = UDim.new(0,3, 0)
VisualsUICorner.Parent = ButtonVisuals

local FrameVisuals = Instance.new("Frame")
FrameVisuals.Name = "FrameVisuals"
FrameVisuals.Size = UDim2.new(0, 531, 0, 258)
FrameVisuals.Position = UDim2.new(0, 0, 0.125, 0)
FrameVisuals.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FrameVisuals.Visible = false
FrameVisuals.Parent = MenuFrame

local ChamsCar = Instance.new("TextButton")
ChamsCar.Name = "ChamsCar"
ChamsCar.Size = UDim2.new(0, 26,0, 26)
ChamsCar.Position = UDim2.new(0.019, 0,0.053, 0)
ChamsCar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ChamsCar.BackgroundTransparency = 0
ChamsCar.TextSize = 14
ChamsCar.TextColor3 = Color3.fromRGB(0, 110, 255)
ChamsCar.Text = ""
ChamsCar.Font = Enum.Font.SourceSans
ChamsCar.Parent = FrameVisuals

local ChamsCarUICorner = Instance.new("UICorner")
ChamsCarUICorner.CornerRadius = UDim.new(0,3, 0)
ChamsCarUICorner.Parent = ChamsCar

local ChamsCarLabel = Instance.new("TextLabel")
ChamsCarLabel.Name = "ChamsCarLabel"
ChamsCarLabel.Size = UDim2.new(0, 52, 0, 31)
ChamsCarLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
ChamsCarLabel.BackgroundTransparency = 1
ChamsCarLabel.TextSize = 18
ChamsCarLabel.TextColor3 = Color3.new(1, 1, 1)
ChamsCarLabel.Text = "ChamsCar"
ChamsCarLabel.Font = Enum.Font.SourceSans
ChamsCarLabel.Parent = ChamsCar

local ChamsBankomat = Instance.new("TextButton")
ChamsBankomat.Name = "ChamsBankomat"
ChamsBankomat.Size = UDim2.new(0, 26,0, 26)
ChamsBankomat.Position = UDim2.new(0.019, 0,0.2, 0)
ChamsBankomat.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ChamsBankomat.BackgroundTransparency = 0
ChamsBankomat.TextSize = 14
ChamsBankomat.TextColor3 = Color3.fromRGB(0, 110, 255)
ChamsBankomat.Text = ""
ChamsBankomat.Font = Enum.Font.SourceSans
ChamsBankomat.Parent = FrameVisuals

local ChamsBankomatUICorner = Instance.new("UICorner")
ChamsBankomatUICorner.CornerRadius = UDim.new(0,3, 0)
ChamsBankomatUICorner.Parent = ChamsBankomat

local ChamsBankomatLabel = Instance.new("TextLabel")
ChamsBankomatLabel.Name = "ChamsBankomatLabel"
ChamsBankomatLabel.Size = UDim2.new(0, 100, 0, 31)
ChamsBankomatLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
ChamsBankomatLabel.BackgroundTransparency = 1
ChamsBankomatLabel.TextSize = 18
ChamsBankomatLabel.TextColor3 = Color3.new(1, 1, 1)
ChamsBankomatLabel.Text = "ChamsBankomat"
ChamsBankomatLabel.Font = Enum.Font.SourceSans
ChamsBankomatLabel.Parent = ChamsBankomat

local carHighlightsEnabled = false
local carActiveHighlights = {}

local bankomatHighlightsEnabled = false
local bankomatActiveHighlights = {}

local function createInfiniteHighlight(part, color)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = part
    highlight.Parent = part
    highlight.FillTransparency = 1
    highlight.OutlineColor = color
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    return highlight
end

local function enableCarHighlights()
    local carsFolder = workspace:FindFirstChild("Cars")
    
    if carsFolder then
        for _, obj in pairs(carsFolder:GetDescendants()) do
            if obj:IsA("BasePart") then
                local existingHighlight = obj:FindFirstChildOfClass("Highlight")
                
                if existingHighlight then
                    existingHighlight:Destroy()
                end
                
                local highlight = createInfiniteHighlight(obj, Color3.fromRGB(255, 0, 4))
                table.insert(carActiveHighlights, highlight)
            end
        end
        print("Подсветка Cars ВКЛЮЧЕНА!")
        carHighlightsEnabled = true
    else
        warn("Папка 'Cars' не найдена в Workspace!")
    end
end

local function disableCarHighlights()
    for _, highlight in pairs(carActiveHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    
    carActiveHighlights = {}
    print("Подсветка Cars ВЫКЛЮЧЕНА!")
    carHighlightsEnabled = false
end

local function toggleCarHighlights()
    if carHighlightsEnabled then
        disableCarHighlights()
        return false
    else
        enableCarHighlights()
        return true
    end
end

local function enableBankomatHighlights()
    local bankomatFolder = workspace:FindFirstChild("Bankomati")
    
    if bankomatFolder then
        for _, obj in pairs(bankomatFolder:GetDescendants()) do
            if obj:IsA("BasePart") then
                local existingHighlight = obj:FindFirstChildOfClass("Highlight")
                
                if existingHighlight then
                    existingHighlight:Destroy()
                end
                
                local highlight = createInfiniteHighlight(obj, Color3.fromRGB(0, 255, 8))
                table.insert(bankomatActiveHighlights, highlight)
            end
        end
        print("Подсветка Bankomati ВКЛЮЧЕНА!")
        bankomatHighlightsEnabled = true
    else
        warn("Папка 'Bankomati' не найдена в Workspace!")
    end
end

local function disableBankomatHighlights()
    for _, highlight in pairs(bankomatActiveHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    
    bankomatActiveHighlights = {}
    print("Подсветка Bankomati ВЫКЛЮЧЕНА!")
    bankomatHighlightsEnabled = false
end

local function toggleBankomatHighlights()
    if bankomatHighlightsEnabled then
        disableBankomatHighlights()
        return false
    else
        enableBankomatHighlights()
        return true
    end
end

ChamsCar.MouseButton1Click:Connect(function()
    print("Кнопка ChamsCar нажата!")
    local isEnabled = toggleCarHighlights()
    
    if isEnabled then
        ChamsCar.Text = "✓"
    else
        ChamsCar.Text = ""
    end
end)

ChamsBankomat.MouseButton1Click:Connect(function()
    print("Кнопка ChamsBankomat нажата!")
    local isEnabled = toggleBankomatHighlights()
    
    if isEnabled then
        ChamsBankomat.Text = "✓"
    else
        ChamsBankomat.Text = ""
    end
end)

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
    FrameVisuals.Visible = false
    if FrameBot.Visible then
        BotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        ButtonVisuals.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    else
        BotButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

ButtonVisuals.MouseButton1Click:Connect(function()
    FrameVisuals.Visible = not FrameVisuals.Visible
    FrameBot.Visible = false
    if FrameVisuals.Visible then
        ButtonVisuals.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        BotButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    else
        ButtonVisuals.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

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

ScreenGui.Destroying:Connect(function()
    disableCarHighlights()
    disableBankomatHighlights()
end)