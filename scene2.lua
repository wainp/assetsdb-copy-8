local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )


function scene:createScene( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
 
 
 --composer:removeScene("scene3")
local titleText = display.newText( "Parks SMSssss", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

_G.GUI.NewIconBar(
		{
		x               = "right",                
		y               = "bottom",                
		width           = "100%",
		height          = 60,
		scale           = _G.GUIScale,
		name            = "BAR3",            
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
				{icon = 13 , flipX = false, text = "SMS"},
				{icon = 11 , flipX = false, text = "Email"},
				{icon = 17, flipX = false, text = "Contacts"},
			
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                --print(selectd)
                                if selectd==2 then composer.gotoScene("scene1")end
                                if selectd==3 then composer.gotoScene("scene2")end
                                if selectd==1 then composer.gotoScene("Intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR3"):setMarker(2)
        
_G.GUI.NewInfoBubble(
		{
		x               = "center",                
		y               = "center", 
		width           = 150,
		scale           = _G.GUIScale,
		name            = "TOOLTIP1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Welcome to the Eltham applet.",
		icon            = 14,
		textAlign       = "center",
		fontSize        = 18,
		textColor       = {.2,.2,.2},
		color           = {1,1,1},
		showArrow       = true,
		position        = "top",
		animation       = true,
		bubbleAlpha     = 1.0,
		targetDistance  = 20,
		-- HIDE ON TAP
		onPress         = function(EventData) EventData.Widget:show(false, true) end,
		} )


end


function scene:enterScene( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
 
 
 --composer:removeScene("scene3")
local titleText = display.newText( "Prks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

_G.GUI.NewIconBar(
		{
		x               = "right",                
		y               = "bottom",                
		width           = "100%",
		height          = 60,
		scale           = _G.GUIScale,
		name            = "BAR3",            
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
				{icon = 13 , flipX = false, text = "SMS"},
				{icon = 11 , flipX = false, text = "Email"},
				{icon = 17, flipX = false, text = "Contacts"},
				
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                --print(selectd)
                                if selectd==2 then composer.gotoScene("scene1")end
                                if selectd==3 then composer.gotoScene("scene2")end
                                
                                if selectd==1 then composer.gotoScene("Intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR3"):setMarker(2)
        
_G.GUI.NewInfoBubble(
		{
		x               = "center",                
		y               = "center", 
		width           = 150,
		scale           = _G.GUIScale,
		name            = "TOOLTIP1",            
		parentGroup     = nil,                     
		theme           = _G.theme, 
		caption         = "Welcome to the Eltham applet.",
		icon            = 14,
		textAlign       = "center",
		fontSize        = 18,
		textColor       = {.2,.2,.2},
		color           = {1,1,1},
		showArrow       = true,
		position        = "top",
		animation       = true,
		bubbleAlpha     = 1.0,
		targetDistance  = 20,
		-- HIDE ON TAP
		onPress         = function(EventData) EventData.Widget:show(false, true) end,
		} )






end
function scene:exitScene( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
          composer.removeScene("scene1")
        composer.purgeScene("scene1")
end

function scene:destroyScene( event )
	
end


scene:addEventListener( "createScene" )
scene:addEventListener( "exitScene" )
scene:addEventListener( "enterScene" )
scene:addEventListener( "destroyScene" )

return scene
