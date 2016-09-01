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
local oname, oversion, odbversion, oitem, oasset, oserial, oip, ocomment
local currentLatitude = 0
local currentLongitude = 0
local latitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local longitude = display.newText( "--", 0, 0, native.systemFont, 26 )
local oupdate = display.newText( "--", 0, 0, native.systemFont, 26 )
local oregistered = display.newText( "--", 0, 0, native.systemFont, 26 )
local emaildata, emaildata1, emaildata2
display.setDefault( "anchorX", 0.0 )



local function pvemail( event )

	local options =
	{
	   to = { "pwain@parks.vic.gov.au" },
	   --cc = {  },
	   subject = "PVDB - Database ",
	   isBodyHtml = true,
	   body = "Attached is the MYSQL database",
	   attachment =
	   {
		  { baseDir=system.DocumentsDirectory, filename="assets.db"},
                  { baseDir=system.DocumentsDirectory, filename="Pictures.db"},
	   },
	}
	local result = native.showPopup("mail", options)
	
	if not result then
		print( "Mail Not supported/setup on this device" )
		native.showAlert( "Alert!",
		"Mail not supported/setup on this device.", { "OK" }
	);
	end
	composer.gotoScene("configg")
end


      
function scene:create( event )
	local group = self.view
        _G.GUI.RemoveAllWidgets()
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5

end


function scene:show( event )
	local group = self.view
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
 display.setStatusBar(display.HiddenStatusBar)
 local titleText = display.newText( "dbpost", halfW, titleBar.y, native.systemFontBold, 22 )
 
  pvemail()

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


















