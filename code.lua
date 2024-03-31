-- Gui to Lua
-- Version: 3.2

-- Instances:

local Teleporter = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Username = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local TP = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Tween = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_5 = Instance.new("UICorner")

--Properties:

Teleporter.Name = "Teleporter"
Teleporter.Parent = game.CoreGui
Teleporter.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Teleporter
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.406752408, 0, 0.363414645, 0)
Frame.Size = UDim2.new(0.18649517, 0, 0.197560981, 0)

UICorner.CornerRadius = UDim.new(0.0500000007, 8)
UICorner.Parent = Frame

Username.Name = "Username"
Username.Parent = Frame
Username.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
Username.BorderSizePixel = 0
Username.Position = UDim2.new(0.068965517, 0, 0.150000006, 0)
Username.Size = UDim2.new(0.862068951, 0, 0.222222224, 0)
Username.Font = Enum.Font.SourceSans
Username.PlaceholderText = "Username Here"
Username.Text = ""
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextScaled = true
Username.TextSize = 14.000
Username.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0.0500000007, 8)
UICorner_2.Parent = Username

TP.Name = "TP"
TP.Parent = Frame
TP.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
TP.BorderColor3 = Color3.fromRGB(0, 0, 0)
TP.BorderSizePixel = 0
TP.Position = UDim2.new(0.068965517, 0, 0.473580241, 0)
TP.Size = UDim2.new(0.862068951, 0, 0.185185179, 0)
TP.Font = Enum.Font.SourceSans
TP.Text = "Teleport"
TP.TextColor3 = Color3.fromRGB(255, 255, 255)
TP.TextScaled = true
TP.TextSize = 14.000
TP.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.0500000007, 8)
UICorner_3.Parent = TP

Tween.Name = "Tween"
Tween.Parent = Frame
Tween.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Tween.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tween.BorderSizePixel = 0
Tween.Position = UDim2.new(0.25, 0, 0.720493853, 0)
Tween.Size = UDim2.new(0.681034505, 0, 0.185185179, 0)
Tween.Font = Enum.Font.SourceSans
Tween.Text = "Tween Teleport"
Tween.TextColor3 = Color3.fromRGB(255, 255, 255)
Tween.TextScaled = true
Tween.TextSize = 14.000
Tween.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0.0500000007, 8)
UICorner_4.Parent = Tween

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.068965517, 0, 0.716049373, 0)
TextBox.Size = UDim2.new(0.142241374, 0, 0.185185179, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = "5"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0.0500000007, 8)
UICorner_5.Parent = TextBox

-- Scripts:

local function DRSN_fake_script() -- Teleporter.Handler 
	local script = Instance.new('LocalScript', Teleporter)

	local GUI = script.Parent
	local Frame = GUI.Frame
	
	Frame.Active = true
	Frame.Draggable = true
	
	local HTTP = game:GetService('HttpService')
	local UIS = game:GetService('UserInputService')
	local Player = game:GetService('Players').LocalPlayer
	
	GUI.Name = tostring(HTTP:GenerateGUID(false))
	
	local UIStroke = Instance.new('UIStroke', Frame); UIStroke.Thickness = 2; UIStroke.Color = Color3.fromRGB(23, 116, 255)
	
	UIS.InputBegan:Connect(function(input, gameProccessedEvent)
		if not gameProccessedEvent then
			if input.KeyCode == Enum.KeyCode.T then
				Frame.Visible = not Frame.Visible
			end
		end
	end)
	
	local ButtonCD = false
	local ButtonText = Frame.TP.Text
	
	local found1 = false
	
	Frame.TP.MouseButton1Down:Connect(function()
		if not ButtonCD then
			ButtonCD = true
			for _,v in pairs(game:GetService('Players'):GetPlayers()) do
				if string.lower(Frame.Username.Text) == string.lower(v.Name) then
					found1 = true
					repeat task.wait() until game:GetService('Workspace'):FindFirstChild(Player.Name)
					repeat task.wait() until game:GetService('Workspace'):FindFirstChild(v.Name)
					
					Player.Character:PivotTo(v.Character:GetPivot())
					
					Frame.TP.Text = 'Teleported to '..v.Name..'!'
					task.wait(0.5)
					Frame.TP.Text = ButtonText
					ButtonCD = false
					found1 = false
					return
				end
			end
			
			if not found1 then
				Frame.TP.Text = 'Player not found!'
				task.wait(0.5)
				Frame.TP.Text = ButtonText
				ButtonCD = false
				found1 = false
			end
			ButtonCD = false
			found1 = false
		end
	end)
	
	local TweenCD = false
	local TPButtonText = Frame.Tween.Text
	
	local found2 = false
	
	Frame.Tween.MouseButton1Down:Connect(function()
		if not TweenCD then
			TweenCD = true
			for _,v in pairs(game:GetService('Players'):GetPlayers()) do
				if string.lower(Frame.Username.Text) == string.lower(v.Name) then
					repeat task.wait() until game:GetService('Workspace'):FindFirstChild(Player.Name)
					repeat task.wait() until game:GetService('Workspace'):FindFirstChild(v.Name)
					
					found2 = true
					
					Frame.Tween.Text = 'Tweening..'
					
					local TS = game:GetService('TweenService')
					TS:Create(Player.Character.HumanoidRootPart, TweenInfo.new(tonumber(Frame.TextBox.Text)), {CFrame = CFrame.new(v.Character.HumanoidRootPart.Position)}):Play(); task.wait(tonumber(Frame.TextBox.Text))
					TweenCD = false
					Frame.Tween.Text = TPButtonText
					ButtonCD = false
					found2 = false
					return
				end
			end
			
			if not found2 then
				Frame.Tween.Text = 'Player not found!'
				task.wait(0.5)
				Frame.Tween.Text = ButtonText
				ButtonCD = false
				found2 = false
			end
			TweenCD = false
			found2 = false
		end
	end)
end
coroutine.wrap(DRSN_fake_script)()
