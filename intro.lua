-- Intro
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl


   
 

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
 local titleText = display.newText( dispname, halfW, titleBar.y, native.systemFontBold, 22 )
end


function scene:show( event )
	local group = self.view
 _G.GUI.RemoveAllWidgets()
 

--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )
_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "center",
		scale           = _G.GUIScale,
		parentGroup     = nil,
		width           = "60%",
		height          = "60%",
		minHeight       = 70,
		theme           = _G.theme,
		name            = "WIN_SAMPLE",
		--caption         = "IMAGE",
		textAlign       = "center",
		--icon            = 43,
                margin          = 10,
		--shadow          = true,
		closeButton     = false,
		--dragX           = true,
		--dragY           = true,
		--slideOut        = .7,
		--dragArea        = "auto",
		--onPress         = function(EventData) print("WINDOW PRESSED!") end,
		--onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		--onRelease       = function(EventData) print("WINDOW RELEASED!") end,
		onClose         = function(EventData) _G.UnloadSample() end,
		} )

	-- ADD CUSTOM IMAGE (CAN ALSO BE A SHAPE, GROUP ETC.)
	-- DO NOT FORGET TO SET YOUR REFERENCES TO THIS OBJECT
	-- TO NIL IF YOU DO NOT NEED IT ANYMORE -SEE V.Remove() BELOW:
	Image = display.newImage("icon3.jpg")
	
	_G.GUI.NewImage( Image, 
		{
		x               = "center",                
		y               = "center", 
		width           = "100%",
		height          = "100%",
		name            = "IMG_SAMPLE",            
		parentGroup     = "WIN_SAMPLE",
		--border          = {"inset",4,1, .96,1,.9,.19}, 
		onPress         = function(EventData) print("IMAGE PRESSED!"); EventData.Widget:setImage(display.newImage("liz.png"), false)  end,
		onRelease       = function(EventData) print("IMAGE RELEASED!"); EventData.Widget:setImage(display.newImage("liz.png"), false)  end,
		onDrag          = function(EventData) print("IMAGE DRAGGING!") end,
		} )
		
	_G.GUI.GetHandle("WIN_SAMPLE"):layout(true)


_G.GUI.NewIconBar(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "90%",
		height          = 50,
		scale           = _G.GUIScaleb,
		name            = "BAR1",            
		parentGroup     = nil,                     
		theme           = "theme_4",               
		border          = {"normal",6,1, .37,.37,.37,1,  .72,.72,.72,.58}, 
		bgImage         = {"images/iconbar_background.png", .45, "add" },
		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
		glossy		= 0,
		iconSize        = 32,
		fontSize        = fonts,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           = 
			{
				{icon = 13 , flipX = false, text = "Intro"},
				{icon = 11 , flipX = false, text = "Assets"},
				{icon = 17, flipX = false, text = "Search"},
                                {icon = 18, flipX = false, text = "Config"},
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                print(selectd)
                                if selectd==4 then composer.gotoScene("configg")end
                                if selectd==3 then composer.gotoScene("options")end
                                if selectd==2 then composer.gotoScene("oassets")end
                                if selectd==1 then composer.gotoScene("Intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(1)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
        --WIN_SAMPLE:removeSelf()
       --  composer.removeScene("intro")
       -- composer.purgeScene("intro")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene
