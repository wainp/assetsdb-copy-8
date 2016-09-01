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
local r1, r2, r3,r4, r5, r6, securityr6, secr6, secr6n, securityur6

--local securityr6



 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("owner")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("configg")      
        
        
end
   
 local function secno( event )  
     if oreg==securityur6 then  
            oregistered="Not Registered"
    end  
  --    if securityr6==oreg then  
  --         oregistered="Registered" 
  --  end
     
    oncomplete() 
 end
      
   
   
 local function dbsavedb( event )
     
     local path = system.pathForFile("configs.db", system.DocumentsDirectory)
db = sqlite3.open( path ) 
     local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        db:exec( tablefill )
    db:close()
--local path = system.pathForFile("config.db", system.DocumentsDirectory)
--mcst = sqlite3.open( path ) 
--local tablesetup = [[CREATE TABLE IF NOT EXISTS owner (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
--print(tablesetup)
--mcst:exec( tablesetup )
secno()
end

function scene:create( event )
	local group = self.view
 --       _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
securityr6=0
r1=(math.random(9))
r2=(math.random(9))
r3=(math.random(9))
r4=(math.random(9))

r5=(r1..r2..r3..r4)
securityr6=(((r1*r2)-r4)+r3)
securityur6=(((r1*r2)-r4)+r3+10)
end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 --display.setStatusBar(display.HiddenStatusBar)
 --local titleText = display.newText( "Owner Details", halfW, titleBar.y, native.systemFontBold, 22 )
 
 --local path = system.pathForFile("config.db", system.DocumentsDirectory)
--mcst = sqlite3.open( path ) 
--local tablesetup = [[CREATE TABLE IF NOT EXISTS owner (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]2
--print(tablesetup)
--mcst:exec( tablesetup )

 local path = system.pathForFile("configs.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM owner"
    oname="Name"
    oversion="Version"
    oupdate="Update"
   oregistered="Not Registered"
   odbversion="URL:"
   oreg=0
    print(securityr6)
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        oname=row.oname
        oversion=row.oversion
        oupdate=row.oupdate
        oregistered=row.oregistered
        odbversion=row.odbversion
        oreg=row.oregno
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
 
 
 
 
 
 	--local group = self.view
        
--        local statusText = display.newText( "Name", 120, 90, 200, 0, native.systemFont, 22 )     
--        oname = native.newTextField( 250, 90, 156, 12 )
--        oname:addEventListener( "userInput", onamel )
--        oname:setTextColor(0, 0, 0)
_G.GUI = require("widget_candy")
print(securityr6)
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
		caption         = "Owner Details",
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
                
_G.GUI.NewLabel(
		{
		x               = "15%",                
		y               = "20%", 
		width           = "80%",
		scale           = _G.GUIScale,
		name            = "SLBL",            
		parentGroup     = nil,            
		fontSize       =fonts,         
		theme           = "theme_1", 
		icon            = 14,
		caption         = "Type in your registration code",
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )       
                
                
                
                
print(securityr6)
      _G.GUI.NewInput(
		{
		x               = "center",
		y               = "center",
		parentGroup     = nil,
		width           = "30%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "INP_SAMPLE",
		fontSize       =fonts,    
		caption         = "Type in registration number",
		notEmpty        = true,
		textColor       = {.07,.14,.07},
		isSecure        = true, -- TRUE: SHOW AS PASSWORD (MASKED)
                disableInput    = true,
		inputType       = "number", -- "number" | "phone" | "default" | "url" | "email"
		allowedChars    = "1234567890",
		quitCaption     = "Tap screen to finish text input.",
		onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							--if EventData.value == V.defaultCaption then _G.GUI.Set("INP_SAMPLE", {caption = ""} ) end
						  end,
                onPress         = function(EventData)  
        				_G.GUI.Keyboard_Show(
						{
						height   = "40%",
						target   = "INP_SAMPLE",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
			layout   =
		{
		-- KEY PAGE 1: EMAIL-SAFE CHARS
		page1 =
			{
			allowCase = false,
			{ {"1"}, {"2"}, {"3"}, {"0"},  },
			{ {"4"}, {"5"}, {"6"}, {"@"}, },
			{ {"7"}, {"8"}, {"9"}, {".","_","-"} },
			{ {"PAGE1"}, {"SPACE"}, {"DEL"}, {"OK"}, {"CLEAR"} },
			},
		},
				} )
			end,                                  
                
		onChange        = function(EventData) oreg=EventData.value end,
		onBlur          = function(EventData) oreg=EventData.value
                                                         secr6= tonumber( securityr6 )
                                                         if sec6=="8888" then fonts=(fonts+25) end
                                                         if sec6=="6666" then fonts=(fonts-10) end	
                                                         secr6nx= tonumber( oreg )
                                                             if securityr6==secr6nx then
                                                                    oregistered="Registered" 
                                                                    local alert = native.showAlert( "Not Registered", " This feature only available on registered version", { "OK" } )
                                                              end
                                                           -- secr6n=secr6+10  
                                                         if (securityur6==secr6nx) then
                                                            oregistered="Not Registered" 
                                                            local alert = native.showAlert( "Not Registered", " This feature only available on registered version", { "OK" } )
                                                         else
                                                            oregistered="Registered"  
                                                         end
                                                        end,
		} )
                
                
_G.GUI.NewLabel(
		{
		x               = "25%",                
		y               = "70%", 
		width           = "50%",
		scale           = _G.GUIScale,
		name            = "LBL_2",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		icon            = 14,
		caption         = oregistered,
		fontSize       =fonts,    
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} )                
	-- CREATE A TEXT

_G.GUI.NewLabel(
		{
		x               = "40%",                
		y               = "32%", 
		width           = "30%",
		scale           = _G.GUIScale,
		name            = "LBL_3",            
		parentGroup     = nil,                     
		theme           = "theme_1", 
		fontSize       =fonts,    
		icon            = 26,
		caption         = r5,
		textAlign       = "center",
		textColor       = {1,1,1},
		border          = {"normal",4,1, 0,0,0,.19, 1,1,1,.78},
		} ) 


_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScale,
		name            = "BUT_2", 
		parentGroup     = nil,                     
		theme           = _G.theme,   
		fontSize       =fonts,                
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


