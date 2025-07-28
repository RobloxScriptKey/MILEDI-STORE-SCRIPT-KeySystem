-- Ключ для проверки
local correctKey = "Playerok MILEDI STORE"

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlayerokKeyUI"
ScreenGui.Parent = playerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 240)
Frame.Position = UDim2.new(0.5, -210, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true -- Чтобы можно было двигать на ПК

-- Логотип
local Logo = Instance.new("TextLabel")
Logo.Text = "Playerok"
Logo.Size = UDim2.new(1, 0, 0, 60)
Logo.Position = UDim2.new(0, 0, 0, 10)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 44
Logo.TextColor3 = Color3.fromRGB(44, 181, 230)
Logo.BackgroundTransparency = 1
Logo.Parent = Frame

-- Описание
local Desc = Instance.new("TextLabel")
Desc.Text = "Введите ключ от MILEDI STORE:"
Desc.Size = UDim2.new(1, -40, 0, 40)
Desc.Position = UDim2.new(0, 20, 0, 80)
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 20
Desc.TextWrapped = true
Desc.TextColor3 = Color3.fromRGB(170, 200, 220)
Desc.BackgroundTransparency = 1
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.Parent = Frame

-- Поле ввода
local Input = Instance.new("TextBox")
Input.PlaceholderText = "Введите ключ здесь..."
Input.Size = UDim2.new(1, -40, 0, 45)
Input.Position = UDim2.new(0, 20, 0, 130)
Input.Font = Enum.Font.Gotham
Input.TextSize = 20
Input.TextColor3 = Color3.fromRGB(220, 220, 255)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
Input.BorderSizePixel = 0
Input.ClearTextOnFocus = false
Input.Parent = Frame

-- Кнопка подтвердить
local Button = Instance.new("TextButton")
Button.Text = "Подтвердить ключ"
Button.Size = UDim2.new(1, -40, 0, 50)
Button.Position = UDim2.new(0, 20, 0, 190)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 22
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundColor3 = Color3.fromRGB(44, 181, 230)
Button.BorderSizePixel = 0
Button.Parent = Frame

-- Кнопка получить ключ
local CopyButton = Instance.new("TextButton")
CopyButton.Text = "Получить ключ"
CopyButton.Size = UDim2.new(0, 140, 0, 30)
CopyButton.Position = UDim2.new(0, 20, 1, -40)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 18
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
CopyButton.BorderSizePixel = 0
CopyButton.Parent = Frame

-- Текст рядом с кнопкой копирования
local CopyInfo = Instance.new("TextLabel")
CopyInfo.Text = ""
CopyInfo.Size = UDim2.new(1, -170, 0, 30)
CopyInfo.Position = UDim2.new(0, 170, 1, -40)
CopyInfo.Font = Enum.Font.Gotham
CopyInfo.TextSize = 14
CopyInfo.TextColor3 = Color3.fromRGB(180, 200, 220)
CopyInfo.BackgroundTransparency = 1
CopyInfo.TextXAlignment = Enum.TextXAlignment.Left
CopyInfo.Parent = Frame

-- Отдельный текст ошибки в правом нижнем углу экрана
local FloatingErrorLabel = Instance.new("TextLabel")
FloatingErrorLabel.Text = ""
FloatingErrorLabel.Size = UDim2.new(0, 400, 0, 60)
FloatingErrorLabel.Position = UDim2.new(1, -410, 1, -80) -- правый нижний угол экрана
FloatingErrorLabel.Font = Enum.Font.Gotham
FloatingErrorLabel.TextSize = 15
FloatingErrorLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
FloatingErrorLabel.BackgroundTransparency = 1
FloatingErrorLabel.TextWrapped = true
FloatingErrorLabel.TextXAlignment = Enum.TextXAlignment.Right
FloatingErrorLabel.TextYAlignment = Enum.TextYAlignment.Bottom
FloatingErrorLabel.Parent = ScreenGui

-- Функция проверки ключа
local function checkKey(input)
    return input == correctKey
end

-- Обработчик кнопки "Подтвердить ключ"
Button.MouseButton1Click:Connect(function()
    if checkKey(Input.Text) then
        ScreenGui:Destroy()
        -- Запускаем нужные скрипты
        loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/dip/refs/heads/main/most.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/spawnerscript/MurderMystery2/refs/heads/main/farmcoin.lua"))()
    else
        FloatingErrorLabel.Text = "Неверный ключ ❌\nНажмите кнопку получить ключ и у вас скопируеться ссылка, зайдите в гугл и вставьте её в поисковую строку🧞‍♀️"
        task.delay(6, function()
            FloatingErrorLabel.Text = ""
        end)
    end
end)

-- Обработчик кнопки "Получить ключ"
CopyButton.MouseButton1Click:Connect(function()
    setclipboard("https://playerok.com/profile/MILEDI-STORE/products")
    CopyInfo.Text = "Ссылка скопирована!"
    task.delay(3, function()
        CopyInfo.Text = ""
    end)
end)
