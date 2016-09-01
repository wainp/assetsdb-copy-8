
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


local function dbsavedb( event )
    
    
--local path = system.pathForFile("Pictures.db", system.DocumentsDirectory)
local path = system.pathForFile("Pictures.db", system.DocumentsDirectory)
 picsave = sqlite3.open( path ) 
ocomments="3"
odates="4"
--local tablefill =[[INSERT INTO files VALUES (NULL, (@img.jpg)); ]]
--db:exec( tablefill )
  local tablefill2 =[[INSERT INTO Opics VALUES (NULL, ']]..alocat..[[',']]..pfile..".jpg"..[[',']].."@"..pfile..".jpg"..[[',']]..odates..[['); ]]
  --local tablefill = [[INSERT INTO Opics VALUES (NULL, ']]..aoffice..[[',']]..pfile..[[',']]..ocomments..[[',']]..odates..[['); ]]
  picsave:exec( tablefill2 )
    picsave:close()
end

 local function pvonSendSMS( event )
	
end
   
 local function onSendSMS( event )
   
end

function scene:create( event )

end


function scene:show( event )
-- Camera not supported on simulator.                    
local isXcodeSimulator = "iPhone Simulator" == system.getInfo("model")
if (isXcodeSimulator) then
	 local alert = native.showAlert( "Information", "Camera API not available on iOS Simulator.", { "OK"})    
end

--
bkgd = display.newRect( centerX, centerY, _W, _H )
bkgd:setFillColor( 0.5, 0, 0 )

local text = display.newText( "Tap anywhere to launch Camera", centerX, centerY, nil, 12 )

local sessionComplete = function(event)	
	local image = event.target

	print( "Camera ", ( image and "returned an image" ) or "session was cancelled" )
	print( "event name: " .. event.name )
	print( "target: " .. tostring( image ) )
        dbsavedb()
        local stopalert = native.showAlert( "Information", pfile, { "OK"})   
	
end

local listener = function( event )
    local now = os.date("%c" )
   -- ( os.date( "%c" ) )
    pfile=aoffice..now
    alocat=aoffice
	if media.hasSource( media.Camera ) then
                media.capturePhoto( { listener = sessionComplete,
                destination = {
               --media.PhotoLibrary,
               baseDir = system.DocumentsDirectory,
                filename = (pfile..".jpg"),
                type = "image" }} )
                --media.capturePhoto( { listener = sessionComplete,
                --destination = {
                --baseDir = system.DocumentsDirectory,
                --filename = (pfile..".jpg"),
                --type = "image" }} )
        else                                                                  
		native.showAlert("Corona", "Camera not found.")
	end
	return true
end
bkgd:addEventListener( "tap", listener )
end
function scene:exit( event )
	local group = self.view
        _G.GUI.GetHandle("Bar1"):show(false)
        bkgd:removeSelf()
        bkgd = nil
         text:removeSelf()
        text = nil
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("photop")
        composer.purgeScene("photop")
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene

