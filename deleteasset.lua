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
local item, make, modal, oitem, omake, omodal, items, offname


      
   local function deletedb()
       
      
     -- items=(offname.."  "..item)
        local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    local stmt = sqlite3.open( path ) 
     stmt = db:prepare[[DELETE FROM assets WHERE id = ?]];
   --  stmt = db:prepare[[DELETE FROM office WHERE office = ?]];
    stmt:bind_values(idn)
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
   
   
 local function qyn ( event )
local alert = native.showAlert( seloffice, "Are you sure you ant to delete his office record ?", { "Yes", "No" }, onComplete )
end


function scene:show( event )
	local group = self.view
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
 --display.setStatusBar(display.HiddenStatusBar)
-- local titleText = display.newText( "Delete Office Details - deleteitem", halfW, titleBar.y, native.systemFontBold, 22 )
 
 --dbsavedb()
 
 
 
 

      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
   --local sql = "SELECT * FROM assets "
   --  for row in db:nrows(sql) do
   --     if seloffice==(row.office.."  "..row.manufactor) then
            --dbsavedb()
                qyn()
            
     --      end
 
 --end


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











