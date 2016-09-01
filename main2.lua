local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
--local widget = require( "widget" )
local selectd
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5




display.setStatusBar( display.HiddenStatusBar )	

local BG = display.newGroup()                 -- TO HOLD BACKGROUND IMAGES
local LoadedSample                            -- THIS IS WHERE WE LOAD ANY CHOSEN SAMPLE CODE INTO

_G.GUI = require("widget_candy")              -- LOAD WIDGET CANDY, USING A GLOBAL VAR, SO WE CAN ACCESS IT FROM ANY LOADED SAMPLE CODE, TOO
--_G.GUI.LoadTheme("theme_1", "themes/theme_1/")-- LOAD THEME 1
--_G.GUI.LoadTheme("theme_2", "themes/theme_2/")-- LOAD THEME 2
--_G.GUI.LoadTheme("theme_3", "themes/theme_3/")-- LOAD THEME 3
_G.GUI.LoadTheme("theme_4", "themes/theme_4/")-- LOAD THEME 4
--_G.GUI.LoadTheme("theme_5", "themes/theme_5/")-- LOAD THEME 5
--_G.GUI.LoadTheme("theme_6", "themes/theme_6/")-- LOAD THEME 6
--_G.GUI.LoadTheme("theme_7", "themes/theme_7/")-- LOAD THEME 7

-- HIGHLIGHT ALL TOUCH EVENTS
_G.GUI.ShowTouches(true, 128, {.7,.7,1})

-- THIS IS TO FIND OUT IF THE APP RUNS ON A TABLET OR A SMALL DISPLAY
-- IF WE HAVE A TABLET, SCALE DOWN THE GUI TO THE HALF, OTHERWISE THE
-- WIDGETS APPEAR TOO BIG. YOU CAN USE ANY SCALE, BUT .5 IS FINE HERE.
-- CHANGING THE SCALE OF A WIDGET DOES NOT CHANGE ITS WIDTH OR HEIGHT,
-- IT JUST SCALES THE WIDGET GRAPHICS USED (BORDERS, ICONS, TEXT ETC.)
local physicalW = math.round( (display.contentWidth  - display.screenOriginX*2) / display.contentScaleX)
local physicalH = math.round( (display.contentHeight - display.screenOriginY*2) / display.contentScaleY)
_G.isTablet     = false; if physicalW >= 1024 or physicalH >= 1024 then isTablet = true end
_G.GUIScale     = _G.isTablet == true and .5 or 1.0

-- UNCOMMENT THIS TO SEE ALL WIDGET CANDY MESSAGES:
--_G.GUI.SetLogLevel(2)

-- THEME TO USE (UNLESS CHANGED TO ANOTHER ONE)
_G.theme = "theme_4"

-- LET WIDGET CANDY KNOW THE ALLOWED ORIENTATIONS
_G.GUI.SetAllowedOrientations({"landscapeRight","landscapeLeft","portrait","portraitUpsideDown"})

-- TEXT LABEL TO DISPLAY FILE NAME OF CURRENTLY LOADED SAMPLE
--_G.GUI.NewLabel(
--	{
--	x               = "center",                
--	y               = -5, 
--	width           = "100%",
--	scale           = _G.GUIScale,
--	name            = "LBL_FILENAME",            
--	parentGroup     = nil,                     
--	theme           = _G.theme, 
--	caption         = "",
--	textAlign       = "center",
--	textColor       = {1,1,1},
--	} )

----------------------------------
-- BACK BUTTON
----------------------------------
_G.GUI.NewSquareButton(
	{
	x               = "left",     
	y               = "top",      
	scale           = _G.GUIScale,
	name            = "BUT_BACK", 
	parentGroup     = nil,        
	theme           = _G.theme,   
	icon            = 10,         
	onRelease       = function(EventData) _G.UnloadSample()  end,
	} )
_G.GUI.GetHandle("BUT_BACK"):show(false) -- HIDE BACK BUTTON AT START

----------------------------------
-- SKIN CHANGE BUTTONS
----------------------------------
_G.GUI.NewIconBar(
		{
		x               = "right",                
		y               = "bottom",                
		width           = "100%",
		height          = 60,
		scale           = _G.GUIScale,
		name            = "BAR1",            
		parentGroup     = nil,                     
		theme           = "theme_4",               
		border          = {"normal",6,1, .37,.37,.37,1,  .72,.72,.72,.58}, 
		bgImage         = {"images/iconbar_background.png", .45, "add" },
		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
		glossy		= 0,
		iconSize        = 32,
		fontSize        = 15,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           = 
			{
				{icon = 13 , flipX = false, text = "Scout"},
				{icon = 11 , flipX = false, text = "Leaders"},
				{icon = 17, flipX = false, text = "District"},
				{icon = 38, flipX = true , text = "Badge"},
				{icon = 21, flipX = false, text = "Config"},
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                --print(selectd)
                                if selectd==2 then composer.gotoScene("scene1")end
                                if selectd==3 then composer.gotoScene("scene2")end
                                if selectd==4 then composer.gotoScene("scene3")end
                                if selectd==5 then composer.gotoScene("scene4")end
                                if selectd==1 then composer.gotoScene("main")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(1)



_G.GUI.NewIconBar(
	{
	x               = "left",                
	y               = 50,                
	width           = 45,
	height          = 250,
	scale           = _G.GUIScale,
	name            = "BAR_SKINSELECT",            
	parentGroup     = nil,                     
	theme           = _G.theme,               
	border          = {"normal",6,1, .07,.07,0,.39,  .72,.72,.72,.58}, 
	marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
	glossy          = .15,
	iconSize        = 24,
	icons           = { {icon = 49}, {icon = 50}, {icon = 51}, {icon = 52}, {icon = 53}, {icon = 54}, {icon = 55},	},
	onPress         = function(EventData) 
				print("SWITCHING TO THEME "..EventData.selectedIcon)
				_G.theme = "theme_"..EventData.selectedIcon
				_G.GUI.SetTheme(_G.theme, true)
			end,
	} )

-- SELECT ICON NUMBER 1
_G.GUI.GetHandle("BAR_SKINSELECT"):show(false)--setMarker(1)

--function scene:destroyScene( event )
--	local group = self.view

----------------------------------
-- ANIMATED BACKGROUND
----------------------------------
local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )
local screenW = display.contentWidth
local screenH = display.contentHeight
local BG1     = display.newImage(BG, "images/bg.jpg") -- BACKGROUND IMAGE
local BG2     = display.newImage(BG, "images/bg.jpg") -- BACKGROUND IMAGE
BG1.xScale    = (BG1.width  / screenW * 1.5)
BG1.yScale    =  BG1.xScale
BG2.xScale    =  BG1.xScale
BG2.yScale    =  BG1.yScale
BG1.x         = screenW * .5
BG1.y         = screenH * .5
BG2.x         = screenW * .5
BG2.y         = screenH * .5
BG2.blendMode = "add"
BG2.alpha     = 0.75

timer.performWithDelay(1,function()
	BG1.rotation = math.sin(system.getTimer()*.00001)*360 
	BG2.rotation = math.sin(system.getTimer()*.00004)*360 
	BG1.x        = screenW*.5 + math.cos(system.getTimer()*.0005)*40 
	BG1.y        = screenH*.5 + math.sin(system.getTimer()*.001)*40 
	BG2.x        = screenW*.5 + math.sin(system.getTimer()*.0005)*50 
	BG2.y        = screenH*.5 + math.cos(system.getTimer()*.001)*50 
	BG2.alpha    = .8 + math.sin(system.getTimer()*.001)*.2
end,0)




--------------------------------------------------------------------------------
function scene:destroyScene( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
end
--scene:addEventListener( "createScene" )
--scene:addEventListener( "exitScene" )
--scene:addEventListener( "enterScene" )
scene:addEventListener( "destroyScene" )
return scene

