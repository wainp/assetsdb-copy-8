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
		fadeInTime      = 500,
		margin          = 10,

		noTitle         = true, -- <-- NO TITLE CAPTION, NO ICON, NO CLOSE BUTTON

		shadow          = true,
		dragX           = true,
		dragY           = true,
		slideOut        = .7,
		dragArea        = "auto",
		onPress         = function(EventData) print("WINDOW PRESSED!") end,
		onDrag          = function(EventData) print("WINDOW DRAGGED!") end,
		onRelease       = function(EventData) print("WINDOW RELEASED!") end,
		} )

	-- TEXT LABEL
	_G.GUI.NewLabel(
		{
		x               = "center",
		y               = "auto",
		topMargin       = 10,
		parentGroup     = "WIN_SAMPLE",
		width           = "100%",
		theme           = _G.theme,
		caption         = "Some sample text...",
		textAlign       = "center",
		} )

	-- CREATE A HORIZONTAL SLIDER
	_G.GUI.NewButton(
		{
		x               = "center",
		y               = "auto",
		width           = "90%",
		parentGroup     = "WIN_SAMPLE",
		theme           = _G.theme,
		caption         = "Close Window", 
		textAlign       = "center",
		onRelease       = function(EventData) _G.GUI.GetHandle("WIN_SAMPLE"):destroy() end
		} )
	
	-- AUTO-ARRANGE (POSITION) ALL WIDGETS INSIDE THIS 
	-- WINDOW AND AUTOMATICALLY SET THE WINDOW'S HEIGHT
	_G.GUI.GetHandle("WIN_SAMPLE"):layout(true) 
end


----------------------------------------------------------------
-- THIS FUNCTION IS CALLED BY MAIN.LUA TO REMOVE THE WIDGET
----------------------------------------------------------------
V.Remove = function() 
	local Win = _G.GUI.GetHandle("WIN_SAMPLE")
	if Win then Win:destroy() end 
end

return V
