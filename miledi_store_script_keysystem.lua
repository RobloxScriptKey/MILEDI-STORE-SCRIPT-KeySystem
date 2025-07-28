-- Создаем UI под Playerok стиль

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlayerokKeyUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- в PlayerGui, а не CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 250)
Frame.Position = UDim2.new(0.5, -210, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(10, 25, 15)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundTransparency = 0.1
Frame.AutoButtonColor = false

-- Тень под рамкой
local Shadow = Instance.new("Frame", Frame)
Shadow.Size = UDim2.new(1, 6, 1, 6)
Shadow.Position = UDim2.new(0, -3, 0, -3)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
Shadow.BorderSizePixel = 0
Shadow.ZIndex = 0
Shadow.AnchorPoint = Vector2.new(0, 0)
Shadow.BackgroundTransparency = 0.8
Shadow.Rotation = 5
Shadow.ClipsDescendants = true

-- Логотип Playerok
local Logo = Instance.new("TextLabel")
Logo.Text = "Playerok"
Logo.Size = UDim2.new(1, 0, 0, 60)
Logo.Position = UDim2.new(0, 0, 0, 10)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 44
Logo.TextColor3 = Color3.fromRGB(0, 255, 128)
Logo.BackgroundTransparency = 1
Logo.Parent = Frame
Logo.TextStrokeColor3 = Color3.new(0, 0.6, 0)
Logo.TextStrokeTransparency = 0.5

-- Подзаголовок
local Desc = Instance.new("TextLabel")
Desc.Text = "Введите ключ от MILEDI STORE:"
Desc.Size = UDim2.new(1, -40, 0, 40)
Desc.Position = UDim2.new(0, 20, 0, 80)
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 20
Desc.TextWrapped = true
Desc.TextColor3 = Color3.fromRGB(180, 230, 200)
Desc.BackgroundTransparency = 1
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.Parent = Frame

-- Поле ввода ключа
local Input = Instance.new("TextBox")
Input.PlaceholderText = "Введите ключ здесь..."
Input.Size = UDim2.new(1, -40, 0, 45)
Input.Position = UDim2.new(0, 20, 0, 130)
Input.Font = Enum.Font.Gotham
Input.TextSize = 20
Input.TextColor3 = Color3.fromRGB(240, 255, 240)
Input.BackgroundColor3 = Color3.fromRGB(20, 50, 30)
Input.BorderSizePixel = 0
Input.ClearTextOnFocus = false
Input.Parent = Frame

-- Кнопка подтверждения
local Button = Instance.new("TextButton")
Button.Text = "Подтвердить ключ"
Button.Size = UDim2.new(1, -40, 0, 50)
Button.Position = UDim2.new(0, 20, 0, 190)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 22
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
Button.BorderSizePixel = 0
Button.Parent = Frame

-- Сообщение об ошибке
local ErrorLabel = Instance.new("TextLabel")
ErrorLabel.Text = ""
ErrorLabel.Size = UDim2.new(1, -40, 0, 30)
ErrorLabel.Position = UDim2.new(0, 20, 0, 245)
ErrorLabel.Font = Enum.Font.Gotham
ErrorLabel.TextSize = 16
ErrorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
ErrorLabel.BackgroundTransparency = 1
ErrorLabel.TextXAlignment = Enum.TextXAlignment.Left
ErrorLabel.Parent = Frame

-- Привязка проверки ключа к кнопке (пример из твоего скрипта)
Button.MouseButton1Click:Connect(function()
    if checkKey(Input.Text) then
        ScreenGui:Destroy()
        -- запуск твоих скрытых скриптов тут
    else
        ErrorLabel.Text = "❌ Неверный ключ. Получите его на Playerok (MILEDI STORE)"
    end
end)
