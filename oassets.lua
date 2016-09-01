--Oassets
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl, titleText

local function contactlist( event )


end


 local function pvonSendSMS( event )
	-- compose an SMS message (doesn't support attachments)
        print(junkn)
        junkl=( string.format( "%s %q", junkn, ", ") )
       -- junkn=("testsms")
        local options =
	{
	   to = { "junkn" },
	   body = "I scored over 9000!!! Can you do better?"
	}
	local result = native.showPopup("sms", options)

	if not result then
		print( "SMS Not supported/setup on this device" )
		native.showAlert( "Alert!",
		"SMS not supported/setup on this device.", { "OK" }
		)
	end
	
	-- NOTE: options table (and all child properties) are optional
end
   
 local function onSendSMS( event )
    


            
            
          
end

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
 _G.GUI.RemoveAllWidgets()
--  local titleText = display.newText( "                    ", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( dispname, halfW, titleBar.y, native.systemFontBold, 22 )
end


function scene:show( event )
	local group = self.view

local ListData =     
	{
                { iconR = 23, caption = "Office Details" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
                { iconL = 33, caption = "Add new Office Details"        , fileName = "sample_list_scro" },
                { iconL = 30, caption = "View Office All"        , fileName = "configapp" },
                { iconL = 31, caption = "Edit Office  "        , fileName = "sample_list_scroll" },
		 { iconL = 32, caption = "Delete Office Details"        , fileName = "sample_list_scroll" },
                { iconR = 23, caption = "Asset items" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
                { iconL = 29, caption = "Add New Asset"         },
                { iconL = 30, caption = "View Assets"        , fileName = "configapp" },
                { iconL = 31, caption = "Delete Assets"        , fileName = "sample_list_scroll" },
                { iconR = 23, caption = "Stock Items" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
		{ iconL = 32, caption = "Enter New Stock"        , fileName = "sample_list_scroll" },
                { iconL = 29, caption = "View Stock"        , fileName = "sample_list_scro" },
                { iconL = 33, caption = "Edit Stock (not working)"        , fileName = "sample_list_scro" },
                { iconL = 30, caption = "Email Stock List"        , fileName = "configapp" },
                { iconR = 23, caption = "Spare" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
                { iconL = 31, caption = "Spare"        , fileName = "sample_list_scroll" },
               
	}

----------------------------------
-- MAIN MENU LIST
----------------------------------
_G.GUI.NewList(
	{
	x                 = "center",               
	y                 = "center",               
	width             = "95%",                  
	height            = "70%",  
        fontSize        = fonts, 
	scale             = _G.GUIScalec,
	parentGroup       = MainWindow,                    
	theme             = _G.theme,               
	name              = "LST_MAIN",             
	caption           = "Offices",   
	list              = ListData,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.selectedIndex)
                                 print("Selected Items Number: "..seled)
                                if seled==2 then composer.gotoScene("kit1")end
                                 if seled==3 then composer.gotoScene("offall")end 
                                 if seled==4 then composer.gotoScene("offedit") end
                                 if seled==5 then composer.gotoScene("deloffice")end
                                 if seled==7 then composer.gotoScene("ade")end 
                                 if seled==8 then composer.gotoScene("aditem")end 
                                 if seled==9 then composer.gotoScene("delasset")end
                                 if seled==11 then composer.gotoScene("newano")end 
                                 if seled==12 then composer.gotoScene("voa")end 
                                 if seled==13 then composer.gotoScene("ano")end
                                if seled==14 then composer.gotoScene("dstockall")end
                                 if seled==1 then composer.gotoScene("Vacant")end 
                                 if seled==16 then composer.gotoScene("voa")end 
                            end,    
	} )
       -- _G.GUI.GetHandle("Bar1"):show(false)
  _G.GUI.GetHandle("NewList")  

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
                                if selectd==1 then composer.gotoScene("intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(2)
        






end
function scene:exit( event )
	local group = self.view
        --_G.GUI.GetHandle("Bar1"):show(false)
        _G.GUI.GetHandle("BAR1"):destroy()
        _G.GUI.GetHandle("LST_MAIN"):destroy()
        _G.GUI.GetHandle("WIN_SAMPLE"):destroy()
        _G.GUI.GetHandle("IMG_SAMPLE"):destroy()
        --_G.GUI.GetHandle("intro"):destroy()
        _G.GUI.RemoveAllWidgets()
        titleText:removeSelf()
        LST_MAIN:removeSelf()
      --  composer.removeScene("intro")
      --  composer.purgeScene("intro")
        composer.removeScene("main")
        composer.purgeScene("main")
         composer.removeScene("oassets")
        composer.purgeScene("oassets")
        
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene
