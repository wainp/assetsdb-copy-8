-- Kit1
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
_G.GUI = require("widget_candy")
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl, evx, evy
local coname, coversion, coupdate, coregistered, codbversion
local oname, oversion, oupdate, oregistered, odbversion, ove, titleText
local currentLatitude = 0
local currentLongitude = 0
local latitude 
local longitude 
display.setStatusBar( display.HiddenStatusBar )

display.setDefault( "anchorX", 0.0 )
 
 
 local function map( event )
mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. currentLatitude .. "," .. currentLongitude
	system.openURL( mapURL )

end

 local function oncomplete( event )
    _G.GUI.RemoveAllWidgets()
    composer.removeScene("kit1")
    composer.gotoScene("oassets")            
end
     
 local function dbsavedb( event )
    if oregistered == nil then oregistered ="X" end
    if oupdate == nil then oupdate ="Address" end
    if odbversion == nil then odbversion ="N/A" end
    if oversion == nil then oversion ="N/A" end
    if oname == nil then oname ="N/A" end
    local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    mcst = sqlite3.open( path ) 
    local tablefill =[[INSERT INTO office VALUES (NULL, ']]..oname..[[',']]..oupdate..[[',']]..evx..[[',']]..evy..[[',']]..odbversion..[['); ]]
    mcst:exec( tablefill )
    db:close()
    _G.GUI.RemoveAllWidgets()
    composer.removeScene("kit1")
    composer.gotoScene("oassets")   
end




local locd = function( event )
	if event.errorCode then
		--print( "Location error: " .. tostring( event.errorMessage ) )
	else
	
		local latitudeText = string.format( '%.4f', event.latitude )
		currentLatitude = latitudeText
		 evx=event.latitude
		local longitudeText = string.format( '%.4f', event.longitude )
		currentLongitude = longitudeText
		 evy=event.longitude 
        end

end

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("oassets")
        composer.purgeScene("oassets")

end

function scene:show( event )
	local group = self.view
	native.setActivityIndicator( false )
        oname="Name"
        oversion="Version"
        oupdate="Update"
        oregistered="Registered"
        odbversion= "DB_Version"
        oname="Office"
        oversion="Address"
        oupdate="x"
        oregistered="Y"
        odbversion ="Contact"
        _G.GUI = require("widget_candy")
        evy=event.longitude 

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
		caption         = "Office Details",
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
                onClose         = function(EventData) _G.UnloadSample() end,
		} )

        _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "5%",
		parentGroup     = "Owner1",
		width           = "96%",
		scale           = _G.GUIScalec,
		theme           = "theme_4",
		name            = "INP_SAMPLE",
                fontSize        = fonts,
                height          = "64", 
                quitCaption      ="Tap screen to finish text input.",
		caption         = "Name",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		disableInput    = true,
                onFocus         = function(EventData) 
                                        -- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
                                        if EventData.value == "Name" then _G.GUI.Set("INP_SAMPLE", {caption = ""} ) end
                                        end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "INP_SAMPLE",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                                onBlur          = function(EventData) oname=EventData.value end,
                             --   onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
                } )
                

_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "30%",
		parentGroup     = "Owner1",
		width           = "96%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "update",
                fontSize        = fonts,
		caption         = "Address",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Address" then _G.GUI.Set("update", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "update",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) oupdate=EventData.value end,
                } )
_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "45%",
		parentGroup     = "Owner1",
		width           = "96%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "version",
                fontSize        = fonts,
		caption         = "Y",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Y" then 
                                                            _G.GUI.Set("version", {caption = evy} ) 
                                                            _G.GUI.Set("fontSize", {fontSize = fonts} )   
                                                        end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "version",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) 
                                            oversion=EventData.value
                                            ove=EventData.value
                                    end,
                } )

_G.GUI.NewInput(
		{
		x               = "2%",
		y               = "60%",
		parentGroup     = "Owner1",
		width           = "96%",
		scale           = _G.GUIScalec,
                height          = 130,
		theme           = "theme_1",
		name            = "register",
                fontSize        = fonts,
		caption         = "X",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "X" then 
                                                            _G.GUI.Set("register", {caption = evx} ) 
                                                            _G.GUI.Set("fontSize", {fontSize = fonts} )   
                                                        end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "register",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) oregistered=EventData.value end,
                } )
                
            
 
 _G.GUI.NewInput(
		{
		x               = "2%",
		y               = "75%",
		parentGroup     = "Owner1",
		width           = "96%",
		scale           = _G.GUIScalec,
		theme           = "theme_1",
		name            = "dbversion",
                fontSize        = fonts,
		caption         = "Contact",
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Contact" then _G.GUI.Set("dbversion", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "dbversion",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) odbversion=EventData.value end,
                } )	


_G.GUI.NewButton(
		{
		x               = "left",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScaled,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Save.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
		onRelease       = function(EventData) 
                                                        dbsavedb()
                                    end,
		} )
_G.GUI.NewButton(
		{
		x               = "right",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScaled,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Cancel.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Cancel")  end,
		onRelease       = function(EventData) 
                                        oncomplete()
                                    end,
		} )
                
_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "80%",                
		width           = "50%",                   
		scale           = _G.GUIScaled,
		name            = "BUT_3", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Map", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Cancel")  end,
		onRelease       = function(EventData) 
                                        map()
                                    end,
		} )                

end
function scene:exit( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
        composer.removeScene("kit1")
        composer.purgeScene("kit1")
        _G.GUI.GetHandle("LST_MAIN"):destroy() 
        _G.GUI.GetHandle("owner1"):destroy()
	_G.GUI.GetHandle("TXT_1"):destroy() 
        _G.GUI.GetHandle("LST_MAIN"):destroy() 
        _G.GUI.GetHandle("LST_MAINo"):destroy() 
        _G.GUI.GetHandle("Owner1"):destroy()
        _G.GUI.GetHandle("office"):destroy()
         _G.GUI.GetHandle("Asset"):destroy()
         _G.GUI.GetHandle("item"):destroy()
         _G.GUI.GetHandle("Manufactor"):destroy()
          _G.GUI.GetHandle("Serial"):destroy()
          _G.GUI.GetHandle("MAC"):destroy()
          _G.GUI.GetHandle("IP"):destroy()
          _G.GUI.GetHandle("Comments"):destroy()
          _G.GUI.GetHandle("BUT_1"):destroy()
          _G.GUI.GetHandle("BUT_2"):destroy()
          _G.GUI.GetHandle("LST_MAIN"):destroy()
         
end

function scene:destroy( event )
	
end

Runtime:addEventListener( "location", locd )
scene:addEventListener( "create",scene )

--Runtime:addEventListener( "location", locationHandler )
--scene:addEventListener( "locd", scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene





