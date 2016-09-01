-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A SHAPE BUTTON WITH TEXT
	_G.GUI.NewShapeButton(
		{
		x               = "center",                
		y               = display.contentHeight * .2, 
		width           = 300,
		height          = 50,
		border          = {"normal",6,1, 1,1,1,.78,  0,0,0,1}, 
		pressColor      = {.78,.58,0,1},
		name            = "BUT_SHAPE1",  
		parentGroup     = nil,  
		caption         = "SHAPE BUTTON WITH TEXT",
		textColor       = {.19,.19,.19},
		textAlign       = "center",
		theme           = _G.theme,               
		icon            = 9,
		shineAlpha      = .15,

		onPress         = function(EventData) print("Pressed - Button")  end,
		onRelease       = function(EventData) print("Released - Button") end,
		} )

	-- CREATE A SHAPE TOGGLE BUTTON
	_G.GUI.NewShapeButton(
		{
		x               = "center",                
		y               = display.contentHeight * .4, 
		width           = 300,
		height          = 50,
		border          = {"normal",6,1, 1,1,1,.78,  0,0,0,1}, 
		pressColor      = {.78,.58,0,1},
		name            = "BUT_SHAPE2",  
		parentGroup     = nil,  
		caption         = "TOGGLE BUTTON",
		textColor       = {.19,.19,.19},
		textAlign       = "center",
		theme           = _G.theme,               
		icon            = 10,
		shineAlpha      = .15,
		flipIconX       = false,
		toggleButton    = true,
		toggleState     = false,

		onPress         = function(EventData) print("Pressed - Toggle Button.") end,
		onRelease       = function(EventData) 
					EventData.Widget:set("flipIconX", EventData.toggleState)
					print("Released - Toggle Button. Toggle State:")
					print(EventData.toggleState) 
				end,
		} )

	-- CREATE A SHAPE BUTTON WITH IMAGE
	_G.GUI.NewShapeButton(
		{
		x               = "center",                
		y               = display.contentHeight * .6, 
		width           = 60,
		height          = 60,
		border          = {"normal",6,1, 1,1,1,.78,  0,0,0,1}, 
		pressColor      = {.78,.58,0,1},
		name            = "BUT_SHAPE3",  
		parentGroup     = nil,  
		caption         = "",
		theme           = _G.theme,               
		shineAlpha      = .15,
		
		-- YOU CAN USE EITHER ICONS FROM THEME'S ICON SHEET OR CUSTOM IMAGES
		--icon          = 8,                              -- ICON NUMBER ON ICON SHEET
		image           = "images/custom_icon4.png",      -- IMAGE FILE TO BE USED FOR THIS ITEM
		baseDir         = system.ResourceDirectory,       -- IMAGE FILE BASE DIRECTORY (F.E. system.DocumentsDirectory ETC. )
		
		onPress         = function(EventData) print("Pressed - Button")  end,
		onRelease       = function(EventData) print("Released - Button") end,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_SHAPE1"):destroy()
	_G.GUI.GetHandle("BUT_SHAPE2"):destroy()
	_G.GUI.GetHandle("BUT_SHAPE3"):destroy()
end

return V
