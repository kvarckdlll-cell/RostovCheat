local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ProximityPromptService = game:GetService("ProximityPromptService")

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

local frame = gui:WaitForChild("MainFrame")
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

local openCloseButton = frame:WaitForChild("OpenCloseTextButton")
local menuFrame = frame:WaitForChild("MenuFrame")

openCloseButton.MouseButton1Click:Connect(function()
	menuFrame.Visible = not menuFrame.Visible

	local targetText
	if menuFrame.Visible then
		targetText = "▼"
	else
		targetText = "►"
	end

	local fadeOutTweenInfo = TweenInfo.new(
		0.2,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)

	local fadeOutTween = TweenService:Create(openCloseButton, fadeOutTweenInfo, {
		TextTransparency = 1
	})

	local fadeInTweenInfo = TweenInfo.new(
		0.2,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)

	local fadeInTween = TweenService:Create(openCloseButton, fadeInTweenInfo, {
		TextTransparency = 0
	})

	fadeOutTween:Play()
	fadeOutTween.Completed:Connect(function()
		openCloseButton.Text = targetText
		fadeInTween:Play()
	end)
end)

local botButton = frame:WaitForChild("TextButtonBot")
local frameBot = frame:WaitForChild("FrameBot")

botButton.MouseButton1Click:Connect(function()
	frameBot.Visible = not frameBot.Visible

	if frameBot.Visible then
		botButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	else
		botButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end
end)

local functionButton = frameBot:WaitForChild("TextButtonFunction")
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local autoTeleportEnabled = false
local isRunning = false

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
	if isRunning then 
		print("Цикл уже запущен!")
		return 
	end

	isRunning = true
	print("Цикл телепортации запущен")

	while autoTeleportEnabled do
		print("Телепортация на позицию 1")
		if safeTeleport(positions[1]) then
			task.wait(2)
			waitAndActivatePrompt(3)
			task.wait(1)
		end

		if not autoTeleportEnabled then break end

		print("Телепортация на позицию 2")
		if safeTeleport(positions[2]) then
			task.wait(2)
			waitAndActivatePrompt(3)
			task.wait(1)
		end

		if not autoTeleportEnabled then break end

		print("Ожидание перед следующим циклом")
		task.wait(3)
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
		task.wait(2)
		teleportationCycle()
	end
end)

local function toggleAutoTeleport()
	autoTeleportEnabled = not autoTeleportEnabled
	print("Состояние автотелепорта: " .. tostring(autoTeleportEnabled))

	if autoTeleportEnabled and not isRunning then
		teleportationCycle()
	end

	return autoTeleportEnabled
end

local function onFunctionButtonClick()
	print("Кнопка автофарма нажата!")
	local isEnabled = toggleAutoTeleport()

	if isEnabled then
		functionButton.Text = "✓"
	else
		functionButton.Text = ""
	end
end

functionButton.Text = ""
functionButton.MouseButton1Click:Connect(onFunctionButtonClick)

print("RostovCheat GUI успешно загружен!")
print("Нажмите Insert для показа/скрытия интерфейса")