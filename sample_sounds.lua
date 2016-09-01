-- WHEN A SAMPLE HAS BEEN CHOSEN FROM THE LIST, MAIN.LUA LOADS A SAMPLE
-- CODE AND CALLS ITS Create() FUNCTION. TAPPING THE BACK BUTTON 
-- (ALSO CREATED IN MAIN.LUA) CALLS THE Remove() FUNCTION OF THE LOADED 
-- SAMPLE CODE TO REMOVE THE SAMPLE WIDGETS AGAIN. 

local V = {}

----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA AND CREATES THE WIDGET
----------------------------------------------------------------
V.Create = function()

	-- CREATE A HORIZONTAL SLIDER
	_G.GUI.NewSlider(
		{
		x               = "center",
		y               = display.contentHeight*.2,
		name            = "SLD_1",
		width           = 200,
		scale           = _G.GUIScale,
		vertical        = false,
		parentGroup     = nil,
		theme           = "theme_1",
		minValue        = 1,
		maxValue        = 50,
		value           = 10,
		step            = 5,
		tickStep        = 2,  -- SET TO NIL OR < 2 TO HIDE TICKS
		textFormatter   = function(value) return "My Value: "..value end,
		
		changeSound     = 3, -- SOUNDS ARE SPECIFIED IN A THEME'S SETTINGS FILE
		} )

	-- CREATE A SIMPLE BUTTON
	_G.GUI.NewButton(
		{
		x               = "center",                
		y                 = display.contentHeight*.4,
		width           = 200,                   
		scale           = _G.GUIScale,
		name            = "BUT_1",            
		parentGroup     = nil,                     
		theme           = "theme_1",               
		caption         = "Click Me", 
		textAlign       = "left",                  
		icon            = 39,    
		border          = {"shadow", 8,8, .25},
		
		tapSound        = 1, -- SOUNDS ARE SPECIFIED IN A THEME'S SETTINGS FILE
		releaseSound    = 2, 
		} )

	-- CREATE INPUT TEXT
	_G.GUI.NewInput(
		{
		x               = "center",
		y                 = display.contentHeight*.6,
		parentGroup     = nil,
		width           = 200,
		scale           = _G.GUIScale,
		theme           = "theme_1",
		name            = "INP_1",
		caption         = "Type here...",
		notEmpty        = true,
		textColor       = {.07,.14,.07},
		inputType       = "default", -- "number" | "password" | "default"
		allowedChars    = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -'.",
		quitCaption     = "Tap screen to finish text input.",
		
		tapSound        = 1, -- SOUNDS ARE SPECIFIED IN A THEME'S SETTINGS FILE
		releaseSound    = 2, 
		changeSound     = 4,
		} )

	-- CREATE A SWITCH
	_G.GUI.NewSwitch(
		{
		x               = "center",                
		y                 = display.contentHeight*.8,
		width           = 200,
		scale           = _G.GUIScale,
		name            = "SWT_1",            
		parentGroup     = nil,
		theme           = "theme_1",
		toggleState     = true,
		textAlign       = "left",
		textColor       = {1,1,1},
		caption         = "Toggle me!",
		
		changeSound     = 5,
		} )

end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("BUT_1"):destroy() 
	_G.GUI.GetHandle("SWT_1"):destroy() 
	_G.GUI.GetHandle("SLD_1"):destroy() 
	_G.GUI.GetHandle("INP_1"):destroy() 
end

return V
