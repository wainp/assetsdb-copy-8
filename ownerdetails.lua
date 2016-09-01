

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

local function onComplete( event )
--	print( "index => ".. event.index .. "    action => " .. event.action )

	local action = event.action
	if "clicked" == event.action then
		if 1 == event.index then
                    --local path = system.pathForFile("mcst.db", system.DocumentsDirectory)
--mcst = sqlite3.open( path ) 
local tablesetup = [[CREATE TABLE IF NOT EXISTS configapp (id INTEGER PRIMARY KEY autoincrement, username, version, update,register, dbversion);]]
print(tablesetup)
mcst:exec( tablesetup )

--local name = "Peter"
--local version = "1.0"
--local update = "24/12/2013"
--local register = "No"
--local dbversion = "1.0.0"
vedate="12/24/2013"
           wtb="wtb"                -- local alert = native.showAlert( "testvalue[1]", name, { "Yes", "No" }, onComplete )
			local tablefill =[[INSERT INTO configapp VALUES (NULL, ']]..username..[[',']]..version..[[',']]..vedate..[[',']]..dbregister..[[',']]..dbversion..[['); ]]
                        mcst:exec( tablefill )
		end
	elseif "cancelled" == event.action then
		-- our cancelAlert timer function dismissed the alert so do nothing
         -- local alert = native.showAlert( "testvalue[1]", namejsa, { "Yes", "No" }, onComplete )

        end
       
 
end
local function idjsal( event )
    if event.phase == "began" then

        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

      -- username=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end

local function namejsal( event )
    if event.phase == "began" then
--local alert = native.showAlert( "username", "namejsa", { "Yes", "No" }, onComplete )
        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

     oname=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end

local function wcjsal( event )
    if event.phase == "began" then
--local alert = native.showAlert( "version", "wcjsa", { "Yes", "No" }, onComplete )
        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

       version=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end

local function workjsal( event )
    if event.phase == "began" then
 --local alert = native.showAlert( "update", "workjsa", { "Yes", "No" }, onComplete )

        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

   --vedate=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end
local function startjsal( event )
    if event.phase == "began" then
--local alert = native.showAlert( "update", "startjsa", { "Yes", "No" }, onComplete )
        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

   update=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end
			
local function stopjsal( event )
    if event.phase == "began" then
--local alert = native.showAlert( "dbregister", "stopjsa", { "Yes", "No" }, onComplete )
        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

    dbregister=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end
local function orijsal( event )
    if event.phase == "began" then
--local alert = native.showAlert( "dbversion", "orijsa", { "Yes", "No" }, onComplete )
        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

    dbversion=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end

local function locjsal( event )
    if event.phase == "began" then
--local alert = native.showAlert( "dbversion3", "locjsa", { "Yes", "No" }, onComplete )
        -- user begins editing textField
        print( event.text )

    elseif event.phase == "ended" then

    dbversion=event.target.text

    elseif event.phase == "ended" or event.phase == "submitted" then

        -- do something with defaulField's text

    elseif event.phase == "editing" then

        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )

    end
end



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

function scene:createScene( event )
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


function scene:enterScene( event )
	local group = self.view
        local statusBox = display.newGroup()
        
        local statusBox = display.newRect( -100,45, 480, 460 )
	statusBox.anchorX = 0
	statusBox.anchorY = 0
	statusBox:setFillColor( 0, 255, 0 )
	statusBox.alpha = 0.9
    group:insert( statusBox ) 
    

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
 local myText = display.newText( "Name", 100, 90, native.systemFont, 12 )
myText:setFillColor( 1, 0, 0 )
  local myText = display.newText( "Version", 100, 120, native.systemFont, 12 )
 
 local statusText = display.newText( "Name", 16, 90, 200, 0, native.systemFont, 18 )
             group:insert( statusText )   
 
--local titleText = display.newText( "Eltham", halfW, titleBar.y, native.systemFontBold, 22 )
    idjsa = native.newTextField( 180, 60, 36, 20 )
idjsa:addEventListener( "userInput", idjsal )
namejsa = native.newTextField( 240, 90, 156, 12 )
namejsa:addEventListener( "userInput", namejsal )
 namejsa:setTextColor(0, 0, 0)
wcjsa = native.newTextField( 240, 120, 156, 12 )
wcjsa:addEventListener( "userInput", wcjsal )
startjsa = native.newTextField( 240, 150, 156, 20 )
startjsa:addEventListener( "userInput", startjsal )
stopjsa = native.newTextField( 240, 180, 156, 20 )
stopjsa:addEventListener( "userInput", stopjsal )
orijsa = native.newTextField( 240, 210, 156, 20 )
orijsa:addEventListener( "userInput", orijsal )
locationjsa = native.newTextField( 240, 240, 156, 20 )
locationjsa:addEventListener( "userInput", locjsal )
 local statusText = display.newText( "ID (Auto)", 116 , 60, 200, 0, native.systemFont, 18 )
             group:insert( statusText )      
  local statusText = display.newText( "Name", 16, 90, 200, 0, native.systemFont, 18 )
             group:insert( statusText )      
 local statusText = display.newText( "Version", 116, 120, 200, 0, native.systemFont, 18 )
             group:insert( statusText )      
local statusText = display.newText( "update", 116, 150, 200, 0, native.systemFont, 18 )
             group:insert( statusText )      
 local statusText = display.newText( "register", 116, 180, 200, 0, native.systemFont, 18 )
             group:insert( statusText )    
local statusText = display.newText( "dbversion", 116, 210, 200, 0, native.systemFont, 18 )
             group:insert( statusText )    
             
             
 _G.GUI.NewButton(
		{
		x               = "center",                
		y               = "10%",                
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
                                                        composer.gotoScene("configg")
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
function scene:exitScene( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
       --   composer.removeScene("intro")
        --composer.purgeScene("intro")
        group:remove(statusText)
     --  group:remove(textBox)
     -- textBox=nil 
        composer.removeScene( "owner" )
                statusText:removeSelf()
        idjsa:removeSelf()
        namejsa:removeSelf()
        wcjsa:removeSelf()
        startjsa:removeSelf()
        stopjsa:removeSelf()
        orijsa:removeSelf()
        locationjsa:removeSelf()
end

function scene:destroyScene( event )
	
end

scene:addEventListener( "createScene" )
scene:addEventListener( "exitScene" )
scene:addEventListener( "enterScene" )
scene:addEventListener( "destroyScene" )
--scene:addEventListener( "create",scene )
--scene:addEventListener( "exit",scene )
--scene:addEventListener( "show",scene )
--scene:addEventListener( "destroy",scene )

return scene


