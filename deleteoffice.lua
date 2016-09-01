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


      
   local function deletedb()
       

        local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    local stmt = sqlite3.open( path ) 
     stmt = db:prepare[[DELETE FROM office WHERE office = ?]];
    stmt:bind_values(seloffice)
    stmt:step();
      composer.gotoScene("oassets")
   end
   
 local function onComplete( event )
   if event.action == "clicked" then
        local i = event.index
        if i == 1 then
            deletedb()
        elseif i == 2 then
            composer.gotoScene("oassets")
        end
    end
end  
   
   
 local function qyn( event )
   
 
local alert = native.showAlert( seloffice, "Are you sure you ant to delete his office record ?", { "Yes", "No" }, onComplete )
		
        
--_G.GUI.Confirm(
--		{
--		name       = "WIN_ALERT1",
--		modal      = true,
--		theme      = _G.theme, 
--		width      = "65%",
--		height     = "auto",
--		scale      = _G.GUIScale,
--		icon       = 14,
--		fadeInTime = 500,
--		title      = seloffice,
--		caption    = "Would you like to delete office details", 
--		onPress    = function(EventData) print("Button pressed: "..EventData.button) end,
--		onRelease  = function(EventData) if EventData.button == 1 then deletedb() end end,
--		buttons    = 
--			{
--				{icon = 15, caption = "Yes",},
--				{icon = 16, caption = "No" ,},
--			},
--		} )


end


function scene:show( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
 display.setStatusBar(display.HiddenStatusBar)
-- local titleText = display.newText( "Delete Office Details - deleteitem", halfW, titleBar.y, native.systemFontBold, 22 )
 
 --dbsavedb()
 
 
 
 

      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   local sql = "SELECT * FROM office "
     for row in db:nrows(sql) do
        if seloffice==row.office then
            --dbsavedb()
                qyn()
            
           end
 
 end


end
function scene:exit( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
      
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene











