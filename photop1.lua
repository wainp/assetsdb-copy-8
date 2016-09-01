require "sqlite3"
--require "CiderDebugger"
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
_G.GUI = require("widget_candy")
local evd, pfile, ocomments, odates







local function dbsavedb( event )
    
local path = system.pathForFile("pictures.db", system.DocumentsDirectory)
local picsave = sqlite3.open( path ) 
ocomments="3"
odates="4"

  
  local tablefill = [[INSERT INTO Opics VALUES (NULL, ']]..aoffice..[[',']]..pfile..[[',']]..ocomments..[[',']]..odates..[['); ]]
  picsave:exec( tablefill )
    picsave:close()
end




 local function pvonSendSMS( event )
	
end
   
 local function onSendSMS( event )
   
end

function scene:create( event )

end


function scene:show( event )
    local group = self.view
        _G.GUI.RemoveAllWidgets()
         composer.removeScene("photooffice")
        composer.purgeScene("photooffice")
        evd="default"
local titleBar = display.newRect( halfW, 0, display.contentWidth, 32 )
titleBar:setFillColor( titleGradient ) 
titleBar.y = titleBar.contentHeight * 0.5
-- Camera not supported on simulator.  
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
		fontSize        = 45,
		textColor       = {.25,.25,.25},
		textColorActive = {1,1,1},
		textAlign       = "bottom",
		iconAlign       = "top",
		icons           = 
			{
				{icon = 13 , flipX = false, text = "Intro"},
				{icon = 11 , flipX = false, text = "Assets"},
				{icon = 17, flipX = false, text = "Search"},
                                {icon = 18, flipX = false, text = "Config"},
			},
                        
             onPress         = function(EventData)
                                print("ICON "..EventData.selectedIcon.." PRESSED!") 
                                
                                selectd=EventData.selectedIcon
                                print(selectd)
                                if selectd==4 then composer.gotoScene("configg")end
                                if selectd==3 then composer.gotoScene("options")end
                                if selectd==2 then composer.gotoScene("oassets")end
                                if selectd==1 then composer.gotoScene("intro")end
                                
                                end, 
		} )

	-- SELECT ICON NUMBER 1
	_G.GUI.GetHandle("BAR1"):setMarker(3)



local bkgd = display.newRect( centerX, centerY, _W/2, _H/5 )

bkgd:setFillColor( 0.5, 0, 0 )

local text = display.newText( "Tap redbox to launch Camera", centerX, centerY, nil, 16 )

local isXcodeSimulator = "iPhone Simulator" == system.getInfo("model")
if (isXcodeSimulator) then
	 local alert = native.showAlert( "Information", "Camera API not available on iOS Simulator.", { "OK"})    
end


local sessionComplete = function(event)	
	local image = event.target
        print( "hello" )
	print( "Camera ", ( image and "returned an image" ) or "session was cancelled" )
	print( "event name: " .. event.name )
	print( "target test: " .. tostring( image ) )
        local alert = native.showAlert( "Corona", "Dream. Build. Ship.", { "OK", "Learn More" } )
	--if image then
		-- center image on screen
	--	image.x = centerX
	--	image.y = centerY
	--	local w = image.width
	--	local h = image.height
	--	print( "w,h = ".. w .."," .. h )
       dbsavedb()        
	--end
end

local listener = function( event )
    local now= os.time()
      pfile=aoffice..now
	if media.hasSource( media.Camera ) then
               -- media.capturePhoto( { listener = sessionComplete
		media.capturePhoto( { listener = sessionComplete, destination = {baseDir = system.TemporaryDirectory,filename = pfile..".jpg",type = "image"
   } } )
	else
		native.showAlert("Corona", "Camera not found.")
	end
        --pfile=pfile..".jpg"
  
end
 bkgd:addEventListener( "tap", listener )
 
end
function scene:exit( event )
	local group = self.view
      --  dbsavedb()
      --  _G.GUI.GetHandle("Bar1"):show(false)
      --  _G.GUI.RemoveAllWidgets()
      --   composer.removeScene("photop")
      --  composer.purgeScene("photop")
end

function scene:destroy( event )
dbsavedb()	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "destroy",scene )

return scene