-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A WINDOW
	_G.GUI.NewWindow(
		{
		x               = "center",
		y               = "center",
		scale           = _G.GUIScale,
		parentGroup     = nil,
		width           = 180,
		height          = "auto",
		minHeight       = 50,
		theme           = _G.theme,
		name            = "WIN_SAMPLE",
		caption         = "IMAGE",
		textAlign       = "center",
		icon            = 43,

		margin          = 20,
		shadow          = true,
		closeButton     = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		onPress         = function(EventData) print("WINDOW PRESSED!") end,
		onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		onRelease       = function(EventData) print("WINDOW RELEASED!") end,
		onClose         = function(EventData) _G.UnloadSample() end,
		} )

	-- ADD CUSTOM IMAGE (CAN ALSO BE A SHAPE, GROUP ETC.)
	-- DO NOT FORGET TO SET YOUR REFERENCES TO THIS OBJECT
	-- TO NIL IF YOU DO NOT NEED IT ANYMORE -SEE V.Remove() BELOW:
	V.Image = display.newImage("images/image.png")
	
	_G.GUI.NewImage( V.Image, 
		{
		x               = "center",                
		y               = 0, 
		width           = 160,
		height          = 160,
		name            = "IMG_SAMPLE",            
		parentGroup     = "WIN_SAMPLE",
		border          = {"inset",4,1, .96,1,.9,.19}, 
		onPress         = function(EventData) print("IMAGE PRESSED!"); EventData.Widget:setImage(display.newImage("images/image2.png"), false)  end,
		onRelease       = function(EventData) print("IMAGE RELEASED!"); EventData.Widget:setImage(display.newImage("images/image.png"), false)  end,
		onDrag          = function(EventData) print("IMAGE DRAGGING!") end,
		} )
		
	_G.GUI.GetHandle("WIN_SAMPLE"):layout(true)

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("IMG_SAMPLE"):destroy(false) -- TRUE: KEEP THE IMAGE, FALSE (DEFAULT): REMOVE IT AS WELL
	_G.GUI.GetHandle("WIN_SAMPLE"):destroy() 
	V.Image = nil
end

return V
