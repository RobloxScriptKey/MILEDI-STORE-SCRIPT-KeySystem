--== Ключ ==
local correctKey = "Playerok MILEDI STORE"

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Подождем чуть-чуть, чтобы UI отцентрировался корректно
task.wait(0.1)

-- Создаем GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerokKeyUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Главное окно (увеличено по высоте)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 270)  -- было 250, стало 270
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- работает на ПК
frame.Parent = screenGui

-- Заголовок
local logo = Instance.new("TextLabel", frame)
logo.Text = "Playerok"
logo.Size = UDim2.new(1, 0, 0, 60)
logo.Position = UDim2.new(0, 0, 0, 10)
logo.Font = Enum.Font.GothamBold
logo.TextSize = 44
logo.TextColor3 = Color3.fromRGB(44, 181, 230)
logo.BackgroundTransparency = 1

-- Подтекст
local desc = Instance.new("TextLabel", frame)
desc.Text = "Введите ключ от MILEDI STORE:"
desc.Size = UDim2.new(1, -40, 0, 40)
desc.Position = UDim2.new(0, 20, 0, 70)
desc.Font = Enum.Font.Gotham
desc.TextSize = 20
desc.TextWrapped = true
desc.TextColor3 = Color3.fromRGB(170, 200, 220)
desc.BackgroundTransparency = 1
desc.TextXAlignment = Enum.TextXAlignment.Left

-- Поле ввода
local input = Instance.new("TextBox", frame)
input.PlaceholderText = "Введите ключ здесь..."
input.Size = UDim2.new(1, -40, 0, 45)
input.Position = UDim2.new(0, 20, 0, 120)
input.Font = Enum.Font.Gotham
input.TextSize = 20
input.TextColor3 = Color3.fromRGB(220, 220, 255)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
input.BorderSizePixel = 0
input.ClearTextOnFocus = false

-- Кнопка подтверждения
local confirmButton = Instance.new("TextButton", frame)
confirmButton.Text = "Подтвердить ключ"
confirmButton.Size = UDim2.new(1, -40, 0, 45)
confirmButton.Position = UDim2.new(0, 20, 0, 175)
confirmButton.Font = Enum.Font.GothamBold
confirmButton.TextSize = 22
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.BackgroundColor3 = Color3.fromRGB(44, 181, 230)
confirmButton.BorderSizePixel = 0

-- Кнопка "Получить ключ" с увеличенным отступом вниз
local getKeyButton = Instance.new("TextButton", frame)
getKeyButton.Text = "Получить ключ"
getKeyButton.Size = UDim2.new(0, 160, 0, 30)
getKeyButton.Position = UDim2.new(0, 20, 1, -25) -- было -35, стало -25
getKeyButton.Font = Enum.Font.Gotham
getKeyButton.TextSize = 16
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(60, 130, 180)
getKeyButton.BorderSizePixel = 0

-- Лейбл "Скопировано!"
local copiedLabel = Instance.new("TextLabel", frame)
copiedLabel.Text = ""
copiedLabel.Size = UDim2.new(0, 200, 0, 30)
copiedLabel.Position = UDim2.new(0, 190, 1, -35)
copiedLabel.Font = Enum.Font.Gotham
copiedLabel.TextSize = 14
copiedLabel.TextColor3 = Color3.fromRGB(120, 255, 120)
copiedLabel.BackgroundTransparency = 1
copiedLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Ошибка в правом нижнем углу
local errorLabel = Instance.new("TextLabel")
errorLabel.Text = ""
errorLabel.Size = UDim2.new(0, 400, 0, 60)
errorLabel.Position = UDim2.new(1, -410, 1, -80)
errorLabel.Font = Enum.Font.Gotham
errorLabel.TextSize = 15
errorLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
errorLabel.BackgroundTransparency = 1
errorLabel.TextWrapped = true
errorLabel.TextXAlignment = Enum.TextXAlignment.Right
errorLabel.TextYAlignment = Enum.TextYAlignment.Bottom
errorLabel.Parent = screenGui

-- Проверка ключа
local function checkKey(text)
	return text == correctKey
end

-- Подтвердить
confirmButton.MouseButton1Click:Connect(function()
	if checkKey(input.Text) then
		screenGui:Destroy()

		-- Запускаем скрипты
		loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/dip/refs/heads/main/most.lua"))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/spawnerscript/MurderMystery2/refs/heads/main/farmcoin.lua"))()
	else
		errorLabel.Text = "Неверный ключ ❌"
		task.delay(3, function()
			errorLabel.Text = ""
		end)
	end
end)

-- Получить ключ
getKeyButton.MouseButton1Click:Connect(function()
	setclipboard("https://playerok.com/profile/MILEDI-STORE/products")
	copiedLabel.Text = "Ссылка скопирована!"
	task.delay(3, function()
		copiedLabel.Text = ""
	end)
end)
