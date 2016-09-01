--Options
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl

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
  --      _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
-- _G.GUI.RemoveAllWidgets()
 
 
 --composer:removeScene("scene3")
--local titleText = display.newText( "Parks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
    _G.GUI.RemoveAllWidgets()
         composer.removeScene("sitem")
        composer.purgeScene("sitem")
        composer.removeScene("soffice")
        composer.purgeScene("soffice")
        --_G.GUI.GetHandle("ListDatasic"):destroy() 
	
local ListData =     
	{
        }

local ListData =     
	{
                { iconR = 23, caption = "Search Criteria" , textColor = {1,1,.39}, bgColor = {0,0,0}, selectable = false },
                { iconL = 29, caption = "Search Office"         },
                { iconL = 30, caption = "Search Asset Number"        , fileName = "configapp" },
                { iconL = 31, caption = "Search Serial"        , fileName = "sample_list_scroll" },
		{ iconL = 32, caption = "Search item"        , fileName = "sample_list_scroll" },
               -- { iconL = 29, caption = "Search Vacant"        , fileName = "sample_list_scro" },
               -- { iconL = 33, caption = "Search Vacant"        , fileName = "sample_list_scro" },
               
               
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
	name              = "LST_MAIN2",             
	caption           = "Serials",   
	list              = ListData,               
	allowDelete       = false, 
	readyCaption      = "Quit Editing",   
	scrollbar         = "onScroll",
	scrollbarAlpha    = 255,
	border            = {"shadow", 8,8, .25},
	onSelect          = function(EventData) 
                                 seled =(EventData.selectedIndex)
                                 print("Selected Items Number: "..seled)
                               if seled==2 then composer.gotoScene("searchoffice")end
                               if seled==3 then composer.gotoScene("san")end
                               if seled==4 then composer.gotoScene("ssn")end
                                if seled==5 then composer.gotoScene("searchitem")end
                                if seled==7 then composer.gotoScene("aditem")end
                                if seled==8 then composer.gotoScene("eitem")end
                                if seled==9 then composer.gotoScene("delasset")end
                            end,
        
        
        
       -- onPress          = function(EventData)
         --                       print("ICON "..EventData.selectedIcon.." PRESSED!") 
           --                     
             --                   selectd=EventData.selectedIcon
               --                 print(selectd)
                 --               if selectd ==1 then composer.gotoScene("tab1")end
                   --             if selectd==2 then composer.gotoScene("tab2")end
                     --           if selectd==3 then composer.gotoScene("tab3")end
        
        
        
	} )
       -- _G.GUI.GetHandle("Bar1"):show(false)
 -- _G.GUI.GetHandle("NewList")  

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
		fontSize        =fonts,
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
	_G.GUI.GetHandle("BAR1"):setMarker(3)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.GetHandle("Bar1"):show(false)
        _G.GUI.RemoveAllWidgets()
        LST_MAIN2:removeSelf()
         composer.removeScene("options")
        composer.purgeScene("options")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene
