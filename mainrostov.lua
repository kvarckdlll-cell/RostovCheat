local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZeroTracer"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 531, 0, 22)
mainFrame.Position = UDim2.new(0.048, 0, 0.066, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0, 531, 0, 295)
menuFrame.Position = UDim2.new(0, 0, 1, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = mainFrame

local chFrame = Instance.new("Frame")
chFrame.Name = "ChFrame"
chFrame.Size = UDim2.new(0, 512, 0, -1)
chFrame.Position = UDim2.new(0.017, 0, 0.125, 0)
chFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
chFrame.BorderSizePixel = 0
chFrame.Parent = menuFrame

local frameBot = Instance.new("Frame")
frameBot.Name = "FrameBot"
frameBot.Size = UDim2.new(0, 531, 0, 258)
frameBot.Position = UDim2.new(0, 0, 0.125, 0)
frameBot.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
frameBot.BorderSizePixel = 0
frameBot.Visible = false
frameBot.Parent = menuFrame

local functionButton = Instance.new("TextButton")
functionButton.Name = "TextButtonFunction"
functionButton.Size = UDim2.new(0, 22, 0, 22)
functionButton.Position = UDim2.new(0, 0, 0, 0)
functionButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
functionButton.Text = ""
functionButton.TextColor3 = Color3.fromRGB(0, 110, 255)
functionButton.TextSize = 14
functionButton.Font = Enum.Font.Inconsolata
functionButton.Parent = frameBot

local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(0.8, 0)
corner1.Parent = functionButton

local autoFarmLabel = Instance.new("TextLabel")
autoFarmLabel.Name = "AutoFarmLabel"
autoFarmLabel.Size = UDim2.new(0, 52, 0, 31)
autoFarmLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
autoFarmLabel.BackgroundTransparency = 1
autoFarmLabel.Text = "AutoFarm - работа грузчик"
autoFarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmLabel.TextSize = 18
autoFarmLabel.Font = Enum.Font.Inconsolata
autoFarmLabel.Parent = functionButton

local botButton = Instance.new("TextButton")
botButton.Name = "TextButtonBot"
botButton.Size = UDim2.new(0, 22, 0, 22)
botButton.Position = UDim2.new(0, 0, 0, 0)
botButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
botButton.Text = "Bot"
botButton.TextColor3 = Color3.fromRGB(255, 255, 255)
botButton.TextSize = 14
botButton.Font = Enum.Font.Inconsolata
botButton.Parent = menuFrame

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0.3, 0)
corner2.Parent = botButton

local openCloseButton = Instance.new("TextButton")
openCloseButton.Name = "OpenCloseTextButton"
openCloseButton.Size = UDim2.new(0, 22, 0, 22)
openCloseButton.Position = UDim2.new(0, 0, 0, 0)
openCloseButton.BackgroundTransparency = 1
openCloseButton.Text = "▼"
openCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openCloseButton.TextSize = 14
openCloseButton.Font = Enum.Font.Inconsolata
openCloseButton.Parent = mainFrame

local nameLabel = Instance.new("TextLabel")
nameLabel.Name = "NameTextLabel"
nameLabel.Size = UDim2.new(0, 22, 0, 22)
nameLabel.Position = UDim2.new(0, 0, 0, 0)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "RostovCheat  ///   Powered by WizoXU"
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.TextSize = 16
nameLabel.Font = Enum.Font.Inconsolata
nameLabel.Parent = mainFrame

local isVisible = false
local autoTeleportEnabled = false
local isRunning = false
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

screenGui.Enabled = false

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftAlt then
		isVisible = not isVisible
		screenGui.Enabled = isVisible
		print("GUI состояние:", isVisible)
	end
end)

local dragging = false
local dragStartPos
local frameStartPos

local function update(input)
	local delta = input.Position - dragStartPos
	mainFrame.Position = UDim2.new(
		frameStartPos.X.Scale, 
		frameStartPos.X.Offset + delta.X,
		frameStartPos.Y.Scale,
		frameStartPos.Y.Offset + delta.Y
	)
end

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStartPos = input.Position
		frameStartPos = mainFrame.Position
		
		local connection
		connection = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				connection:Disconnect()
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
		update(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
		update(input)
	end
end)

openCloseButton.MouseButton1Click:Connect(function()
	menuFrame.Visible = not menuFrame.Visible

	local targetText
	if menuFrame.Visible then
		targetText = "▼"
	else
		targetText = "►"
	end

	local fadeOutTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local fadeOutTween = TweenService:Create(openCloseButton, fadeOutTweenInfo, {TextTransparency = 1})

	local fadeInTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local fadeInTween = TweenService:Create(openCloseButton, fadeInTweenInfo, {TextTransparency = 0})

	fadeOutTween:Play()
	fadeOutTween.Completed:Connect(function()
		openCloseButton.Text = targetText
		fadeInTween:Play()
	end)
end)

botButton.MouseButton1Click:Connect(function()
	frameBot.Visible = not frameBot.Visible

	if frameBot.Visible then
		botButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	else
		botButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end
end)

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

	local success = pcall(function()
		humanoidRootPart.CFrame = CFrame.new(position)
	end)
	
	return success
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
			promptPart = promptPart.PrimaryPart or promptPart:FindFirstChildWhichIsA("BasePart")
		end

		if promptPart and promptPart:IsA("BasePart") then
			local distance = (humanoidRootPart.Position - promptPart.Position).Magnitude
			if distance <= (prompt.MaxActivationDistance or 10) and distance < closestDistance then
				closestDistance = distance
				closestPrompt = prompt
			end
		end
	end

	if closestPrompt then
		local success = pcall(function()
			closestPrompt:InputHoldBegin()
			task.wait(0.1)
			closestPrompt:InputHoldEnd()
		end)

		if not success then
			pcall(function()
				ProximityPromptService:PromptTriggered(closestPrompt, player)
			end)
		end

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
		task.wait(0.3)
	end

	return activated
end

local function teleportationCycle()
	if isRunning then 
		print("Цикл уже запущен!")
		return 
	end

	isRunning = true
	print("Цикл телепортации запущен")

	while autoTeleportEnabled and character and humanoidRootPart do
		print("Телепортация на позицию 1")
		if safeTeleport(positions[1]) then
			task.wait(1)
			waitAndActivatePrompt(2)
			task.wait(0.5)
		end

		if not autoTeleportEnabled then break end

		print("Телепортация на позицию 2")
		if safeTeleport(positions[2]) then
			task.wait(1)
			waitAndActivatePrompt(2)
			task.wait(0.5)
		end

		if not autoTeleportEnabled then break end

		print("Ожидание перед следующим циклом")
		task.wait(2)
	end

	print("Цикл телепортации остановлен")
	isRunning = false
end

player.CharacterAdded:Connect(function(newCharacter)
	print("Персонаж изменен")
	character = newCharacter
	humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")

	if autoTeleportEnabled then
		print("Перезапуск цикла после смены персонажа")
		task.wait(3)
		if autoTeleportEnabled then
			teleportationCycle()
		end
	end
end)

local function toggleAutoTeleport()
	autoTeleportEnabled = not autoTeleportEnabled
	print("Состояние автотелепорта: " .. tostring(autoTeleportEnabled))

	if autoTeleportEnabled and not isRunning then
		task.spawn(teleportationCycle)
	end

	return autoTeleportEnabled
end

functionButton.MouseButton1Click:Connect(function()
	print("Кнопка автофарма нажата!")
	local isEnabled = toggleAutoTeleport()

	if isEnabled then
		functionButton.Text = "✓"
		functionButton.BackgroundColor3 = Color3.fromRGB(0, 85, 0)
	else
		functionButton.Text = ""
		functionButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	end
end)

nameLabel.Size = UDim2.new(0, 300, 0, 22)
nameLabel.Position = UDim2.new(0.5, -150, 0, 0)

openCloseButton.Position = UDim2.new(1, -22, 0, 0)

botButton.Position = UDim2.new(0, 0, 0, 25)

print("RostovCheat GUI успешно создан!")
print("Нажмите Left Alt для показа/скрытия интерфейса")
print("Автофарм готов к работе!")