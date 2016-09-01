-- Dstockall
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
local coname, coversion, coupdate, coregistered, codbversion, ownerdb
local oname, oversion, odbversion, oitem, oasset, oserial, oip, ocomment, i
local currentLatitude = 0
local currentLongitude = 0
local selpic = {}
local latitude 
local longitude 
local oupdate 
local oregistered 
local emaildata, emaildata1, emaildata2, idn, itemn, maken, modaln
display.setDefault( "anchorX", 0.0 )







local function pvemail( event )

	-- compose an HTML email with two attachments
	local options =
	{
	   to = { oversion },
	   --cc = {  },
	   subject = "PVDB - Stock list",
	   isBodyHtml = true,
	   body = emaildata,
	   attachment =
	   {
              -- #photoAttachmentTable, 
                  { baseDir=system.DocumentsDirectory, filename="assets.db"},
         
           },
          -- local path = system.pathForFile("assets.db", system.DocumentsDirectory)
	}
	local result = native.showPopup("mail", options)
	
	if not result then
		print( "Mail Not supported/setup on this device" )
		native.showAlert( "Alert!",
		"Mail not supported/setup on this device.", { "OK" }
	);
	end
	-- NOTE: options table (and all child properties) are optional
        options=nil
	composer.gotoScene("oassets")
end

local function map( event )
mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. currentLatitude .. "," .. currentLongitude

--mapURL = "http://maps.google.com/maps?q=Hello,+Corona!@" .. oupdate .. "," .. oregistered
	system.openURL( mapURL )

end

 local function oncomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("kit1")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("options")      
        
        
end
   
 local function onassetcomplete( event )
     _G.GUI.RemoveAllWidgets()
       composer.removeScene("officedetails")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("assets")      
        
        
end
      
   
   
 local function dbsavedb( event )

-- local alert = native.showAlert( oname, "Do you wish to save data ?", { "Yes","N0"} )
_G.GUI.RemoveAllWidgets()
       composer.removeScene("kit1")
        --composer.purgeScene("intro")
        --_G.GUI.GetHandle("owner1"):destroy()
    composer.gotoScene("options")   
    --composer.gotoScene("Intro")
end

function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
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
--local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
--titleBar:setFillColor( titleGradient ) 
--titleBar.y = titleBar.contentHeight * 0.5
--_G.GUI.UnloadThemes("theme_4")
 --_G.GUI.RemoveAllWidgets()
 --display.setStatusBar(display.HiddenStatusBar)
 --local titleText = display.newText( "dOfficedetails", halfW, titleBar.y, native.systemFontBold, 22 )
 
 
 

      local path = system.pathForFile("assets.db", system.DocumentsDirectory)
    db = sqlite3.open( path ) 
    --print all the table content
    emaildata=""
   -- local sql = "SELECT * FROM item"  --where Office = Seloffice "
   for row in db:nrows("SELECT * FROM item") do
             idn=row.id
            itemn=row.item
            maken=row.make
            modaln=row.modal
            emaildata=(emaildata..idn.."    "..itemn.."    "..maken.."    "..modaln.."<br/>")
        end
            
       
 
   
 
  
 
         pvemail()
 
 
 
 
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













