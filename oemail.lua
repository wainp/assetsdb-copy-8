require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
_G.GUI = require("widget_candy")
-- Require the widget library
local widget = require( "widget" )

 local function pvemail( event )

	-- compose an HTML email with two attachments
	local options =
	{
	   to = { "pwain@parks.vic.gov.au" },
	   --cc = {  },
	   subject = "PVDB",seloffice,
	   isBodyHtml = true,
	   body = "",
	   attachment =
	   {
		  { baseDir=system.ResourceDirectory, filename="email.png", type="image" },
		  { baseDir=system.ResourceDirectory, filename="coronalogo.png", type="image" },
	   },
	}
	local result = native.showPopup("mail", options)
	
	if not result then
		print( "Mail Not supported/setup on this device" )
		native.showAlert( "Alert!",
		"Mail not supported/setup on this device.", { "OK" }
	);
	end
	-- NOTE: options table (and all child properties) are optional
	
end
	
	
   
 

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
        local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
        titleBar:setFillColor( titleGradient ) 
        titleBar.y = titleBar.contentHeight * 0.5
end


function scene:show( event )
	local group = self.view
        local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
        titleBar:setFillColor( titleGradient ) 
        titleBar.y = titleBar.contentHeight * 0.5
         _G.GUI.RemoveAllWidgets()
        display.setStatusBar(display.HiddenStatusBar)
        --local titleText = display.newText( "Email Database", halfW, titleBar.y, native.systemFontBold, 22 )
 

--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )









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
		fontSize        = 15,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           = 
			{
				{icon = 13 , flipX = false, text = "Intro"},
				{icon = 11 , flipX = false, text = "Assets"},
				{icon = 17, flipX = false, text = "Maintenance"},
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
pvemail()
_G.GUI.NewTextSimple(
		{
		x               = "center",                
		y               = "center", 
		width           = "50%",
		scale           = _G.GUIScale,
		height          = "auto",
		name            = "TXT_1",            
		parentGroup     = nil,                     
		theme           = "theme_1",
		textColor       = {1,1,1},
		caption         = "NewTextSimple() creates a simple wrapped text which is faster than NewText() but provides left-aligned text wrapping only, no centered or right-aligned text.",
		textAlign       = "left", -- IGNORED BY NewTextSimple()
		border          = {"normal",4,1, 1,1,1,.25, 0,0,0,1},
		} )



	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(1)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
       --   composer.removeScene("intro")
        --composer.purgeScene("intro")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene
