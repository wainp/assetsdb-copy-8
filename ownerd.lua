require "sqlite3"
local widget = require( "widget" )
_G.GUI = require("widget_candy")
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local coname, coversion, coupdate, coregistered, codbversion
local oname, oversion, oupdate, oregistered, odbversion
 local function pvonSendSMS( event )
	
end
   
local function onamel( event )
    if event.phase == "began" then

        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

     name=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end   
   
   
   
   
   
   
   
   
   
   
   
   
   
 local function dbsavedb( event )
local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS owner (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )
oname="name"
--           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                       -- local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        mcst:exec( tablefill )
     
     
     
     
     
     
     
  --      local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
 --   db = sqlite3.open( path ) 
 --   testvalue = 'Hello'
--local tablefill =[[INSERT INTO owner VALUES (NULL, 'John Doe','This is an unknown person.'; ]]

--local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[['); ]]
--db:exec( tablefill )
    
    
    
    
    db:close()
 local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
   -- composer.gotoScene("Intro")    
end

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
-- _G.GUI.RemoveAllWidgets()
 
 
 --composer:removeScene("scene3")
--local titleText = display.newText( "Parks SMS", halfW, titleBar.y, native.systemFontBold, 22 )
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )

end


function scene:show( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 _G.GUI.RemoveAllWidgets()
 display.setStatusBar(display.HiddenStatusBar)
 local titleText = display.newText( "MCST - Owner Details", halfW, titleBar.y, native.systemFontBold, 22 )
 
 local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS owner (id INTEGER PRIMARY KEY autoincrement, name, version, update,registered, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )
--oname="Name"
--oversion="Version"
--oupdate="Update"
--oregistered="Registered"
--odbversion="DB_Version"
--           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			--local tablefill =[[INSERT INTO owner VALUES (NULL, ']]..oname..[[',']]..oversion..[[',']]..oupdate..[[',']]..oregistered..[[',']]..odbversion..[['); ]]
                        local tablefill =[[INSERT INTO owner VALUES (NULL, "oname"'"oversion"'"oupdate"'"oregistered"'"odbversion)"; ]]
                        mcst:exec( tablefill )
 
      local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table contents
    local sql = "SELECT * FROM owner"
    --row.oname="Name"
    --row.oversion="Version"
    --row.oupdate="Update"
    --row.oregistered="Registered"
    --row.odbversion="DB_Version"
    for row in db:nrows(sql) do
        local text = row.oname.." "..row.oversion
        coname=row.oname
        coversion=row.oversion
        coupdate=row.oupdate
        coregistered=row.oregistered
        codbversion=row.odbversion
        
       -- local t = display.newText( text, 120, 30 * row.id, native.systemFont, 24 )
       -- t:setTextColor( 255,255,255 )
       end
 
 
 
 
 
 	--local group = self.view
        
--        local statusText = display.newText( "Name", 120, 90, 200, 0, native.systemFont, 22 )     
--        oname = native.newTextField( 250, 90, 156, 12 )
--        oname:addEventListener( "userInput", onamel )
--        oname:setTextColor(0, 0, 0)
        
     _G.GUI.NewInput(
		{
		x               = "center",
		y               = "center",
		parentGroup     = nil,
		width           = "70%",
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "INP_SAMPLE",
		caption         = "Name",
		--notEmpty        = true,
		--textColor       = {.07,.14,.07},
		--isSecure        = false, -- TRUE: SHOW AS PASSWORD (MASKED)
		--inputType       = "default", -- "number" | "phone" | "default" | "url" | "email"
		--allowedChars    = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -'.",
		--quitCaption     = "Tap screen to finish text input.",
		onFocus         = function(EventData) 
							-- CLEAR TEXT WHEN TEXT FIELD IS FOCUSED FIRST TIME:
							if EventData.value == "Name" then _G.GUI.Set("INP_SAMPLE", {caption = ""} ) end
						  end,
		--onChange        = function(EventData)oname=EventData.value end,
		--onBlur          = function(EventData) print("FINISHED TEXT INPUT: "..EventData.value) end,
		} )   
 
 
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )
_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "75%",                
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
		onPress         = function(EventData) EventData.Widget:set("caption", oname)  end,
		onRelease       = function(EventData) 
                                                        
							-- RELEASED WHILE INSIDE BUTTON?
							if EventData.inside then EventData.Widget:set("caption", oname) 
						  	-- RELEASED WHILE OUTSIDE BUTTON?
						  	                    else EventData.Widget:set("caption", "Saved") end
						  end,
		} )

_G.GUI.NewIconBar(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "90%",
		height          = 50,
		scale           = _G.GUIScale,
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
				{icon = 11 , flipX = false, text = "Deploy"},
				{icon = 17, flipX = false, text = "Cache"},
                                {icon = 18, flipX = false, text = "Config"},
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                print(selectd)
                                if selectd==4 then dbsavedb() end--composer.gotoScene("configg")end
                                if selectd==3 then composer.gotoScene("options")end
                                if selectd==2 then composer.gotoScene("deploy")end
                                if selectd==1 then composer.gotoScene("Intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(4)
        






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


