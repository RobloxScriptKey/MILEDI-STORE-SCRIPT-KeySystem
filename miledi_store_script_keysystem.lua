-- Скрытый ключ в байтах
local encodedKey = {80,108,97,121,101,114,111,107,32,77,73,76,69,68,73,32,83,84,79,82,69} -- "Playerok MILEDI STORE"

local function checkKey(input)
    if #input ~= #encodedKey then return false end
    for i = 1, #encodedKey do
        if string.byte(input, i) ~= encodedKey[i] then
            return false
        end
    end
    return true
end

-- Скрытые URL скриптов (байты)
local script1_bytes = {104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,112,97,119,110,101,114,115,99,114,105,112,116,47,77,117,114,100,101,114,77,121,115,116,101,114,121,50,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,102,97,114,109,99,111,105,110,46,108,117,97}
local script2_bytes = {104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,97,99,111,110,66,111,115,115,83,99,114,105,112,116,47,66,101,101,99,111,110,72,117,98,47,109,97,105,110,47,66,101,101,99,111,110,72,117,98}

local function decode(bytes)
    local chars = {}
    for _, b in ipairs(bytes) do
        table.insert(chars, string.char(b))
    end
    return table.concat(chars)
end

-- Создаём UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlayerokKeyUI"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 240)
Frame.Position = UDim2.new(0.5, -210, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Logo = Instance.new("TextLabel")
Logo.Text = "Playerok"
Logo.Size = UDim2.new(1, 0, 0, 60)
Logo.Position = UDim2.new(0, 0, 0, 0)
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 40
Logo.TextColor3 = Color3.fromRGB(0, 255, 128)
Logo.BackgroundTransparency = 1
Logo.Parent = Frame

local Desc = Instance.new("TextLabel")
Desc.Text = "Введите ключ от MILEDI STORE:"
Desc.Size = UDim2.new(1, -40, 0, 40)
Desc.Position = UDim2.new(0, 20, 0, 65)
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 18
Desc.TextWrapped = true
Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Desc.BackgroundTransparency = 1
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.Parent = Frame

local Input = Instance.new("TextBox")
Input.PlaceholderText = "Ключ Playerok..."
Input.Size = UDim2.new(1, -40, 0, 40)
Input.Position = UDim2.new(0, 20, 0, 110)
Input.Font = Enum.Font.Gotham
Input.TextSize = 18
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Input.BorderColor3 = Color3.fromRGB(60, 60, 60)
Input.ClearTextOnFocus = false
Input.Parent = Frame

local Button = Instance.new("TextButton")
Button.Text = "Подтвердить ключ"
Button.Size = UDim2.new(1, -40, 0, 45)
Button.Position = UDim2.new(0, 20, 0, 165)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 18
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 90)
Button.BorderSizePixel = 0
Button.Parent = Frame

local ErrorLabel = Instance.new("TextLabel")
ErrorLabel.Text = ""
ErrorLabel.Size = UDim2.new(1, -40, 0, 30)
ErrorLabel.Position = UDim2.new(0, 20, 0, 215)
ErrorLabel.Font = Enum.Font.Gotham
ErrorLabel.TextSize = 14
ErrorLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
ErrorLabel.BackgroundTransparency = 1
ErrorLabel.TextXAlignment = Enum.TextXAlignment.Left
ErrorLabel.Parent = Frame

-- Обработка кнопки
Button.MouseButton1Click:Connect(function()
    local userKey = Input.Text
    if checkKey(userKey) then
        -- Правильный ключ — удаляем UI
        ScreenGui:Destroy()
        -- Загружаем и запускаем скрипты из скрытых URL
        local success1, err1 = pcall(function()
            loadstring(game:HttpGet(decode(script1_bytes), true))()
        end)
        local success2, err2 = pcall(function()
            loadstring(game:HttpGet(decode(script2_bytes), true))()
        end)
        if not success1 then
            warn("Ошибка загрузки первого скрипта: "..tostring(err1))
        end
        if not success2 then
            warn("Ошибка загрузки второго скрипта: "..tostring(err2))
        end
    else
        ErrorLabel.Text = "❌ Неверный ключ. Получите его на Playerok (MILEDI STORE)"
    end
end)
