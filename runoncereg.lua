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
local oname, oversion, oupdate, oregistered, odbversion, oreg




 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("owner")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("intro")      
        
        
end
   

      
   
   
 local function dbsavedb( event )
 	dispname=oname
     local path = system.pathForFile("assets.db", system.DocumentsDirectory)
db = sqlite3.open( path ) 
     local tablefillo =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]   -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
      db:exec( tablefillo )
    db:close()
	oncomplete()
end

function scene:create( event )
	local group = self.view
 --       _G.GUI.RemoveAllWidgets()
--	local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--	titleBar:setFillColor( titleGradient ) 
--	titleBar.y = titleBar.contentHeight * 0.5
end


function scene:show( event )
	local group = self.view
--	local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--	titleBar:setFillColor( titleGradient ) 
--	titleBar.y = titleBar.contentHeight * 0.5
--	display.setStatusBar(display.HiddenStatusBar)
 --	local titleText = display.newText( "Owner Details", halfW, titleBar.y, native.systemFontBold, 22 )
  _G.GUI.RemoveAllWidgets()
 oname="Company Name"
 	local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM owner"
    oname="unregname"
    oversion="Email"
    oupdate="Version"
   oregistered="Not Registered"
   odbversion="URL:"
   
    
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        oname=row.oname
        oversion=row.oversion
        oupdate=row.oupdate
        oregistered=row.oregistered
        odbversion=row.odbversion
       
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
	_G.GUI = require("widget_candy")
        print(oname)
        if oname=="unregname" then
            
        

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
		caption         = "Fill out details below",
		textAlign       = "center",
		icon            = 19,
		fadeInTime      = 500,
                modal           = "False",
		margin          = 20,
		noTitle         = false,
		shadow          = true,
		closeButton     = false,
		dragX           = false,
		dragY           = false,
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
		x               = "5%",
		y               = "5%",
		parentGroup     = "Owner1",
                fontSize        = fonts,
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "INP_SAMPLE",
                fontSize        = fonts,
                quitCaption      ="Tap screen to finish text input.",
		caption         = oname,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
               -- onBlur          =  if EventData.value == "Name" then "oname"=EventData.value end,
	--					  end,
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
		x               = "5%",
		y               = "20%",
		parentGroup     = "Owner1",
                fontSize          = fonts,
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "update",
                fontSize        = fonts,
                inputType       = "email", -- "number" | "phone" | "default" | "url" | "email"
		caption         = oupdate,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Update" then _G.GUI.Set("update", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
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
		x               = "5%",
		y               = "35%",
		parentGroup     = "Owner1",
		width           = "90%",
                fontSize          = fonts,
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "version",
                fontSize        = fonts,
		caption         = oversion,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Update" then _G.GUI.Set("update", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "version",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) oversion=EventData.value end,
                } )
                
                
_G.GUI.NewLabel(
		{
		x               = "5%",                
		y               = "65%", 
		width           = "90%",
		scale           = _G.GUIScale,
		name            = "LBL_1",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = oregistered,
		textAlign       = "center",
		textColor       = {1,1,1},
                 modal           = "False",
		margin          = 20,
		noTitle         = false,
		shadow          = true,
		closeButton     = false,
		dragX           = false,
		dragY           = false,
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )                
	-- CREATE A TEXT

 
 _G.GUI.NewInput(
		{
		x               = "5%",
		y               = "50%",
		parentGroup     = "Owner1",
		width           = "90%",
                fontSize          = fonts,
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "dbversion",
                FontSize        = fonts,
                inputType       = "url", -- "number" | "phone" | "default" | "url" | "email"
		caption         = odbversion,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Database Version" then _G.GUI.Set("dbversion", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "40%",
						target   = "dbversion",
						align    = "top",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) odbversion=EventData.value end,
                } )	
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )



_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Close.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Cancel")  end,
		onRelease       = function(EventData) 
                                                       dbsavedb()
							-- RELEASED WHILE INSIDE BUTTON?
							--if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	  --                  else EventData.Widget:set("caption", "Saved") end
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

composer.gotoScene("Intro")


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


