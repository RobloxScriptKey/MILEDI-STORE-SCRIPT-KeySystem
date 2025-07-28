-- Ключ
local correctKey = "Playerok MILEDI STORE"

local function checkKey(input)
    return input == correctKey
end

-- UI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Главная рамка
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 260)
frame.Position = UDim2.new(0.5, -210, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = gui
frame.Active = true

-- Перетаскивание (работает на телефоне)
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
	if not dragging then return end
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput then
		update(input)
	end
end)

-- Логотип
local logo = Instance.new("TextLabel")
logo.Text = "Playerok"
logo.Size = UDim2.new(1, 0, 0, 50)
logo.Position = UDim2.new(0, 0, 0, 10)
logo.Font = Enum.Font.GothamBold
logo.TextSize = 42
logo.TextColor3 = Color3.fromRGB(44, 181, 230)
logo.BackgroundTransparency = 1
logo.Parent = frame

-- Описание
local desc = Instance.new("TextLabel")
desc.Text = "Введите ключ от MILEDI STORE:"
desc.Size = UDim2.new(1, -40, 0, 40)
desc.Position = UDim2.new(0, 20, 0, 65)
desc.Font = Enum.Font.Gotham
desc.TextSize = 20
desc.TextWrapped = true
desc.TextColor3 = Color3.fromRGB(170, 200, 220)
desc.BackgroundTransparency = 1
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.Parent = frame

-- Поле ввода
local input = Instance.new("TextBox")
input.PlaceholderText = "Введите ключ здесь..."
input.Size = UDim2.new(1, -40, 0, 45)
input.Position = UDim2.new(0, 20, 0, 110)
input.Font = Enum.Font.Gotham
input.TextSize = 20
input.TextColor3 = Color3.fromRGB(220, 220, 255)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
input.BorderSizePixel = 0
input.ClearTextOnFocus = false
input.Parent = frame

-- Кнопка
local button = Instance.new("TextButton")
button.Text = "Подтвердить ключ"
button.Size = UDim2.new(1, -40, 0, 50)
button.Position = UDim2.new(0, 20, 0, 165)
button.Font = Enum.Font.GothamBold
button.TextSize = 22
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(44, 181, 230)
button.BorderSizePixel = 0
button.Parent = frame

-- Ошибка
local errorLabel = Instance.new("TextLabel")
errorLabel.Text = ""
errorLabel.Size = UDim2.new(1, -40, 0, 30)
errorLabel.Position = UDim2.new(0, 20, 0, 220)
errorLabel.Font = Enum.Font.Gotham
errorLabel.TextSize = 16
errorLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
errorLabel.BackgroundTransparency = 1
errorLabel.TextXAlignment = Enum.TextXAlignment.Left
errorLabel.Parent = frame

-- Обработка
button.MouseButton1Click:Connect(function()
	if checkKey(input.Text) then
		gui:Destroy()

		-- 🚀 Тут загружаются 2 скрипта:
		loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/dip/refs/heads/main/most.lua"))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/spawnerscript/MurderMystery2/refs/heads/main/farmcoin.lua"))()
	else
		errorLabel.Text = "❌ Неверный ключ. Получите его на Playerok (MILEDI STORE)"
	end
end)
