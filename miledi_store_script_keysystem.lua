-- Ключ для проверки
local correctKey = "Playerok MILEDI STORE"

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlayerokKeyUI"
ScreenGui.Parent = playerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 280)
Frame.Position = UDim2.new(0.5, -210, 0.5, -140)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

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
Desc.Position = UDim2.new(0, 20, 0, 70)
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
Input.Position = UDim2.new(0, 20, 0, 120)
Input.Font = Enum.Font.Gotham
Input.TextSize = 20
Input.TextColor3 = Color3.fromRGB(220, 220, 255)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
Input.BorderSizePixel = 0
Input.ClearTextOnFocus = false
Input.Parent = Frame

-- Кнопка "Подтвердить ключ"
local ConfirmButton = Instance.new("TextButton")
ConfirmButton.Text = "Подтвердить ключ"
ConfirmButton.Size = UDim2.new(1, -40, 0, 45)
ConfirmButton.Position = UDim2.new(0, 20, 0, 180)
ConfirmButton.Font = Enum.Font.GothamBold
ConfirmButton.TextSize = 22
ConfirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmButton.BackgroundColor3 = Color3.fromRGB(44, 181, 230)
ConfirmButton.BorderSizePixel = 0
ConfirmButton.Parent = Frame

-- Кнопка "Получить ключ"
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Text = "Получить ключ"
GetKeyButton.Size = UDim2.new(0, 160, 0, 30)
GetKeyButton.Position = UDim2.new(0, 20, 0, 230)
GetKeyButton.Font = Enum.Font.Gotham
GetKeyButton.TextSize = 16
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Parent = Frame

-- Текст о том, что скопировалась ссылка
local CopiedLabel = Instance.new("TextLabel")
CopiedLabel.Text = ""
CopiedLabel.Size = UDim2.new(0, 200, 0, 30)
CopiedLabel.Position = UDim2.new(0, 190, 0, 230)
CopiedLabel.Font = Enum.Font.Gotham
CopiedLabel.TextSize = 14
CopiedLabel.TextColor3 = Color3.fromRGB(120, 255, 120)
CopiedLabel.BackgroundTransparency = 1
CopiedLabel.TextXAlignment = Enum.TextXAlignment.Left
CopiedLabel.Parent = Frame

-- Сообщение об ошибке при неверном ключе
local ErrorLabel = Instance.new("TextLabel")
ErrorLabel.Text = ""
ErrorLabel.Size = UDim2.new(1, -40, 0, 30)
ErrorLabel.Position = UDim2.new(0, 20, 0, 260)
ErrorLabel.Font = Enum.Font.Gotham
ErrorLabel.TextSize = 15
ErrorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
ErrorLabel.BackgroundTransparency = 1
ErrorLabel.TextXAlignment = Enum.TextXAlignment.Left
ErrorLabel.Parent = Frame

-- Проверка ключа
local function checkKey(input)
    return input == correctKey
end

-- Подтвердить ключ
ConfirmButton.MouseButton1Click:Connect(function()
    if checkKey(Input.Text) then
        ScreenGui:Destroy()
        -- Загрузка скриптов
        loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/dip/refs/heads/main/most.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/spawnerscript/MurderMystery2/refs/heads/main/farmcoin.lua"))()
    else
        ErrorLabel.Text = "Неверный ключ ❌"
        task.delay(4, function()
            ErrorLabel.Text = ""
        end)
    end
end)

-- Получить ключ
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://playerok.com/profile/MILEDI-STORE/products")
    CopiedLabel.Text = "Ссылка скопирована!"
    task.delay(3, function()
        CopiedLabel.Text = ""
    end)
end)
