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
		width           = 300,
		height          = "auto",
		minHeight       = 50,
		theme           = _G.theme,
		name            = "WIN_SAMPLE",
		caption         = "THIS IS A WINDOW",
		textAlign       = "center",
		icon            = 19,
		fadeInTime      = 500,

		margin          = 20,
		noTitle         = false,
		shadow          = true,
		closeButton     = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		onPress         = function(EventData) print("WINDOW PRESSED!") end,
		onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		onRelease       = function(EventData) print("WINDOW RELEASED!") end,
		onWidgetPress   = function(EventData) print("WINDOW WIDGET PRESSED: "..EventData.name) end,
		onClose         = function(EventData) _G.UnloadSample() end,
		} )

	-- TEXT LABEL
	_G.GUI.NewLabel(
		{
		x               = "center",
		y               = "auto",
		parentGroup     = "WIN_SAMPLE",
		width           = "100%",
		theme           = _G.theme,
		caption         = "Some sample text...",
		textAlign       = "center",
		} )

	-- CREATE A HORIZONTAL SLIDER
	_G.GUI.NewSlider(
		{
		x                 = "center",
		y                 = "auto",
		width             = "90%",
		vertical          = false,
		parentGroup       = "WIN_SAMPLE",
		theme             = _G.theme,
		minValue          = 1,
		maxValue          = 50,
		value             = 10,
		step              = 1,
		tickStep          = 4,
		textFormatter     = function(value) return "My Value: "..value end,
		} )
	
	-- AUTO-ARRANGE (POSITION) ALL WIDGETS INSIDE THIS 
	-- WINDOW AND AUTOMATICALLY SET THE WINDOW'S HEIGHT
	_G.GUI.GetHandle("WIN_SAMPLE"):layout(true) 
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	_G.GUI.GetHandle("WIN_SAMPLE"):destroy() 
end

return V
