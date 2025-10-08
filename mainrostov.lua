local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZeroTracer"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Локальный скрипт для показа/скрытия интерфейса
local ToggleScript = Instance.new("LocalScript", ScreenGui)
ToggleScript.Name = "ToggleScript"
ToggleScript.Source = [[
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = player.PlayerGui:WaitForChild("ZeroTracer")
local isVisible = false

gui.Enabled = false

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
		isVisible = not isVisible
		gui.Enabled = isVisible
	end
end)
]]

-- Главный фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 531, 0, 22)
MainFrame.Position = UDim2.new(0.534, 0, 0.064, 0)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.Parent = ScreenGui

-- Скрипт для перемещения фрейма
local MoveScript = Instance.new("LocalScript", MainFrame)
MoveScript.Name = "MoveScript"
MoveScript.Source = [[
local frame = script.Parent
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStartPos
local frameStartPos

local function update(input)
	local delta = input.Position - dragStartPos
	frame.Position = UDim2.new(
		frameStartPos.X.Scale, 
		frameStartPos.X.Offset + delta.X,
		frameStartPos.Y.Scale,
		frameStartPos.Y.Offset + delta.Y
	)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStartPos = input.Position
		frameStartPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
		update(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
		update(input)
	end
end)
]]

-- Фрейм меню
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 531, 0, 295)
MenuFrame.Position = UDim2.new(0, 0, 1, 0)
MenuFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
MenuFrame.Visible = false
MenuFrame.Parent = MainFrame

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

-- Кнопка функции (AutoFarm)
local TextButtonFunction = Instance.new("TextButton")
TextButtonFunction.Name = "TextButtonFunction"
TextButtonFunction.Size = UDim2.new(0, 22, 0, 22)
TextButtonFunction.Position = UDim2.new(0, 0, 0, 0)
TextButtonFunction.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
TextButtonFunction.BackgroundTransparency = 1
TextButtonFunction.TextSize = 14
TextButtonFunction.TextColor3 = Color3.fromRGB(0, 110, 255)
TextButtonFunction.Text = ""
TextButtonFunction.Font = Enum.Font.Inconsolata
TextButtonFunction.Parent = FrameBot

-- UICorner для кнопки функции
local FunctionUICorner = Instance.new("UICorner")
FunctionUICorner.CornerRadius = UDim.new(0.8, 0)
FunctionUICorner.Parent = TextButtonFunction

-- Скрипт для кнопки функции (AutoFarm)
local FunctionScript = Instance.new("LocalScript", TextButtonFunction)
FunctionScript.Name = "FunctionScript"
FunctionScript.Source = [[
local button = script.Parent

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local autoTeleportEnabled = false
local isRunning = false

-- Координаты для телепортации
local positions = {
	Vector3.new(5144.60595703125, 87.04823303222656, 1120.1256103515625),
	Vector3.new(5070.3623046875, 94.11610412597656, 1124.9158935546875)
}

-- Функция для безопасной телепортации
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

-- Функция для поиска всех активных ProximityPrompt
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

-- Функция для активации ближайшего ProximityPrompt
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
		-- Пробуем разные методы активации
		local success = pcall(function()
			closestPrompt:InputHoldBegin()
			task.wait(0.2)
			closestPrompt:InputHoldEnd()
		end)

		if not success then
			pcall(function()
				ProximityPromptService:PromptTriggered(closestPrompt, player)
			end)
		end

		pcall(function()
			if closestPrompt.Triggered then
				closestPrompt.Triggered:Fire(player)
			end
		end)

		return true
	end

	return false
end

-- Функция для ожидания и активации ProximityPrompt
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

-- Основной цикл телепортации
local function teleportationCycle()
	if isRunning then 
		print("Цикл уже запущен!")
		return 
	end

	isRunning = true
	print("Цикл телепортации запущен")

	while autoTeleportEnabled do
		print("Телепортация на позицию 1")
		-- Телепорт на первую позицию
		if safeTeleport(positions[1]) then
			task.wait(2)
			waitAndActivatePrompt(3)
			task.wait(1)
		end

		if not autoTeleportEnabled then break end

		print("Телепортация на позицию 2")
		-- Телепорт на вторую позицию
		if safeTeleport(positions[2]) then
			task.wait(2)
			waitAndActivatePrompt(3)
			task.wait(1)
		end

		if not autoTeleportEnabled then break end

		print("Ожидание перед следующим циклом")
		-- Ожидание 3 секунды перед следующим циклом
		task.wait(3)
	end

	print("Цикл телепортации остановлен")
	isRunning = false
end

-- Обработчик изменения персонажа
player.CharacterAdded:Connect(function(newCharacter)
	print("Персонаж изменен")
	character = newCharacter
	humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")

	-- Автоперезапуск цикла если был активен
	if autoTeleportEnabled then
		print("Перезапуск цикла после смены персонажа")
		task.wait(2)
		teleportationCycle()
	end
end)

-- Главная функция для кнопки
local function toggleAutoTeleport()
	autoTeleportEnabled = not autoTeleportEnabled
	print("Состояние автотелепорта: " .. tostring(autoTeleportEnabled))

	if autoTeleportEnabled and not isRunning then
		teleportationCycle()
	end

	return autoTeleportEnabled
end

-- Обработчик нажатия кнопки
local function onButtonClick()
	print("Кнопка нажата!")
	local isEnabled = toggleAutoTeleport()

	-- Меняем текст кнопки в зависимости от состояния
	if isEnabled then
		button.Text = "✓" -- Галочка когда включено
	else
		button.Text = "" -- Пусто когда выключено
	end
end

button.Text = ""

if button:IsA("TextButton") or button:IsA("ImageButton") then
	button.MouseButton1Click:Connect(onButtonClick)
else
	warn("Скрипт должен быть в TextButton или ImageButton!")
end
]]

-- Текст для AutoFarm
local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Name = "AutoFarmLabel"
AutoFarmLabel.Size = UDim2.new(0, 52, 0, 31)
AutoFarmLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
AutoFarmLabel.BackgroundTransparency = 1
AutoFarmLabel.TextSize = 18
AutoFarmLabel.TextColor3 = Color3.new(1, 1, 1)
AutoFarmLabel.Text = "AutoFarm - работа грузчик"
AutoFarmLabel.Font = Enum.Font.Inconsolata
AutoFarmLabel.Parent = TextButtonFunction

-- Кнопка Bot
local TextButtonBot = Instance.new("TextButton")
TextButtonBot.Name = "TextButtonBot"
TextButtonBot.Size = UDim2.new(0, 22, 0, 22)
TextButtonBot.Position = UDim2.new(0, 0, 0, 0)
TextButtonBot.BackgroundTransparency = 1
TextButtonBot.TextSize = 14
TextButtonBot.TextColor3 = Color3.new(1, 1, 1)
TextButtonBot.Text = "Bot"
TextButtonBot.Font = Enum.Font.Inconsolata
TextButtonBot.Parent = MenuFrame

-- UICorner для кнопки Bot
local BotUICorner = Instance.new("UICorner")
BotUICorner.CornerRadius = UDim.new(0.3, 0)
BotUICorner.Parent = TextButtonBot

-- Скрипт для кнопки Bot
local BotScript = Instance.new("LocalScript", TextButtonBot)
BotScript.Name = "BotScript"
BotScript.Source = [[
script.Parent.MouseButton1Click:connect(function()
	local mainFrame = script.Parent.Parent.FrameBot
	local button = script.Parent

	mainFrame.Visible = not mainFrame.Visible

	if mainFrame.Visible then
		button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	else
		button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end
end)
]]

-- Кнопка открытия/закрытия
local OpenCloseTextButton = Instance.new("TextButton")
OpenCloseTextButton.Name = "OpenCloseTextButton"
OpenCloseTextButton.Size = UDim2.new(0, 22, 0, 22)
OpenCloseTextButton.Position = UDim2.new(0, 0, 0, 0)
OpenCloseTextButton.BackgroundTransparency = 1
OpenCloseTextButton.TextSize = 14
OpenCloseTextButton.TextColor3 = Color3.new(1, 1, 1)
OpenCloseTextButton.Text = "▼"
OpenCloseTextButton.Font = Enum.Font.Inconsolata
OpenCloseTextButton.Parent = MainFrame

-- Скрипт для кнопки открытия/закрытия
local OpenCloseScript = Instance.new("LocalScript", OpenCloseTextButton)
OpenCloseScript.Name = "OpenCloseScript"
OpenCloseScript.Source = [[
local TweenService = game:GetService("TweenService")

script.Parent.MouseButton1Click:connect(function()
	local button = script.Parent
	local scrollingFrame = script.Parent.Parent.MenuFrame

	scrollingFrame.Visible = not scrollingFrame.Visible

	local targetText
	if scrollingFrame.Visible then
		targetText = "▼"
	else
		targetText = "►"
	end

	local fadeOutTweenInfo = TweenInfo.new(
		0.2,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)

	local fadeOutTween = TweenService:Create(button, fadeOutTweenInfo, {
		TextTransparency = 1
	})

	local fadeInTweenInfo = TweenInfo.new(
		0.2,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)

	local fadeInTween = TweenService:Create(button, fadeInTweenInfo, {
		TextTransparency = 0
	})

	fadeOutTween:Play()
	fadeOutTween.Completed:Connect(function()
		button.Text = targetText
		fadeInTween:Play()
	end)
end)
]]

-- Текст с названием
local NameTextLabel = Instance.new("TextLabel")
NameTextLabel.Name = "NameTextLabel"
NameTextLabel.Size = UDim2.new(0, 22, 0, 22)
NameTextLabel.Position = UDim2.new(0, 0, 0, 0)
NameTextLabel.BackgroundTransparency = 1
NameTextLabel.TextSize = 16
NameTextLabel.TextColor3 = Color3.new(1, 1, 1)
NameTextLabel.Text = "RostovCheat  ///   Powered by WizoXU"
NameTextLabel.Font = Enum.Font.Inconsolata
NameTextLabel.Parent = MainFrame