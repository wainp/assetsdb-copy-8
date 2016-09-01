require "sqlite3"
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
local halfW = display.contentCenterX
local halfH = display.contentCenterY
local widget = require( "widget" )
local rep, dcrew, junkf, junkn, junkc, pvsmsto, junkl
local rb_reader = require "rb-reader"

 
function scene:create( event )

end


function scene:show( event )


-- shows the reader on screen
local readerShowOptions = {
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = display.contentWidth * 0.94,
        height = display.contentHeight * 0.5,
        --fill = { type="image", filename="bar.jpg" } -- this param is optional, being used here to fill where the camera will appear
    }
    
if system.getInfo("environment") == "simulator" then readerShowOptions.fill={ type="image", filename="bar.jpg" }; end -- showing an image instead of camera when running on Simulator
rb_reader.show(readerShowOptions)



-- onComplete listener.
local function afterRead(event)
    -- return event.result (boolean), event.code (string)
    
    print("Read result=", event.result)
    print("Code=", event.code)  
    if event.result then
        barCodeText.text= "BAR CODE FOUND = " .. event.code 
    else
        barCodeText.text= "BAR NOT FOUND"
    end    
end

local originalGuideWidth = rb_reader:getReaderWidth()

local function buttonReadHandler()    
    
    barCodeText.text= "READING"
    
    -- read the bar code on screen
    rb_reader.read{
                   -- readCount = newStepper:getValue(),
                    onComplete=afterRead
                }
end








-- title text
--local myText = display.newText( "Hello World!", 100, 200, native.systemFont, 16 )
--myText:setFillColor( 1, 0, 0 )
font=native.systemFontBold
width=display.contentWidth
align=center
barCodeText = display.newText("Assets", 100, 200, native,systemFont, 16)
barCodeText.x = display.contentCenterX
barCodeText.y = display.screenOriginY + 30
barCodeText:setFillColor(0,0,0)



local widget = require "widget"


_G.GUI.NewButton(
		{
		x               = "center",                
		y               = "bottom",                
		width           = "30%",    
                height          = "10%",
		scale           = _G.GUIScale,
		name            = "bc", 
                fontSize        = "30", 
		parentGroup     = nil,                     
		theme           = _G.theme,               
		caption         = "Scan Barcode", 
		textAlign       = "center",                  
		icon            = 20,  
		flipIconX       = true,
		flipIconY       = false,
		border          = {"shadow", 8,8, .25},
		onPress         = function(EventData) EventData.Widget:set("caption", "Button pressed!")  end,
		onRelease       = function(EventData) 
							buttonReadHandler()
						  end,
		} )


end


function scene:exit( event )
	
end

function scene:destroy( event )
	
end


scene:addEventListener( "create",scene )
scene:addEventListener( "exit",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "destroy",scene )

return scene


