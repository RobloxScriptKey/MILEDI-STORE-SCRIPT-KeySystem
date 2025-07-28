-- Настройка ключа
local correctKey = "Playerok MILEDI STORE"

local function checkKey(input)
	return input == correctKey
end

-- Создание интерфейса
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PlayerokKeyUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 260)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.BorderSizePixel = 0
frame.Parent = gui
frame.Active = true
frame.Draggable = true -- Перетаскивание на ПК

local title = Instance.new("TextLabel", frame)
title.Text = "Playerok"
title.Font = Enum.Font.GothamBold
title.TextSize = 42
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(44, 181, 230)

local desc = Instance.new("TextLabel", frame)
desc.Text = "Введите ключ от MILEDI STORE:"
desc.Font = Enum.Font.Gotham
desc.TextSize = 20
desc.Size = UDim2.new(1, -40, 0, 40)
desc.Position = UDim2.new(0, 20, 0, 70)
desc.TextColor3 = Color3.fromRGB(180, 220, 240)
desc.BackgroundTransparency = 1
desc.TextWrapped = true
desc.TextXAlignment = Enum.TextXAlignment.Left

local input = Instance.new("TextBox", frame)
input.PlaceholderText = "Введите ключ..."
input.Font = Enum.Font.Gotham
input.TextSize = 20
input.Size = UDim2.new(1, -40, 0, 45)
input.Position = UDim2.new(0, 20, 0, 120)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
input.BorderSizePixel = 0

local button = Instance.new("TextButton", frame)
button.Text = "Подтвердить ключ"
button.Font = Enum.Font.GothamBold
button.TextSize = 22
button.Size = UDim2.new(1, -40, 0, 45)
button.Position = UDim2.new(0, 20, 0, 180)
button.BackgroundColor3 = Color3.fromRGB(44, 181, 230)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BorderSizePixel = 0

local errorLabel = Instance.new("TextLabel", frame)
errorLabel.Text = ""
errorLabel.Font = Enum.Font.Gotham
errorLabel.TextSize = 16
errorLabel.Size = UDim2.new(1, -40, 0, 30)
errorLabel.Position = UDim2.new(0, 20, 0, 230)
errorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
errorLabel.BackgroundTransparency = 1
errorLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка проверки
button.MouseButton1Click:Connect(function()
	if checkKey(input.Text) then
		gui:Destroy()
		-- Запуск скриптов после ввода ключа
		loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/dip/refs/heads/main/most.lua"))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/spawnerscript/MurderMystery2/refs/heads/main/farmcoin.lua"))()
	else
		errorLabel.Text = "❌ Неверный ключ. Получите его на Playerok"
	end
end)
