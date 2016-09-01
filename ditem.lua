require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
_G.GUI = require("widget_candy")
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local coname, coversion, coupdate, coregistered, codbversion
local oname, oversion, oupdate, oregistered, odbversion
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
_G.GUI = require("widget_candy")
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local coname, coversion, coupdate, coregistered, codbversion
local item, make, modal, oitem, omake, omodal




 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("kit1")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("options")      
        
        
end
   
 local function onassetcomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("ditems")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")      
        
        
end
      
   local function deletedb()
        local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    stmt = sqlite3.open( path ) 
    local stmt = db:prepare[[DELETE FROM office WHERE office = ?]];
stmt:bind_values(seloffice)
stmt:step();
    
    
   
    
   
      -- _G.UnloadSample()
      composer.gotoScene("options")
   end
   
 local function dbsavedb( event )
     
_G.GUI.Confirm(
		{
		name       = "WIN_ALERT1",
		modal      = true,
		theme      = _G.theme, 
		width      = "65%",
		height     = "auto",
		scale      = _G.GUIScale,
		icon       = 14,
		fadeInTime = 500,
		title      = "Unload this sample?",
		caption    = "Would you like to unload this sample and return to the main list?", 
		onPress    = function(EventData) print("Button pressed: "..EventData.button) end,
		onRelease  = function(EventData) if EventData.button == 1 then deletedb() end end,
		buttons    = 
			{
				{icon = 15, caption = "Yes",},
				{icon = 16, caption = "No" ,},
			},
		} )


end


function scene:show( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
 local titleText = display.newText( "Delete Office Details - ditem", halfW, titleBar.y, native.systemFontBold, 22 )
 
 dbsavedb()
 
 
 
 
 local path = system.pathForFile("asset.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    
   local sql = "SELECT * FROM office "
     for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        if seloffice==row.office then
            dbsavedb()
        
            
           end
 
 end
 
 
 	--local group = self.view
        
--        local statusText = display.newText( "Name", 120, 90, 200, 0, native.systemFont, 22 )     
--        oname = native.newTextField( 250, 90, 156, 12 )
--        oname:addEventListener( "userInput", onamel )
--        oname:setTextColor(0, 0, 0)
_G.GUI = require("widget_candy")

-- CREATE THE WIDGET
_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "15%",
		scale           = _G.GUIScale,
		parentGroup     = nil,
		width           = "95%",
		height          = "65%",
		minHeight       = 50,
		theme           = _G.theme,
		name            = "Owner1",
		caption         = "Display Exsisting Items",
		textAlign       = "center",
		icon            = 19,
		fadeInTime      = 500,
                modal           = "True",
		margin          = 20,
		noTitle         = false,
		shadow          = true,
		closeButton     = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		--onPress         = function(EventData) print("WINDOW PRESSED!") end,
		--onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		--onRelease       = function(EventData) print("WINDOW RELEASED!"..EventData.value) end,
		--onWidgetPress   = function(EventData) print("WINDOW WIDGET PRESSED: "..EventData.name) end,
		onClose         = function(EventData) _G.UnloadSample() end,
		} )
                
--V.defaultCaption = "Enter Your Name..."

        _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "2%",
		parentGroup     = "Owner1",
		width           = "80%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "Item",
                FontSize        = "32",
                quitCaption      ="Tap screen to finish text input.",
		caption         = aitem,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
               -- onBlur          =  if EventData.value == "Name" then "oname"=EventData.value end,
	--					  end,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Item" then _G.GUI.Set("Item", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "Item",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                                onBlur          = function(EventData) oitem=EventData.value end,
                             --   onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
                } )
                

_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "20%",
		parentGroup     = "Owner1",
		width           = "40%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "Make",
                FontSize        = "22",
		caption         = amake,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Make" then _G.GUI.Set("Make", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Make",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) omake=EventData.value end,
                } )
  _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "40%",
		parentGroup     = "Owner1",
		width           = "40%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "Modal",
                FontSize        = "22",
		caption         = amodal,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Modal" then _G.GUI.Set("Modal", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "Modal",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) omodal=EventData.value end,
                } )              
               

_G.GUI.NewButton(
		{
		x               = "right",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = owner1,                     
		theme           = _G.theme,               
		caption         = "Cancel", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		--onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
		onRelease       = function(EventData) 
                                                        onassetcomplete()
							-- RELEASED WHILE INSIDE BUTTON?
							--if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	  --                  else EventData.Widget:set("caption", "Saved") end
						  end,
		} )








_G.GUI.NewButton(
		{
		x               = "left",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Save.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		--onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
		onRelease       = function(EventData) 
                                        dbsavedb()
				  end,
		} )

                
                
                
   
--_G.GUI.NewIconBar(
--		{
--		x               = "center",                
--		y               = "bottom",                
--		width           = "90%",
--		height          = 50,
--		scale           = _G.GUIScale,
--		name            = "BAR1",            
--		parentGroup     = nil,                     
--		theme           = "theme_4",               
--		border          = {"normal",6,1, .37,.37,.37,1,  .72,.72,.72,.58}, 
--		bgImage         = {"images/iconbar_background.png", .45, "add" },
--		marker          = {8,1, 1,1,1,.39,  0,0,0,.19}, 
--		glossy		= 0,
--		iconSize        = 32,
--		fontSize        = 15,
--		textColor       = {.25,.25,.25},
--		textColorActive = {1,1,1},
--		textAlign       = "bottom",
--		iconAlign       = "top",
--		icons           = 
--			{
--				{icon = 13 , flipX = false, text = "Intro"},
--				{icon = 11 , flipX = false, text = "Deploy"},
--				{icon = 17, flipX = false, text = "Cache"},
  --                              {icon = 18, flipX = false, text = "Config"},
--			},
                        
  --           onPress         = function(EventData)
  --                              print("ICON "..EventData.selectedIcon.." PRESSED!") 
  --                              
  --                              selectd=EventData.selectedIcon
  --                              print(selectd)
  --                              if selectd==4 then dbsavedb() end--composer.gotoScene("configg")end
  --                              if selectd==3 then composer.gotoScene("options")end
  --                              if selectd==2 then composer.gotoScene("deploy")end
  --                              if selectd==1 then composer.gotoScene("Intro")end
                                
 --                               end, 
--		} )

	-- SELECT ICON NUMBER 1
--	_G.GUI.GetHandle("BAR1"):setMarker(4)
        






end
function scene:exit( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
       --   composer.removeScene("intro")
        --composer.purgeScene("intro")
        _G.GUI.GetHandle("INP_SAMPLE"):destroy() 
	_G.GUI.GetHandle("TXT_1"):destroy() 
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene











