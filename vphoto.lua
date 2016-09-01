
require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth/3
local _H = display.contentHeight/3
local evd, pfile, ocomments, odates, picsave
local bkgd, text, alocat


local function onComplete( event )
if media.hasSource( media.PhotoLibrary ) then
   media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )
else
   native.showAlert( "Corona", "This device does not have a photo library.", { "OK" } )
end
end


function scene:create( event )

end


function scene:show( event )                    
local isXcodeSimulator = "iPhone Simulator" == system.getInfo("model")
if (isXcodeSimulator) then
	 local alert = native.showAlert( "Information", "Camera API not available on iOS Simulator.", { "OK"})    
end

onComplete()
end


function scene:exit( event )
	local group = self.view
            _G.GUI.RemoveAllWidgets()
         composer.removeScene("vphoto")
        composer.purgeScene("vphoto")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

--return scene



