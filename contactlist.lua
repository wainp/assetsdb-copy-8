--blank form for mcst

local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

-- Our scene
function scene:createScene( event )
	local group = self.view
	
	-- Display a background
	local background = display.newImage( "assets/background.png", display.contentCenterX, display.contentCenterY, true )
	group:insert( background )

end
function scene:exitScene( event )
	local group = self.view
end
function scene:enterScene( event )
	local group = self.view
        native.showPopup( "addressbook", pickContacts )
end
function scene:destroyScene( event )
	local group = self.view
end
scene:addEventListener( "createScene" )
scene:addEventListener( "exitScene" )
scene:addEventListener( "enterScene" )
scene:addEventListener( "destroyScene" )
return scene


