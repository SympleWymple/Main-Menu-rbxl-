--======================================== MODULES ========================================--
local SettingsModule = require(script:WaitForChild("Settings"))
local RegimentModule = require(script:WaitForChild("teamInfo"))
local FrameAnimations = require(script:WaitForChild("Animations"))
print("Modules")
--==================================== Settings ====================================--
local MainGroupID  = SettingsModule.getSetting("MainGroupID")
local ColourTheme = SettingsModule.getSetting("ColourTheme")
local IntroCameraMovement = SettingsModule.getSetting("CameraSensitivity")
local MusicId = SettingsModule.getSetting("MusicId")
local MusicVolume = SettingsModule.getSetting("MusicId")
print("Settings")
-- Display Settings
local LeftKey = SettingsModule.getDisplayerSetting("LeftKey")
local RightKey = SettingsModule.getDisplayerSetting("RightKey")
local SettingsKey = SettingsModule.getDisplayerSetting("SettingsKey")
local zoomInKey = SettingsModule.getDisplayerSetting("SeomthingKey")

-- Shop
local SettingsShop = SettingsModule.getShop()
print("Shop")
--================================================ VARIABLES ================================================--
local SympleMainMenuFolder = workspace:WaitForChild("Symple's Interactive Menu")

local IntroCamera = SympleMainMenuFolder:WaitForChild("camera")
local IntroInitialOrient = IntroCamera.Orientation
local CameraSensitivity = IntroCameraMovement
local LeftPart = SympleMainMenuFolder:WaitForChild("left")
local LeftSurfaceGui = LeftPart:WaitForChild("SurfaceGui")
local LeftPanel1 = LeftSurfaceGui:WaitForChild("Panel1")

local HomePage = LeftPanel1:WaitForChild("Home Page"):WaitForChild("HomePage")
local TopMenu = LeftPanel1:WaitForChild("topMenu")
local shopMenu  = LeftPanel1:WaitForChild("shop"):WaitForChild("shopFrame")
local UpdateFrame = LeftPanel1:WaitForChild("Update"):WaitForChild("updateFrame")
local creditsFrame = LeftPanel1:WaitForChild("Credits"):WaitForChild("creditsFrame")
local settingsFrame = LeftPanel1:WaitForChild("Settings"):WaitForChild("settingsFrame")

local backSettingsButton = settingsFrame:WaitForChild("back")
local homeButton = TopMenu:WaitForChild("home")
local ContactListButton = TopMenu:WaitForChild("ContactList")
local ShopMenuButton = TopMenu:WaitForChild("shop")
local backUpdateButton = UpdateFrame:WaitForChild("back")
local eKeyTextLabel = TopMenu:WaitForChild("e")
local qKeyTextLabel = TopMenu:WaitForChild("q")
local currentHolderTextlabel = TopMenu:WaitForChild("currentHolderText")

local NewsFrame = HomePage:WaitForChild("News Frame")
local deployButton = HomePage:WaitForChild("Deploy")
local updateButton = HomePage:WaitForChild("update")



local RightPart = SympleMainMenuFolder:WaitForChild("right")
local RightSurfaceGui = RightPart:WaitForChild("SurfaceGui")
local RightPanel2 = RightSurfaceGui:WaitForChild('Panel2')
local playerInfoGui = RightPanel2:WaitForChild("PlayerInfoGui")

local playerInfo = playerInfoGui:WaitForChild("playerInfo")
local playerName = playerInfoGui:WaitForChild("playerName")
local FriendsPlaying = playerInfoGui:WaitForChild("friendsPlayingIng")
local settingsButton = playerInfoGui:WaitForChild("settings")
local zoomInButton  = playerInfoGui:WaitForChild("Zoom In")
local settingsOpenButton = playerInfoGui:WaitForChild("settings")

local rankNumber = playerInfo:WaitForChild("rankNumber")
local rankWord = playerInfo:WaitForChild("rankWord")
local inRegimentWord = playerInfo:WaitForChild("regimentRankWord")
local regimentWordText = playerInfo:WaitForChild("regimentWord")
local regimentLogo = playerInfo:WaitForChild("regimentLogo")
local timePlayed = playerInfo:WaitForChild("timePlayedNumbers")

local userNameText = playerName:WaitForChild("username")
local pfp = playerName:WaitForChild("pfp")

local friendsPlayingCount = FriendsPlaying:WaitForChild("count")

local Player = game.Players.LocalPlayer or game:GetService("Players").PlayerAdded:Wait()
local Character = Player.Character or Player.CharacterAdded:Wait()
local Dummy = SympleMainMenuFolder:WaitForChild("Dummy")


local UIS = game:GetService("UserInputService")
local GroupService = game:GetService("GroupService")

ifMobile = false

Camera = workspace.CurrentCamera

Camera.CameraType = Enum.CameraType.Scriptable
Camera.CFrame = IntroCamera.CFrame
local ViewportSize = Camera.ViewportSize
local Mouse = Player:GetMouse()
print("VARIABLES")

if not game:IsLoaded() then
	game.Loaded:Wait()
end

if UIS.TouchEnabled == true then
	ifMobile = true
	zoomedIn = true
end
--=========================================================== CODE =========================================================== --
----------------------------------------------------------------------------------------------------
-- marketplace function
local MarketplaceService = game:GetService("MarketplaceService")
function promptPurchase(itemName,gamePassID)
	local gamePassID = gamePassID 
	MarketplaceService:PromptGamePassPurchase(Player, gamePassID)
end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- sound functions
local ClickSoundId = 421058925

local ClickSoundInstance = Instance.new("Sound")
ClickSoundInstance.SoundId = "rbxassetid://"..ClickSoundId
ClickSoundInstance.Parent = workspace

print("Sound")
----------------------------------------------------------------------------------------------------

function IntroSetup(Override)
	local printSuc, printDontWork = pcall(function()
		print("Menu is ready")
	end)
	FrameAnimations.Back(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
	
	LeftPanel1.BackgroundTransparency = 1
	RightPanel2.BackgroundTransparency = 1
	for _, GuiPart1 in pairs(TopMenu:GetChildren()) do
		if GuiPart1:IsA("TextButton") or GuiPart1:IsA("TextLabel") or GuiPart1:IsA("Frame") then
			GuiPart1.BackgroundTransparency = 0
		end
		if GuiPart1:IsA("ImageLabel") then
			GuiPart1.BackgroundTransparency = 1
		end
	end
	
	for _, Frames in pairs(HomePage:GetChildren()) do
		Frames.Visible = true
		Frames.BackgroundTransparency = 0
	end
	
	HomePage.Position = UDim2.new(0,0,0,0)
	shopMenu.Position = UDim2.new(3, 0, 0.11, 0)
	UpdateFrame.Position = UDim2.new(3, 0, 0.11, 0)
	creditsFrame.Position = UDim2.new(3, 0, 0.11, 0)
	settingsFrame.Position = UDim2.new(3, 0, 0.11, 0)
	homeButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
	ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	
	currentHolderTextlabel.Text = "Home"
	
	deployButton.Visible = true
	NewsFrame.Visible = true
	updateButton.Visible = true
	
	
	
	Player:SetAttribute("InIntro", true)
	if not Override then
		spawn(function()
			wait(2)
			-- camera stuff
			UIS.ModalEnabled = true
			game:GetService("StarterGui"):SetCore("ResetButtonCallback",false)
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
			Camera = workspace.CurrentCamera
			local ViewportSize = Camera.ViewportSize
			local Mouse = Player:GetMouse()
			Camera.CameraType = Enum.CameraType.Scriptable
			Camera.CFrame = IntroCamera.CFrame
			IntroCameraMovement = game:GetService("RunService").RenderStepped:Connect(function()
				local ViewportXOffset = ViewportSize.X/2 - Mouse.X
				local ViewportYOffset = ViewportSize.Y/2 - Mouse.Y
				IntroCamera.Orientation = IntroInitialOrient + Vector3.new(ViewportYOffset/CameraSensitivity,ViewportXOffset/CameraSensitivity,0)
				Camera.CFrame = IntroCamera.CFrame
				if ifMobile == true then
					local lookAt = Mouse.Hit.Position
					Camera.CFrame = CFrame.new(IntroCamera.Position, lookAt)
				end
			end)
		end)
	elseif Override then
		spawn(function()
			-- camera stuff
			UIS.ModalEnabled = true
			game:GetService("StarterGui"):SetCore("ResetButtonCallback",false)
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
			Camera = workspace.CurrentCamera
			local ViewportSize = Camera.ViewportSize
			local Mouse = Player:GetMouse()
			Mouse.TargetFilter = IntroCamera
			Camera.CameraType = Enum.CameraType.Scriptable
			Camera.CFrame = IntroCamera.CFrame
			IntroCameraMovement = game:GetService("RunService").RenderStepped:Connect(function()
				local ViewportXOffset = ViewportSize.X/2 - Mouse.X
				local ViewportYOffset = ViewportSize.Y/2 - Mouse.Y
				IntroCamera.Orientation = IntroInitialOrient + Vector3.new(ViewportYOffset/CameraSensitivity,ViewportXOffset/CameraSensitivity,0)
				Camera.CFrame = IntroCamera.CFrame
				if ZoomedIn and not ifMobile then
					local lookAt = Mouse.Hit.Position
					Camera.CFrame = CFrame.new(IntroCamera.Position, lookAt)
				end
				if ifMobile and ZoomedIn then
					local lookAt = Mouse.Hit.Position
					Camera.CFrame = CFrame.new(IntroCamera.Position, lookAt)
					zoomInButton.Text = "Zoom Out"
				end
			end)
		end)
		----------------------------------------------------------------------------------------------------
		local Music = Instance.new("Sound")
		Music.Name = "IntroMusic"
		Music.SoundId = "rbxassetid://"..MusicId
		Music.Volume = MusicVolume
		Music:Play()
		Music.Looped = true
		Music.Parent = game:GetService("SoundService")
	end
end

IntroSetup(true)
print("Start")
script:WaitForChild("IntroSetup").Event:Connect(IntroSetup)
----------------------------------------------------------------------------------------------------
-- right click zoom in
ZoomedIn = false
UIS.InputBegan:Connect(function(Input)
	if Player:GetAttribute("InIntro") and Input.UserInputType == Enum.UserInputType.MouseButton2 then
		ZoomedIn = true
		Camera.FieldOfView = 50
	end
end)
UIS.InputEnded:Connect(function(Input)
	if Player:GetAttribute("InIntro") and Input.UserInputType == Enum.UserInputType.MouseButton2 then
		ZoomedIn = false
		Camera.FieldOfView = 70
	end
end)

zoomInButton.MouseButton1Click:Connect(function()
	if Player:GetAttribute("InIntro") and ZoomedIn == false then
		zoomInButton.Text = "Zoom Out"
		ZoomedIn = true
		Camera.FieldOfView = 50
		ClickSoundInstance:Play()
	elseif Player:GetAttribute("InIntro") and ZoomedIn == true then
		ZoomedIn = false
		zoomInButton.Text = "Zoom In"
		Camera.FieldOfView = 70
		ClickSoundInstance:Play()
	end
	
end)

for i, textlabels in pairs(SympleMainMenuFolder:GetDescendants()) do
	if textlabels:IsA("TextButton") and (textlabels.Name ~= "button") then
		textlabels.MouseEnter:Connect(function()
			textlabels:SetAttribute("Hovered",true)
			textlabels.TextColor3 = Color3.fromRGB(124, 183, 255)
		end)
		textlabels.MouseLeave:Connect(function()
			textlabels:SetAttribute("Hovered",false)
			textlabels.TextColor3 = Color3.fromRGB(255, 255, 255)
		end)
	end
end

-----------------------------------------------------------------------------------------------
-- FUNCTIONS

function deploy(Value)
	Player.PlayerGui.finishMainMenu.loadingBackground.Visible = true
	local tweenService  = game:GetService("TweenService")
	local loadingArea = Player.PlayerGui.finishMainMenu.loadingBackground.loadingArea

	local letters = {[1] = "H"; [2] = "A"; [3] = "Z";[4] = "Y"; [5] = "'";[6] = "S"; [7] = "B"; [8] = "A2";}
	local state = true


	local circleRight = Player.PlayerGui.finishMainMenu.loadingBackground.CircleRight
	local circleLeft = Player.PlayerGui.finishMainMenu.loadingBackground.CircleLeft


	local circle1 = tweenService:Create(circleRight.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine,Enum.EasingDirection.In), {Transparency = 0})
	local circle2 = tweenService:Create(circleLeft.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine,Enum.EasingDirection.In), {Transparency = 0})
	circle1:Play() circle2:Play()

	for i, v in pairs(letters) do
		local letterFrame = loadingArea[v]
		letterFrame.UIPageLayout.TweenTime = 0.75;
		letterFrame.UIPageLayout:JumpTo(letterFrame.TextLabel);
		task.wait();
	end

	wait(2)

	for count, textlables in pairs(loadingArea:GetDescendants()) do
		if textlables:IsA("TextLabel") then
			tweenService:Create(textlables, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
		end
	end
	tweenService:Create(Player.PlayerGui.finishMainMenu.loadingBackground, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
	tweenService:Create(Player.PlayerGui.finishMainMenu.loadingBackground.CircleLeft.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Transparency = 1}):Play()
	tweenService:Create(Player.PlayerGui.finishMainMenu.loadingBackground.CircleRight.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Transparency = 1}):Play()
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Player:SetAttribute("InIntro", false)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback",true)
	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	tweenService:Create(game:GetService("SoundService"):WaitForChild("IntroMusic"), TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Volume = 0}):Play()
	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
	print("Disconnecting from Symple's Main Menu")
	IntroCameraMovement:Disconnect()
	Camera.CameraType = Enum.CameraType.Custom
	Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
	Camera.FieldOfView = 70
	UIS.ModalEnabled = false
	wait(2)
	loadingArea.Parent.Visible = false
end
---------------------------------------------------------------------------------------------------
-- button and key handling

deployButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	deploy(true)
end)

settingsButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	FrameAnimations.Settings(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
end)

backUpdateButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	FrameAnimations.Back(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
end)

backSettingsButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	FrameAnimations.Back(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
end)

updateButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	FrameAnimations.Update(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
end)

ShopMenuButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	shopMenu.Visible = true
	FrameAnimations.Shop(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
	wait(1)
	ShopMenuButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
	ShopMenuButton.ImageColor3 = Color3.fromRGB(0,0,0)
	ShopMenuButton.Active = true
	ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	ContactListButton.ImageColor3 = Color3.fromRGB(255,255,255)
	homeButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	homeButton.ImageColor3 = Color3.fromRGB(255,255,255)
	currentHolderTextlabel.Text = "Shop"
	ContactListButton.Active = false
	homeButton.Active = false
end)

homeButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	FrameAnimations.Back(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
	wait(1)
	homeButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
	homeButton.ImageColor3 = Color3.fromRGB(0,0,0)
	ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	ShopMenuButton.ImageColor3 = Color3.fromRGB(255,255,255)
	ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	ContactListButton.ImageColor3 = Color3.fromRGB(255,255,255)
	ContactListButton.Active = false
	homeButton.Active = true
	ShopMenuButton.Active = false
	currentHolderTextlabel.Text = "Home"
end)

ContactListButton.MouseButton1Click:Connect(function()
	ClickSoundInstance:Play()
	FrameAnimations.Credits(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
	wait(1)
	ContactListButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
	ContactListButton.ImageColor3 = Color3.fromRGB(0,0,0)
	ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	ShopMenuButton.ImageColor3 = Color3.fromRGB(255,255,255)
	homeButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
	homeButton.ImageColor3 = Color3.fromRGB(255,255,255)
	homeButton.Active = false
	ContactListButton.Active = true
	ShopMenuButton.Active = false
	shopMenu.Visible = false
	currentHolderTextlabel.Text = "Credits"
end)

UIS.InputBegan:Connect(function(input, chatting)
	if not chatting then
		if input.KeyCode == Enum.KeyCode[RightKey] then
			if homeButton.Active == true then
				shopMenu.Visible = true
				FrameAnimations.Shop(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
				wait(1)
				ShopMenuButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
				ShopMenuButton.ImageColor3 = Color3.fromRGB(0,0,0)
				ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ContactListButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				homeButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.Active = false
				ShopMenuButton.Active = true
				ContactListButton.Active = false
				currentHolderTextlabel.Text = "Shop"
			elseif ShopMenuButton.Active == true then
				FrameAnimations.Credits(HomePage, shopMenu,UpdateFrame, creditsFrame, settingsFrame)
				wait(1)
				ContactListButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
				ContactListButton.ImageColor3 = Color3.fromRGB(0,0,0)
				ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ShopMenuButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				homeButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.Active = false
				ContactListButton.Active = true
				ShopMenuButton.Active = false
				shopMenu.Visible = false
				currentHolderTextlabel.Text = "Credits"
			-- credits but not made yet
			elseif ContactListButton.Active == true then
				FrameAnimations.Back(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
				wait(1)
				homeButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
				homeButton.ImageColor3 = Color3.fromRGB(0,0,0)
				ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ShopMenuButton.ImageColor3 = Color3.fromRGB(255,255,255)
				ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ContactListButton.ImageColor3 = Color3.fromRGB(255,255,255)
				ContactListButton.Active = false
				homeButton.Active = true
				ShopMenuButton.Active = false
				currentHolderTextlabel.Text = "Home"
			end
		end
		if input.KeyCode == Enum.KeyCode[LeftKey] then
			if homeButton.Active == true then
				FrameAnimations.Credits(HomePage, shopMenu,UpdateFrame, creditsFrame, settingsFrame)
				wait(1)
				ContactListButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
				ContactListButton.ImageColor3 = Color3.fromRGB(0,0,0)
				ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ShopMenuButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				homeButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.Active = false
				ContactListButton.Active = true
				ShopMenuButton.Active = false
				shopMenu.Visible = false
				currentHolderTextlabel.Text = "Credits"

			elseif ShopMenuButton.Active == true then
				FrameAnimations.Back(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
				wait(1)
				homeButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
				homeButton.ImageColor3 = Color3.fromRGB(0,0,0)
				ShopMenuButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ShopMenuButton.ImageColor3 = Color3.fromRGB(255,255,255)
				ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ContactListButton.ImageColor3 = Color3.fromRGB(255,255,255)
				ContactListButton.Active = false
				homeButton.Active = true
				ShopMenuButton.Active = false
				currentHolderTextlabel.Text = "Home"
			elseif ContactListButton.Active == true then
				shopMenu.Visible = true
				FrameAnimations.Shop(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
				wait(1)
				ShopMenuButton.BackgroundColor3 = Color3.fromRGB(204, 57, 57)
				ShopMenuButton.ImageColor3 = Color3.fromRGB(0,0,0)
				ContactListButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				ContactListButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.BackgroundColor3 = Color3.fromRGB(72, 52, 51)
				homeButton.ImageColor3 = Color3.fromRGB(255,255,255)
				homeButton.Active = false
				ShopMenuButton.Active = true
				ContactListButton.Active = false
				currentHolderTextlabel.Text = "Shop"
			end
		end
		if input.KeyCode == Enum.KeyCode.F then
			FrameAnimations.Settings(HomePage, shopMenu, UpdateFrame, creditsFrame, settingsFrame)
		end
	end
end)
----------------------------------------------------------------------------------------------------
-- gamepass handler
for i, gamepassButtons in pairs(shopMenu:GetChildren()) do
	if gamepassButtons:IsA("TextButton") then
		gamepassButtons.MouseButton1Click:Connect(function()
			promptPurchase(gamepassButtons.Name, gamepassButtons:WaitForChild("gamePassID").Value)
			return gamepassButtons
		end)
	end
end
-----------------------------------------------------------------------------------------------------
-- Player Info
wait(1)
local FriendsOnline = Player:GetFriendsOnline()
userNameText.Text = Player.Name
pfp.Image = "https://www.roblox.com/bust-thumbnail/image?userId="..Player.UserId.."&width=420&height=420&format=png"

local friendsOnlineNumber = 0
for _, friend in pairs(FriendsOnline) do
	if friend.PlaceId == game.PlaceId then
		friendsOnlineNumber = friendsOnlineNumber + 1
	end
end

friendsPlayingCount.Text = friendsOnlineNumber
-- rank and regiment code
if Player:IsInGroup(2955779) then
	local splitRankOne = string.split(tostring(Player:GetRoleInGroup(2955779)), "[") 
	local splitRankTwo = string.split(tostring(splitRankOne[2]), "]")
	local abreviatedRank = tostring(splitRankTwo[1])
	local fullRank = tostring(splitRankTwo[2])
	rankNumber.Text = abreviatedRank
	rankWord.Text = fullRank
else
	rankNumber.Text = "CIV"
	rankWord.Text = "Civillian"
end

for i, rank in pairs(RegimentModule) do
	if Player:IsInGroup(rank["GroupID"]) and i ~= 2 and i ~= 18 and i~= 17 then
		regimentWordText.Text = rank["Title"]
		inRegimentWord.Text = Player:GetRoleInGroup(rank["GroupID"])
		local groupImage = GroupService:GetGroupInfoAsync(rank["GroupID"]).EmblemUrl
		regimentLogo.Image = groupImage
		break 
	end
	if Player:IsInGroup(14874177) and Player:GetRankInGroup(14874177) >= 247 then
		regimentWordText.Text = "Royal Engineers"
		inRegimentWord.Text = Player:GetRoleInGroup(14874177)
		local groupImage = GroupService:GetGroupInfoAsync(14874177).EmblemUrl
		regimentLogo.Image = groupImage
		break 
	end
	if Player:IsInGroup(2955779) and i == 17 then
		regimentWordText.Text = "N/A"
		inRegimentWord.Text = "N/A"
		break 
	end
	if Player:IsInGroup(2955779) and i == 18 then
		regimentWordText.Text = "N/A"
		inRegimentWord.Text = "N/A"
		break 
	end
	if not Player:IsInGroup(2955779) then
		regimentWordText.Text = "CIV" 
		inRegimentWord.Text = "N/A"
		break 
	end
end
--------------------------------------------------------------------------------------------------------
-- settings frame
local cache = {} 
local shadows = {} 
for i, part in pairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") then
		cache[part] = part.Material 
		shadows[part] = part.CastShadow
	end
end

local decreaeGraphicsButton = settingsFrame:WaitForChild("Decrease Graphics").holder:WaitForChild("button")
local decreaeGraphicsValue = false

decreaeGraphicsButton.MouseButton1Click:Connect(function()
	if decreaeGraphicsValue == false then
		decreaeGraphicsValue = true
		decreaeGraphicsButton.Text = "Toggle off"
		for _, part in pairs(workspace:GetDescendants()) do
			if part:IsA("BasePart") and cache[part] ~= nil and shadows[part] ~= nil then
				part.Material = Enum.Material.Plastic
				part.CastShadow = false
			end
		end
		
	elseif decreaeGraphicsValue then
		decreaeGraphicsValue = false
		decreaeGraphicsButton.Text = "Toggle on"
		for i, part in pairs(workspace:GetDescendants()) do
			if part:IsA("BasePart") and cache[part] ~= nil and shadows[part] ~= nil then
				part.Material = cache[part]
				part.CastShadow = shadows[part]
			end
		end
	end
end)
--------------------------------------------------------------------------------------------------------------------
local timeSpent = Player.TimeSpent
local timeValue = timeSpent.Value
timeSpent:GetPropertyChangedSignal("Value"):Connect(function()
	timeValue = timeSpent.Value
end)
spawn(function()
  while wait() do
    local days = math.floor((timeValue) / 1440)
    local hours = math.floor((timeValue) / 60) % 24
    local minutes = math.floor((timeValue) / 1) % 60
    timePlayed.Text = days.. "d " .. hours.."h ".. minutes .."m"
  end
end)
-- end of code
