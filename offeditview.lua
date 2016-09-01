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
local  oversion, oupdate, oregistered, odbversion, ocontact
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
_G.GUI = require("widget_candy")
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl, q
local coname, coversion, coupdate, coregistered, codbversion
local oname, oversion, odbversion, oid
local currentLatitude = 0
local currentLongitude = 0
local latitude 
local longitude 
local oupdate 
local oregistered 
display.setDefault( "anchorX", 0.0 )


local function map( event )
mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. currentLatitude .. "," .. currentLongitude

--mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. oupdate .. "," .. oregistered
	system.openURL( mapURL )

end

 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")      
        
        
end
   
 local function onassetcomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")      
        
        
end
      
   
   
 local function dbsavedb( event )
--local path = system.pathForFile("assets.db", system.DocumentsDirectory)
--mcst = sqlite3.open( path ) 
--local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, office, address, x,y, contact);]]
--print(tablesetup)
--mcst:exec( tablesetup )
--print(oname)
--print(oid)
----------------------------------

print(oname)
local path = system.pathForFile("assets.db", system.DocumentsDirectory)
db = sqlite3.open( path ) 
--local q =[[UPDATE office SET office ="Home" WHERE id=1;]]
--  q = [[UPDATE office SET office="Home" WHERE id=1;]]
 q = [[UPDATE office SET office=']] .. oname .. [[' WHERE id=]] .. oid .. [[;]]
 db:exec( q )
 q = [[UPDATE office SET address=']] .. oversion .. [[' WHERE id=]] .. oid .. [[;]]
 db:exec( q )
 q = [[UPDATE office SET x=']] .. oupdate .. [[' WHERE id=]] .. oid .. [[;]]
 db:exec( q )
 q = [[UPDATE office SET y=']] .. currentLongitude .. [[' WHERE id=]] .. oid .. [[;]]
 db:exec( q )
 q = [[UPDATE office SET contact=']] .. ocontact .. [[' WHERE id=]] .. oid .. [[;]]
db:exec( q )






--db:exec( q )
 -- local q = [[UPDATE office SET office=oname WHERE id=oid;]]
 --   print (q)
 --   print(oname)
 --   print(oid)
 --   db:exec(q)
    db:close()









                      --   local q = [[UPDATE office SET oname=oname WHERE id=oid;]]
                        --    db:exec( q )  
                        --local tablefill =[[INSERT INTO office VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        --mcst:exec( tablefill )
    --db:close()
-- local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
_G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("oassets")   
    --composer.gotoScene("Intro")
end

function scene:create( event )
	local group = self.view
     --   _G.GUI.RemoveAllWidgets()
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
-- _G.GUI.RemoveAllWidgets()
 oname=""
 
 --composer:removeScene("scene3")
--local titleText = display.newText( "Parks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
--s display.setStatusBar(display.HiddenStatusBar)
 --local titleText = display.newText( "Office details", halfW, titleBar.y, native.systemFontBold, 22 )
 
 local path = system.pathForFile("asset.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS office (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )
--oname="Name"
--oversion="Version"
--oupdate="Update"
--oregistered="Registered"
--odbversion="DB_Version"
--           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			--local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
--                        local tablefill =[[INSERT INTO office VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
--                        mcst:exec( tablefill )
 
      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM office"  --where Office = Seloffice "
    oname="Office"
    oversion="Address"
    oupdate="x"
   oregistered="Y"
    odbversion="Contact"
    
    for row in db:nrows(sql) do
        --local text = row.oname.." "..row.oversion
        if seloffice==row.office then 
             oid=row.id
             oname=row.office
            oversion=row.address
            currentLatitude=row.x
            currentLongitude=row.y
            oid=row.id
            ocontact=row.contact
          --  local latitudeText = string.format( '%.4f', row.x )
	--	currentLatitude = latitudeText
	--	latitude.text = latitudeText
		
	--	local longitudeText = string.format( '%.4f', row.y )
	--	currentLongitude = longitudeText
	--	longitude.text = longitudeText
                
           -- longitudeText=row.x
		
           --latitude=row.x
          --  oregistered=row.y
           -- latitudeText=row.x
           --longitude=row.y
            --odbversion=row.contact
        end
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
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
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "Asset",
                fontSize        = "30",
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
							if EventData.value == oname then _G.GUI.Set(oname, {caption = "as"} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "50%",
						target   = "Asset",
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
		y               = "72%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "update",
                fontSize        = "30",
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
		y               = "32%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "X",
                fontSize        = "30",
		caption         = currentLatitude,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "X" then _G.GUI.Set("X", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "X",
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
		y               = "52%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "y",
                fontSize        = "30",
		caption         = currentLongitude,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "X" then _G.GUI.Set("y", {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "X",
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
		y               = "16%",
		parentGroup     = "Owner1",
		width           = "90%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "contact",
                fontSize        = "30",
		caption         = ocontact,
		textColor       = {.07,.14,.07},
		notEmpty        = false,
		isSecure        = false,
		-- DO NOT USE NATIVE KEYBOARD:
		disableInput    = true,
                onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == contact then _G.GUI.Set(contact, {caption = ""} ) end
						  end,
		-- PRESSED: SHOW WIDGET CANDY KEYBOARD
		onPress         = function(EventData)  
					_G.GUI.Keyboard_Show(
						{
						height   = "30%",
						target   = "contact",
						align    = "bottom",
						onType   = function(EventData) print("TYPE: "..EventData.char) end,
						onOK     = function(EventData) print("OK!") end,	
						} )
				end,
                onBlur          = function(EventData) oupdate=EventData.value end,
                } )


_G.GUI.NewButton(
		{
		x               = "right",                
		y               = "90%",                
		width           = "50%",                   
		scale           = _G.GUIScaled,
		name            = "BUT_2", 
		parentGroup     = owner1,                     
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
		scale           = _G.GUIScaled,
		name            = "BUT_1", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Close.", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		--onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
		onRelease       = function(EventData) 
                                                        oncomplete()
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









